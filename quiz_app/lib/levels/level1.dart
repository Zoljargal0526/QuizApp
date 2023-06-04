import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Level1 extends StatelessWidget {
  String url;
  Level1({Key? key, this.url = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: url != "" ? Colors.brown.withOpacity(0.7) : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: url != "" ? Lottie.network(url, width: 50, height: 50) : Container()),
    );
  }
}
