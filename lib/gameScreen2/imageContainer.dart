import 'package:flutter/material.dart';
import 'package:quiz_app/gameScreen/download_show_image.dart';
import 'package:quiz_app/gameScreen/word.dart';

class ImageContainer extends StatelessWidget {
  Word word;
  ImageContainer({
    Key? key,
    required this.word,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.45;
    return Container(
      width: width,
      height: 150,
      color: Colors.pinkAccent,
      child: ShowImage(path: word.imagePath),
    );
  }
}
