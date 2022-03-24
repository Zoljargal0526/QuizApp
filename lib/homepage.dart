import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/storage.dart';
import 'package:quiz_app/word.dart';

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
  @override
  void initState() {
    super.initState();
    db = Database();
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
            ElevatedButton(
                onPressed: () {
                  txtController.text.isNotEmpty ? db.addData(txtController.text) : null;
                },
                child: Text("Add a word")),
            ElevatedButton(
                onPressed: () async {
                  if (txtController.text.isNotEmpty) {
                    v = (await db.getData(txtController.text))!;
                    print(v.imagePath);
                    setState(() {});
                  }
                },
                child: Text("Print value")),
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
}
