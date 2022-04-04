import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_app/selectChapter/select_chapter.dart';

import 'introduction_sheet.dart';

class MainMenuButton extends StatelessWidget {
  Icon icon = Icon(Icons.add);
  String name = ""; // = "Example";

  MainMenuButton({Key? key, required this.name, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Container(
            width: 240,
            height: 35,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("lib/assets/mainMenu/buttonback.png"), fit: BoxFit.cover),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: 5),
                FittedBox(child: Text(name, style: TextStyle(fontSize: 14, color: Colors.black, fontStyle: FontStyle.italic))),
              ],
            )),
        onPressed: () {
          if (name == "Гарах") {
            exit(0);
          } else if (name == "Тоглох заавар") {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                builder: (context) => IntroductionSheet());
          } else if (name == "Эхлэх") {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectChapter()));
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration(seconds: 2),
                    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                      animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                        alignment: Alignment.center,
                      );
                    },
                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                      return SelectChapter();
                    }));
          }
        });
  }
}
