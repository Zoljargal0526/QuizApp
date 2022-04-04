import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/mainMenu/main_menu_button.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/assets/mainMenu/background.png"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 300,
              height: 200,
              child: FittedBox(child: Lottie.asset("lib/assets/mainMenu/children-holding-letters.json")),
            ),
            const SizedBox(height: 40),
            MainMenuButton(
                name: "Эхлэх",
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                )),
            const SizedBox(height: 20),
            MainMenuButton(
                name: "Тоглох заавар",
                icon: Icon(
                  Icons.announcement,
                  color: Colors.black,
                )),
            const SizedBox(height: 20),
            MainMenuButton(
                name: "Гарах",
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                )),
          ]),
        ),
      ),
    );
  }
}
