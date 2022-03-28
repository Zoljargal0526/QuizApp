import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/storage.dart';
import 'package:quiz_app/word.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController txtController = TextEditingController();
  late Database db;
  late Storage storage;
  late Word v;
  late Future<String> url;
  AudioPlayer audioPlayer = AudioPlayer();
  int _levelData = 1;
  late SharedPreferences _prefs;
  @override
  void initState() {
    super.initState();
    db = Database();
    getLevel();
    storage = Storage();
    v = new Word(name: "", imagePath: "", audio_file: "audio_file", quiz: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: txtController,
              decoration: InputDecoration(hintText: "Enter a word"),
            ),
            SizedBox(height: 20),
            Text(_levelData.toString()),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  txtController.text.isNotEmpty ? db.addData(txtController.text) : null;
                },
                child: Text("Add a word")),
            ElevatedButton(
                onPressed: () async {
                  if (txtController.text.isNotEmpty) {
                    v = (await db.getData(txtController.text))!;
                    setState(() {});
                  }
                },
                child: Text("Print value")),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    incrementLevel(_levelData);
                  });
                  url = storage.downloadURL("sounds/Congratulations.mp3");
                  play(await url);
                },
                child: Text("Play sound")),
            FutureBuilder(
                future: storage.downloadURL(v.imagePath),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    return Container(
                        width: 300,
                        height: 250,
                        child: Image.network(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        ));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return Container();
                })
          ],
        ),
      ),
    );
  }

  Future<void> getLevel() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      _levelData = (_prefs.getInt('level') ?? 1);
    });
  }

  Future<void> incrementLevel(int level) async {
    _prefs = await SharedPreferences.getInstance();
    level = (_prefs.getInt('level') ?? 1) + 1;
    _prefs.setInt("level", level);
    setState(() {
      _levelData = level;
    });
  }

  play(String url) async {
    int result = await audioPlayer.play(url);
    if (result == 0) {
      print("Error");
    }
  }
}
