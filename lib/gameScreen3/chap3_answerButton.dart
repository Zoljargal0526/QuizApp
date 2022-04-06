import 'package:flutter/material.dart';

import '../gameScreen/Dialogs.dart';

class Chap3AnswerButton extends StatefulWidget {
  String answer;
  String result;
  Chap3AnswerButton({Key? key, this.answer = "", this.result = ""}) : super(key: key);

  @override
  State<Chap3AnswerButton> createState() => _Chap3AnswerButtonState();
}

class _Chap3AnswerButtonState extends State<Chap3AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
      child: Text(
        widget.answer[0].toUpperCase() + widget.answer.substring(1).toLowerCase(),
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (widget.answer == widget.result) {
          setState(() {
            showDialog(
                context: context,
                builder: (_) => Dialogs(
                      type: "win",
                    ),
                barrierDismissible: false);
            print("hariu zuw");
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
