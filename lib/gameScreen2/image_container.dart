import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/gameScreen/Dialogs.dart';

import '../gameScreen/download_show_image.dart';
import '../gameScreen/word.dart';

class ImageCon extends StatefulWidget {
  Word word;
  String result;
  ImageCon({
    Key? key,
    required this.word,
    required this.result,
  }) : super(key: key);

  @override
  State<ImageCon> createState() => _ImageConState();
}

class _ImageConState extends State<ImageCon> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.45;

    return GestureDetector(
      onTap: () {
        setState(() {
          isTap = !isTap;
        });

        Timer(Duration(seconds: 3), () {
          if (widget.result == widget.word.name) {
            showDialog(
                context: context,
                builder: (_) => Dialogs(
                      type: "win",
                    ),
                barrierDismissible: false);
          } else {
            setState(() {
              isTap = !isTap;
            });
          }
        });
      },
      child: ClipRRect(
        child: Container(
            width: width,
            height: width,
            color: Colors.pinkAccent,
            child: Stack(
              children: [
                ShowImage(width: width, path: widget.word.imagePath),
                BackdropFilter(filter: !isTap ? ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0) : ImageFilter.blur(sigmaX: 0, sigmaY: 0), child: Container()),
              ],
            )),
      ),
    );
  }
}
