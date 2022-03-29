import 'package:flutter/material.dart';
import 'package:quiz_app/mainMenu/main_menu_button.dart';

class MainMenu extends StatelessWidget {
  MainMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Title",
            style: TextStyle(fontSize: 100),
          ),
          SizedBox(height: 40),
          MainMenuButton(name: "Эхлэх", icon: Icon(Icons.play_arrow)),
          SizedBox(height: 20),
          MainMenuButton(name: "Тоглох заавар", icon: Icon(Icons.announcement)),
          SizedBox(height: 20),
          MainMenuButton(name: "Гарах", icon: Icon(Icons.exit_to_app)),
        ]),
      ),
    );
  }
}
