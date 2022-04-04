import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/gameScreen2/imageContainer.dart';

import '../gameScreen/word.dart';

class GameScreen2 extends StatefulWidget {
  const GameScreen2({Key? key}) : super(key: key);

  @override
  State<GameScreen2> createState() => _GameScreen2State();
}

late DatabaseReference ref;
List<Word> words = List.empty(growable: true);

class _GameScreen2State extends State<GameScreen2> {
  @override
  void initState() {
    getListWordData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(10),
        child: Wrap(
          children: [
            for (var w in words) ImageContainer(word: w),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     ImageContainer(key: Key("word1"), word: getSearchWord(setOfInts.elementAt(0))),
            //     ImageContainer(key: Key("word2"), word: getSearchWord(setOfInts.elementAt(1))),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     ImageContainer(key: Key("word3"), word: getSearchWord(setOfInts.elementAt(2))),
            //     ImageContainer(key: Key("word4"), word: getSearchWord(setOfInts.elementAt(3))),
            //   ],
            // ),
            GestureDetector(
              child: Text(
                "Negiig n songo",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  void getListWordData() async {
    /*var rng = new Random();
    var l = new List.generate(4, (_) => rng.nextInt(5) + 1);
    print("Random number=" + l[0].toString());
    String a = l[0].toString();
    getSearchWord(l[0]);
*/
    Set<int> setOfInts = Set();
    while (setOfInts.length < 4) {
      setOfInts.add(Random().nextInt(5) + 1);
    }
    words = List.empty(growable: true);
    for (var i in setOfInts.toList()) {
      var w = await (getSearchWord(i)) ?? Word();
      words.add(w);
    }
    setState(() {
      words;
    });
  }

  Future<Word?> getSearchWord(int value) async {
    ref = FirebaseDatabase.instance.ref("words");
    var data = await ref.orderByChild("/id").equalTo(value).once();
    //var data = await ref.limitToFirst(value).once();
    var refData = data.snapshot.value as Map? ?? {};
    var rData = refData.values.first; // river:{name="river"} iig {name="river"} bolgoson
    //print(rData["name"]);
    if (rData.isNotEmpty) {
      Word word = Word(name: "", imagePath: "", mon: "");
      word.name = rData["name"];
      word.imagePath = rData["image"];
      word.mon = rData["mon"];
      return word;
    }
    return null;
  }
}
