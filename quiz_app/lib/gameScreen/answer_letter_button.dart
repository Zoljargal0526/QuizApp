import 'package:flutter/material.dart';

class AnswerLetterButton extends StatelessWidget {
  double width;
  double height;
  String letter;
  bool isSelected;
  AnswerLetterButton({Key? key, this.width = 0, this.height = 0, this.letter = "A", this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainAnimation: true,
      maintainState: true,
      maintainSize: true,
      visible: !isSelected,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1, style: BorderStyle.solid),
          color: Colors.orange,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.black,
              blurRadius: 2,
            )
          ],
        ),
        width: width,
        height: height,
        padding: const EdgeInsets.all(3),
        child: FittedBox(
          child: Text(letter),
        ),
      ),
    );
  }
}
