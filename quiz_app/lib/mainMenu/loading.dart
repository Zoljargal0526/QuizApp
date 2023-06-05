import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Center(
        child: RiveAnimation.asset(
          "assets/mainMenu/loader-lollipop.riv",
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
          top: 50,
          left: 50,
          right: 50,
          child: Container(
            child: Lottie.network(
                "https://assets6.lottiefiles.com/packages/lf20_5owbhi69.json"),
          )),
    ]);
  }
}
