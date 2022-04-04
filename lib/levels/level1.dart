import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Level1 extends StatelessWidget {
  const Level1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.brown.withOpacity(0.7),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Lottie.network("https://assets1.lottiefiles.com/packages/lf20_i7ixqfgx.json", width: 50, height: 50)),
    );
  }
}
