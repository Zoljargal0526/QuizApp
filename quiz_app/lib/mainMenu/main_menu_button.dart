import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_app/onBoardingScreen.dart';
import 'package:quiz_app/selectChapter/select_chapter.dart';

class MainMenuButton extends StatelessWidget {
  Icon icon = const Icon(Icons.add);
  String name = ""; // = "Example";

  MainMenuButton({Key? key, required this.name, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Container(
            width: 240,
            height: 35,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/mainMenu/buttonback.png"),
                  fit: BoxFit.cover),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 5),
                FittedBox(
                    child: Text(name,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontStyle: FontStyle.italic))),
              ],
            )),
        onPressed: () {
          if (name == "Гарах") {
            exit(0);
          } else if (name == "Тоглох заавар") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const onBoardingScreen()));
            /*showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                builder: (context) => IntroductionSheet());*/
          } else if (name == "Эхлэх") {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectChapter()));
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: const Duration(seconds: 2),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secAnimation,
                        Widget child) {
                      animation = CurvedAnimation(
                          parent: animation, curve: Curves.elasticInOut);
                      return ScaleTransition(
                        scale: animation,
                        alignment: Alignment.center,
                        child: child,
                      );
                    },
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secAnimation) {
                      return const SelectChapter();
                    }));
          }
        });
  }
}
