import 'package:flutter/material.dart';
import 'package:quiz_app/mainMenu/main_menu_button.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Title",
            style: TextStyle(fontSize: 100),
          ),
          const SizedBox(height: 40),
          MainMenuButton(name: "Эхлэх", icon: Icon(Icons.play_arrow)),
          const SizedBox(height: 20),
          MainMenuButton(name: "Тоглох заавар", icon: Icon(Icons.announcement)),
          const SizedBox(height: 20),
          MainMenuButton(name: "Гарах", icon: Icon(Icons.exit_to_app)),
        ]),
      ),
    );
  }
}
