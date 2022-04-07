import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Hints extends StatefulWidget {
  String hint;
  Hints({Key? key, this.hint = ""}) : super(key: key);

  @override
  State<Hints> createState() => _HintsState();
}

class _HintsState extends State<Hints> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tapped");
        setState(() {
          isVisible = true;
        });
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow, width: 3, style: BorderStyle.solid),
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: AutoSizeText(
                widget.hint,
                maxLines: 3,
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned.fill(
            child: isVisible == false
                ? Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow, width: 3, style: BorderStyle.solid),
                        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
