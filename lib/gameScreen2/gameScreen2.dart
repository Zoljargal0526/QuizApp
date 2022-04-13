import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../gameScreen/word.dart';
import '../shared_pref.dart';
import 'image_container.dart';

class GameScreen2 extends StatefulWidget {
  const GameScreen2({Key? key}) : super(key: key);
  @override
  State<GameScreen2> createState() => GameScreen2State();
}

late DatabaseReference ref;
List<Word> words = List.empty(growable: true);
int r = 0;
int k = 0;

class GameScreen2State extends State<GameScreen2> {
  @override
  void initState() {
    getListWordData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Зөв хариуг ол"),
      ),
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.blueAccent, Colors.lightBlueAccent, Colors.white])),
        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.all(Radius.circular(20))),
              width: double.maxFinite,
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.count(physics: NeverScrollableScrollPhysics(), childAspectRatio: 1, crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, children: [
                  for (Word w in words)
                    ImageCon(
                      word: w,
                      result: words.isEmpty ? "" : words[r].name,
                    ),
                ]),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 5,
                    bottom: 10,
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 10) * 0.7,
                      height: double.maxFinite,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/gameScreen2images/greenboard.png"))),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: Center(
                            child: AutoSizeText(
                              words.isEmpty ? "" : "${words[r].mon[0].toUpperCase()}${words[r].mon.substring(1).toLowerCase()}" + " аль нь вэ?",
                              minFontSize: 40,
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      bottom: 0,
                      child: Container(
                        height: double.maxFinite,
                        child: Image(image: AssetImage("lib/assets/gameScreen2images/mainChar.png")),
                      )),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      width: 180,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2, style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.elliptical(120, 50)),
                          color: Colors.white),
                      height: 75,
                      child: Center(
                        child: AutoSizeText(
                          "Амжилт хүсье. Чи олж чаднаа.",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void getListWordData() async {
    Set<int> setOfInts = Set();
    k = (await Shared.db.countWords())!;
    print(k);
    while (setOfInts.length < 4) {
      setOfInts.add(Random().nextInt(k - 1) + 1);
    }
    r = Random().nextInt(3); // 0 1 2 3
    words = List.empty(growable: true);
    for (var i in setOfInts.toList()) {
      var w = await (Shared.db.getSearchWordById(i)) ?? Word();
      words.add(w);
    }
    setState(() {
      words;
    });
  }
}
