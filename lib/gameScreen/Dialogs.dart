import 'dart:core';

import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == "win"
        ? AlertDialog(
            title: Text("Таны хариулт зөв байна"),
            actions: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Та үргэлжлүүлэх үү?"),
                  GifView.asset('lib/assets/chapterImages/dancing.gif', width: 200, height: 200, frameRate: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
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
                        child: Text("Тийм"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainMenu()), (Route<dynamic> route) => false);
                        },
                        child: Text("Үгүй"),
                      )
                    ],
                  )
                ],
              )
            ],
          )
        : widget.type == "lose"
            ? AlertDialog(
                title: Text("Буруу хариулт байна"),
                content: Text("Дахин хариулах уу?"),
                actions: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Тийм"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainMenu()), (Route<dynamic> route) => false);
                        },
                        child: Text("Үгүй"),
                      )
                    ],
                  )
                ],
              )
            : AlertDialog(
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
                        child: Text("Сонгох"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Дахин хариулах"),
                      )
                    ],
                  )
                ],
              );
  }
}
