import 'package:flutter/material.dart';

class Level2 extends StatelessWidget {
  const Level2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          //color: Colors.brown.withOpacity(0.7),
          borderRadius: BorderRadius.circular(50),
        ),
        //child: Lottie.network("https://assets4.lottiefiles.com/packages/lf20_ko9ahj1s.json", width: 50, height: 50)
      ),
    ));
  }
}
