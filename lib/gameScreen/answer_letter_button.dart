import 'package:flutter/material.dart';

class AnswerLetterButton extends StatelessWidget {
  double width;
  double height;
  String letter;
  bool isSelected;
  AnswerLetterButton({Key? key, this.width = 0, this.height = 0, this.letter = "A", this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: !isSelected ? Colors.orange : Colors.red,
      width: width,
      height: height,
      child: FittedBox(
        child: Text(letter),
      ),
    );
  }
}
