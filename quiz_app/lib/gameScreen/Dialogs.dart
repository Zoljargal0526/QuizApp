import 'dart:core';

import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/gameScreen/gameScreen.dart';
import 'package:quiz_app/shared_pref.dart';

import '../gameScreen2/gameScreen2.dart';
import '../gameScreen3/gameScreen3.dart';
import '../gameScreen4/gameScreen4.dart';
import '../mainMenu/main_menu.dart';
import 'download_show_image.dart';

class Dialogs extends StatefulWidget {
  String type = "";
  String imagePath = "";
  String result = "";
  String answer = "";
  int screenNum = 1;
  VoidCallback? submitCorrectAnswer;
  Dialogs({
    Key? key,
    this.type = "",
    this.imagePath = "",
    this.result = "",
    this.answer = "",
    this.screenNum = 1,
    this.submitCorrectAnswer,
  }) : super(key: key);

  @override
  State<Dialogs> createState() => _DialogsState();
}

class _DialogsState extends State<Dialogs> {
  String level = "";
  @override
  void initState() {
    level = Shared.prefs.getInt("level${widget.screenNum}").toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == "win"
        ? AlertDialog(actions: [
            Stack(children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("lib/assets/dialogImage/winBack.png"), fit: BoxFit.cover),
                  ),
                  child: Lottie.asset("lib/assets/dialogImage/98998-bubble-confettis.json"),
                ),
              ),
              Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Таны хариулт зөв байна", style: TextStyle(fontSize: 25, color: Colors.black, fontStyle: FontStyle.italic)),
                Text(
                  "Та$level-р үеийг амжилттай давлаа.",
                  style: const TextStyle(fontSize: 25, color: Colors.black, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                const Text("Та үргэлжлүүлэх үү?", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                Center(
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
                          Shared.prefs.setInt(("level${widget.screenNum}"), (int.parse(level) + 1) <= 15 ? (int.parse(level) + 1) : 15);
                          Navigator.pop(context);
                          if (int.parse(level) + 1 == 16) {
                            Navigator.pop(context);
                          } else if (widget.screenNum == 1) {
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => const GameScreen(title: "Бүлэг-1"),
                              ),
                            );
                          } else if (widget.screenNum == 2) {
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => const GameScreen2(),
                              ),
                            );
                          } else if (widget.screenNum == 3) {
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => const GameScreen3(),
                              ),
                            );
                          } else if (widget.screenNum == 4) {
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => const GameScreen4(),
                              ),
                            );
                          }
                        },
                        child: const Row(
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
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MainMenu()), (Route<dynamic> route) => false);
                        },
                        child: const Row(
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
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("lib/assets/dialogImage/loseBack.png"), fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        const Text("Буруу хариулт байна", style: TextStyle(fontSize: 25, color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                        const Text("Дахин хариулах уу?", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(width: 200, height: 200, child: Lottie.asset("lib/assets/dialogImage/loseLottie.json")),
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
                                child: const Row(
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
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MainMenu()), (Route<dynamic> route) => false);
                              },
                              child: const Row(
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
                title: const Text("Таны хариулт"),
                content: ShowImage(path: widget.imagePath),
                actions: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (widget.result == widget.answer) {
                            if (widget.submitCorrectAnswer != null) {
                              widget.submitCorrectAnswer!();
                            }
                            Navigator.pop(context);
                          } else {
                            print("${widget.result}=${widget.answer}");
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
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: const Row(children: [
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
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: const Row(children: [
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
