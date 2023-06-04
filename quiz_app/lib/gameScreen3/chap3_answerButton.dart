import 'dart:async';

import 'package:flutter/material.dart';

import '../gameScreen/Dialogs.dart';
import 'gameScreen3.dart';

class Chap3AnswerButton extends StatefulWidget {
  String answer;
  String result;
  final VoidCallback update;
  Chap3AnswerButton({Key? key, this.answer = "", this.result = "", required this.update}) : super(key: key);

  @override
  State<Chap3AnswerButton> createState() => _Chap3AnswerButtonState();
}

class _Chap3AnswerButtonState extends State<Chap3AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange), elevation: MaterialStateProperty.all(5)),
      child: Text(
        widget.answer[0].toUpperCase() + widget.answer.substring(1).toLowerCase(),
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (widget.answer == widget.result) {
          GameScreen3.answer = true;
          widget.update();
          Timer(const Duration(seconds: 3), () {
            showDialog(
                context: context,
                builder: (_) => Dialogs(
                      type: "win",
                      screenNum: 3,
                    ),
                barrierDismissible: false);
          });
        } else {
          showDialog(
              context: context,
              builder: (_) => Dialogs(
                    type: "lose",
                  ),
              barrierDismissible: false);
        }
      },
    );
  }
}
