import 'package:flutter/material.dart';

class ResultLetterBox extends StatelessWidget {
  String letter = "";
  ResultLetterBox({Key? key, required this.letter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black, width: 2, style: BorderStyle.solid)),
      width: 50,
      height: 50,
      padding: EdgeInsets.all(3),
      child: FittedBox(
        child: Text(letter),
      ),
    );
  }
}
