import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/gameScreen/answer_letter_button.dart';
import 'package:quiz_app/gameScreen/chapter_data_model.dart';
import 'package:quiz_app/gameScreen/result_letter_box.dart';

import '../shared_pref.dart';
import 'Dialogs.dart';
import 'word.dart';

class GameScreen extends StatefulWidget {
  final String title;
  const GameScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final TextEditingController txtController = TextEditingController();
  late Future<String> url;
  String chapTitle = "";
  String BackImagePath = "";
  String level = "1";
  Word v = Word();

  ChapterDataModel c = ChapterDataModel();
  List<String> alphabetList = List.empty();
  List<String> answer = List.empty();
  List<String> result = List.empty();
  String dialogType = "";
  bool shuffled = false;
  int size = 0;
  double pos = 20;
  int a = 0, plus = 50;

  @override
  void initState() {
    chapTitle = widget.title;
    level = Shared.prefs.getInt('level').toString();
    getChapterdata(chapTitle, level);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double minSpace = MediaQuery.of(context).size.width * 0.1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                Text(
                  chapTitle + " " + level + "-р үе",
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.lightbulb))
              ],
            ),
          ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Stack(children: [
                  if (BackImagePath.isNotEmpty)
                    Positioned.fill(
                      child: Container(
                        child: Image.network(
                          BackImagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  Positioned(
                    top: 10,
                    left: minSpace * 2,
                    right: minSpace * 2,
                    child: GestureDetector(
                      child: Container(
                          height: 50,
                          color: Colors.yellow,
                          child: Center(
                              child: AutoSizeText(
                            c.hint,
                            maxLines: 2,
                            style: TextStyle(fontSize: 25),
                          ))),
                      onTap: () {
                        move();
                      },
                    ),
                  ),
                  AnimatedPositioned(
                      top: 100,
                      left: pos,
                      duration: Duration(seconds: 1),
                      child: GestureDetector(
                        onTap: () {
                          back();
                        },
                        child: Container(
                            height: 50,
                            color: Colors.orange,
                            child: const Center(
                                child: AutoSizeText(
                              "Object",
                              maxLines: 1,
                              style: TextStyle(fontSize: 25),
                            ))),
                      )),
                  Positioned(
                    left: minSpace,
                    right: minSpace,
                    bottom: 10,
                    child: Container(
                        padding: EdgeInsets.all(5),
                        color: Colors.green,
                        child: Wrap(
                          direction: Axis.horizontal,
                          runSpacing: 10,
                          alignment: WrapAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < v.mon.length; i++)
                              GestureDetector(
                                child: ResultLetterBox(letter: answer[i]),
                                onTap: () {
                                  answer[i] = "";
                                  setState(() {});
                                  size > 0 ? size-- : size = 0;
                                  result[i] = "";
                                },
                              ),
                          ],
                        )),
                  ),
                ]),
              )),
          Expanded(
              flex: 1,
              child: Container(
                width: minSpace * 10,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Wrap(
                      runSpacing: minSpace / 3,
                      spacing: minSpace / 5,
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < alphabetList.length; i++)
                          GestureDetector(
                              child: AnswerLetterButton(
                                width: minSpace,
                                height: minSpace,
                                letter: alphabetList[i],
                                isSelected: result.contains(i.toString()) && size <= v.mon.length ? true : false,
                              ),
                              onTap: () {
                                if (!result.contains(i.toString())) {
                                  if (size <= v.mon.length) {
                                    if (!result.contains(i.toString())) {
                                      if (size < v.mon.length) {
                                        result[size] = i.toString();
                                      }
                                    } else {
                                      for (int k = 0; k < v.mon.length; k++) {
                                        if (result[k] == i) result[k] = "";
                                      }
                                    }

                                    for (int k = 0; k < v.mon.length; k++) {
                                      if (answer[k] == "") {
                                        answer[k] = alphabetList[i];
                                        size++;
                                        break;
                                      }
                                    }
                                  }
                                  if (size == v.mon.length) {
                                    String hariu = answer.join("");
                                    if (Shared.db.getSearchWord(hariu) != null) {
                                      String imgPath = "images/" + hariu + ".png";

                                      dialogType = "other";
                                      showDialog(
                                          context: context,
                                          builder: (_) => Dialogs(
                                                type: dialogType,
                                                imagePath: imgPath,
                                                result: v.mon,
                                                answer: hariu,
                                                submitCorrectAnswer: () {
                                                  Timer(Duration(seconds: 1), () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (_) => Dialogs(
                                                              type: "win",
                                                            ),
                                                        barrierDismissible: false);
                                                  });
                                                },
                                              ),
                                          barrierDismissible: false);
                                    } else {
                                      dialogType = "lose";
                                      print("hariu bish baina");
                                      showDialog(context: context, builder: (_) => Dialogs(type: dialogType), barrierDismissible: false);
                                    }
                                    EmptyAnswerList();
                                  }
                                  setState(() {});
                                }
                              })
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Future<void> getChapterdata(String resultChapter, String level) async {
    c = await Shared.db.getChapterData(resultChapter, level) ?? ChapterDataModel();
    v = await Shared.db.getWordData(c.result) ?? Word();
    a = await (16 - v.mon.length);
    if (shuffled == false) {
      alphabetList = Shared.getRandomString(a).split('');
      alphabetList = alphabetList + v.mon.split('');
      alphabetList = alphabetList.map((email) => email.toLowerCase()).toList();
      alphabetList.shuffle();
      shuffled = true;
    }
    BackImagePath = await Shared.storagef.downloadURL(c.backgroundPath) as String;
    setState(() {
      answer = List.filled(v.mon.length, "");
      result = List.filled(v.mon.length, "");
    });
  }

  void move() {
    if (pos + plus <= MediaQuery.of(context).size.width - 120) {
      pos = pos + plus;
    }
    setState(() {});
  }

  void back() {
    if (pos - plus > 0) {
      pos = pos - plus;
    }
    setState(() {});
  }

  void EmptyAnswerList() {
    for (int i = 0; i < v.mon.length; i++) {
      answer[i] = "";
    }
    for (int i = 0; i < v.mon.length; i++) {
      result[i] = "";
    }
    size = 0;
    setState(() {});
  }
}
