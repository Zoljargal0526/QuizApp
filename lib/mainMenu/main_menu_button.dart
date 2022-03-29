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
    return ElevatedButton(
        child: Container(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: 5),
                Text(name, style: TextStyle(fontSize: 14)),
              ],
            )),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.black)))),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectChapter()));
          }
        });
  }
}
