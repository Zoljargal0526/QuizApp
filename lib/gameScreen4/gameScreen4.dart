import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/gameScreen/Dialogs.dart';
import 'package:quiz_app/gameScreen4/chapterDataModel4.dart';

import '../shared_pref.dart';
import 'dragdrop.dart';

class GameScreen4 extends StatefulWidget {
  const GameScreen4({Key? key}) : super(key: key);
  static List<String> check = ["", "", ""];
  static List<bool> checkDrag = [false, false, false];
  static List<bool> checkD = [false, false, false];
  @override
  State<GameScreen4> createState() => _GameScreen4State();
}

class _GameScreen4State extends State<GameScreen4> {
  ChapterDataModel4 c = ChapterDataModel4();
  String BackImagePath = "";
  String level = "1";
  bool answer = false;
  List<String> answers = List.empty(growable: true);
  List<String> hint = ['Өгүүлэгдэхүүн', 'Тусагдахуун', 'Өгүүлэхүүн'];
  @override
  void initState() {
    GameScreen4.check = ["", "", ""];
    print(GameScreen4.check);
    GameScreen4.checkDrag = [false, false, false];
    GameScreen4.checkD = [false, false, false];
    level = Shared.prefs.getInt('level4').toString();
    getChapterdata4(level);
    super.initState();
  }

  int count = 0;
  void _update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Expanded(
                child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => GameScreen4()));
                    },
                    icon: Icon(Icons.refresh)),
                Text(
                  "Тэр юу хийж байна вэ?",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.notifications))
              ],
            ))
          ],
        ),
        body: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.yellow, style: BorderStyle.solid, width: 3),
                    ),
                    child: BackImagePath != "" ? Image(image: NetworkImage(BackImagePath), fit: BoxFit.cover) : Center(child: CircularProgressIndicator()),
                  )),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(color: Colors.blue, image: DecorationImage(image: AssetImage("lib/assets/chapterImages/chap4back.png"), fit: BoxFit.cover)),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 0; i < answers.length; i++)
                            DragDrop(
                              value: answers,
                              hint: hint[i],
                              id: i,
                              update: _update,
                            ),
                        ],
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                          onPressed: () {
                            Timer(Duration(seconds: 2), () {
                              if (c.word1 == GameScreen4.check[0] && c.word2 == GameScreen4.check[1] && c.word3 == GameScreen4.check[2]) {
                                showDialog(
                                    context: context,
                                    builder: (_) => Dialogs(
                                          type: "win",
                                          screenNum: 4,
                                        ),
                                    barrierDismissible: false);
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (_) => Dialogs(
                                          type: "lose",
                                          screenNum: 4,
                                        ),
                                    barrierDismissible: false);
                              }
                            });
                          },
                          child: Text("Шалгах")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> getChapterdata4(String level) async {
    c = await Shared.db.getChapterData4(level) ?? ChapterDataModel4();
    BackImagePath = await Shared.storagef.downloadURL(c.backgroundPath) as String;
    answers.add(c.word1);
    answers.add(c.word2);
    answers.add(c.word3);
    answers.shuffle();
    setState(() {});
  }
}
