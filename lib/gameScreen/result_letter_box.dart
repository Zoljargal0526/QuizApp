import 'package:flutter/material.dart';

class ResultLetterBox extends StatelessWidget {
  String letter = "";
  ResultLetterBox({Key? key, required this.letter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      width: 50,
      height: 50,
      child: FittedBox(
        child: Text(letter),
      ),
    );
  }
}
