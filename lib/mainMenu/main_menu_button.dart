import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_app/homepage.dart';

import 'introduction_sheet.dart';

class MainMenuButton extends StatelessWidget {
  MainMenuButton({Key? key, required String name, required Icon icon}) : super(key: key);
  Icon icon = Icon(Icons.add);
  String name = "";
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Container(
            width: 100,
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
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(title: "Play")));
          }
        });
  }
}
