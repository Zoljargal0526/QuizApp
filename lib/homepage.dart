import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/gameScreen/word.dart';
import 'package:quiz_app/shared_pref.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController txtController = TextEditingController();
  late Future<String> url;
  late Word v;
  @override
  void initState() {
    super.initState();
    v = Word(name: "", imagePath: "", mon: "");
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
            Text(Shared.prefs.getInt('level').toString()),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  txtController.text.isNotEmpty ? Shared.db.addData(txtController.text) : null;
                },
                child: Text("Add a word")),
            ElevatedButton(
                onPressed: () async {
                  if (txtController.text.isNotEmpty) {
                    v = (await Shared.db.getWordData(txtController.text))!;
                    setState(() {});
                  }
                },
                child: Text("Print value")),
            ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  url = Shared.storagef.downloadURL("sounds/Congratulations.mp3");
                  Shared.audioPlayerR.play(await url);
                },
                child: Text("Play sound")),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    //int? level = Shared.prefs.getInt('level')! + 1;
                    Shared.prefs.setInt('level', 1);
                    Shared.prefs.setInt('level2', 1);
                    Shared.prefs.setInt('level3', 1);
                    Shared.prefs.setInt('level4', 1);
                  });
                },
                child: Text("Set 1")),
            FutureBuilder(
                future: Shared.storagef.downloadURL(v.imagePath),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    print(v.imagePath);
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
}
