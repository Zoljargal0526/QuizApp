import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/gameScreen3/chap3_answerButton.dart';

import '../shared_pref.dart';
import 'chapterDataModel3.dart';
import 'hints.dart';

class GameScreen3 extends StatefulWidget {
  const GameScreen3({Key? key}) : super(key: key);

  @override
  State<GameScreen3> createState() => _GameScreen3State();
}

class _GameScreen3State extends State<GameScreen3> {
  String BackImagePath = "";
  String BlackBackImagePath = "";
  String level = "1";
  ChapterDataModel3 c = ChapterDataModel3();
  bool answer = false;
  List<String> answers = List.empty(growable: true);

  @override
  void initState() {
    level = Shared.prefs.getInt('level').toString();
    getChapterdata3("1");
    final _random = new Random();
    while (answers.length < 5) {
      String item = Shared.randomstr[_random.nextInt(Shared.randomstr.length)];
      if (answers.contains(item) == false) answers.add(item);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 30) / 3;
    double height = (MediaQuery.of(context).size.height / 4 - 40) / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black.withOpacity(0.5), width: 3, style: BorderStyle.solid),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Colors.red, Colors.yellow])),
                child: Center(
                    child: Text(
                  "Энэ ямар амьтан бэ?",
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ))),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.lightBlueAccent, Colors.blue, Colors.greenAccent, Colors.green])),
        child: Column(children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: double.maxFinite,
                  padding: EdgeInsets.all(5),
                  child: BlackBackImagePath.isNotEmpty
                      ? Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2, style: BorderStyle.solid)),
                          child: Image(
                            image: !answer ? NetworkImage(BlackBackImagePath) : NetworkImage(BackImagePath),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Center(child: CircularProgressIndicator()),
                ),
                Expanded(
                    child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child: Hints(hint: c.hint1)),
                      Expanded(child: Hints(hint: c.hint2)),
                      Expanded(child: Hints(hint: c.hint3)),
                    ],
                  ),
                ))
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.transparent,
                  child: GridView.count(
                    childAspectRatio: (width / height),
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      for (int i = 0; i < answers.length; i++)
                        Chap3AnswerButton(
                          answer: answers[i],
                          result: c.result,
                        )
                    ],
                  )))
        ]),
      ),
    );
  }

  Future<void> getChapterdata3(String level) async {
    c = await Shared.db.getChapterData3(level) ?? ChapterDataModel3();
    BackImagePath = await Shared.storagef.downloadURL(c.backgroundPath) as String;
    BlackBackImagePath = await Shared.storagef.downloadURL(c.blackbackgroundPath) as String;
    answers.add(c.result);
    answers.shuffle();
    setState(() {});
  }
}
