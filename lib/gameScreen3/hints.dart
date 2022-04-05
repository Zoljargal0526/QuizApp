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
                border: Border.all(color: Colors.yellow, width: 3, style: BorderStyle.solid), color: Colors.deepPurple, borderRadius: BorderRadius.all(Radius.circular(20))),
            child: FittedBox(
              alignment: Alignment.center,
              child: Text(
                widget.hint,
                style: TextStyle(color: Colors.white),
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
                        border: Border.all(color: Colors.yellow, width: 3, style: BorderStyle.solid), color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(20))),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
