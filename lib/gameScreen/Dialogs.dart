import 'dart:core';

import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/gameScreen/gameScreen.dart';

import '../mainMenu/main_menu.dart';
import '../shared_pref.dart';
import 'download_show_image.dart';

class Dialogs extends StatefulWidget {
  String type = "";
  String imagePath = "";
  String result = "";
  String answer = "";
  VoidCallback? submitCorrectAnswer;
  Dialogs({
    Key? key,
    this.type = "",
    this.imagePath = "",
    this.result = "",
    this.answer = "",
    this.submitCorrectAnswer,
  }) : super(key: key);

  @override
  State<Dialogs> createState() => _DialogsState();
}

class _DialogsState extends State<Dialogs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == "win"
        ? AlertDialog(actions: [
            Stack(children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("lib/assets/dialogImage/winBack.png"), fit: BoxFit.cover),
                  ),
                  child: Lottie.asset("lib/assets/dialogImage/98998-bubble-confettis.json"),
                ),
              ),
              Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Таны хариулт зөв байна", style: TextStyle(fontSize: 25, color: Colors.black, fontStyle: FontStyle.italic)),
                Text("Та үргэлжлүүлэх үү?", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                Positioned.fill(
                  child: GifView.asset('lib/assets/chapterImages/dancing.gif', width: 200, height: 200, frameRate: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          int level = Shared.prefs.getInt('level') ?? 1 + 1;
                          Shared.prefs.setInt('level', level);
                          Navigator.pushReplacement<void, void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const GameScreen(title: "Chapter1"),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.yellow,
                            ),
                            Text(
                              "Тийм",
                              style: TextStyle(color: Colors.yellow),
                            ),
                          ],
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainMenu()), (Route<dynamic> route) => false);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.cancel,
                              color: Colors.white,
                            ),
                            Text(
                              "Үгүй",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  ],
                )
              ]),
            ]),
          ])
        : widget.type == "lose"
            ? AlertDialog(
                actions: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("lib/assets/dialogImage/loseBack.png"), fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        Text("Буруу хариулт байна", style: TextStyle(fontSize: 25, color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                        Text("Дахин хариулах уу?", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                        Container(width: 200, height: 200, child: Lottie.asset("lib/assets/dialogImage/loseLottie.json")),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      "Тийм",
                                      style: TextStyle(color: Colors.yellow),
                                    ),
                                  ],
                                )),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainMenu()), (Route<dynamic> route) => false);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Үгүй",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            : AlertDialog(
                backgroundColor: Colors.green,
                title: Text("Таны хариулт"),
                content: ShowImage(path: widget.imagePath),
                actions: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (widget.result == widget.answer) {
                            print("hariu mun baina");
                            if (widget.submitCorrectAnswer != null) {
                              widget.submitCorrectAnswer!();
                            }
                            Navigator.pop(context);
                          } else {
                            print(widget.result + "=" + widget.answer);
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (_) => Dialogs(
                                      type: "lose",
                                    ),
                                barrierDismissible: false);
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue),
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Row(children: [
                              Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              Text(
                                "Сонгох",
                                style: TextStyle(color: Colors.white),
                              ),
                            ])),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Row(children: [
                              Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
                              Text(
                                "Дахин хариулах",
                                style: TextStyle(color: Colors.white),
                              ),
                            ])),
                      )
                    ],
                  )
                ],
              );
  }
}
