import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/gameScreen/answer_letter_button.dart';
import 'package:quiz_app/gameScreen/chapter_data_model.dart';
import 'package:quiz_app/gameScreen/result_letter_box.dart';
import 'package:quiz_app/main.dart';

import '../shared_pref.dart';
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
  Word v = Word();
  ChapterDataModel c = ChapterDataModel();
  List<String> alphabetList = List.empty();
  List<String> answer = List.empty();
  List<String> result = List.empty();
  bool shuffled = false;
  int size = 0;
  int a = 0;
  // static const _chars = 'АБВГДЕЁЖЗИЙКЛМНОӨПРСТУҮФХЦЧШЪЬЫЭЮЯ';
  // final Random _rnd = Random();
  // String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  void initState() {
    chapTitle = widget.title;
    getChapterdata(chapTitle, MyApp.levelNum);
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
                  MyApp.levelNum + "-р үе",
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
                  Positioned.fill(child: Container(color: Colors.blue)),
                  Positioned(
                      top: 10,
                      left: minSpace * 2,
                      right: minSpace * 2,
                      child: Container(
                          height: 50,
                          color: Colors.yellow,
                          child: Center(
                              child: AutoSizeText(
                            c.hint,
                            maxLines: 2,
                            style: TextStyle(fontSize: 25),
                          )))),
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
                            for (int i = 0; i < c.result.length; i++)
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
                        for (int i = 0; i < 16; i++)
                          GestureDetector(
                              child: AnswerLetterButton(
                                width: minSpace,
                                height: minSpace,
                                letter: alphabetList[i],
                                isSelected: result.contains(i.toString()) && size <= c.result.length ? true : false,
                              ),
                              onTap: () {
                                if (!result.contains(i.toString())) {
                                  if (size <= c.result.length) {
                                    if (!result.contains(i.toString())) {
                                      if (size < c.result.length) {
                                        result[size] = i.toString();
                                      }
                                    } else {
                                      for (int k = 0; k < c.result.length; k++) {
                                        if (result[k] == i) result[k] = "";
                                      }
                                    }

                                    for (int k = 0; k < c.result.length; k++) {
                                      if (answer[k] == "") {
                                        answer[k] = alphabetList[i];
                                        size++;
                                        break;
                                      }
                                    }
                                  }
                                  if (size == c.result.length) {
                                    if (c.result == answer.join("")) {
                                      print("hariu mun baina");
                                    } else {
                                      print("hariu bish baina");
                                    }
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
    a = await (16 - c.result.length);
    if (shuffled == false) {
      alphabetList = Shared.getRandomString(16 - c.result.length).split('');
      alphabetList = alphabetList + c.result.split('');
      alphabetList = alphabetList.map((email) => email.toLowerCase()).toList();
      alphabetList.shuffle();
      shuffled = true;
    }
    setState(() {
      answer = List.filled(c.result.length, "");
      result = List.filled(c.result.length, "");
    });
  }
}
