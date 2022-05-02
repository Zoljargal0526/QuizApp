import 'package:flutter/cupertino.dart';
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
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              width: 300,
              height: 200,
              child: Stack(children: [
                Positioned.fill(
                    child: FittedBox(
                        child: Lottie.asset(
                            "lib/assets/mainMenu/children-holding-letters.json"))),
                Positioned(
                    left: 20,
                    right: 20,
                    top: 0,
                    child: Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: Colors.purple,
                      ),
                      child: Center(
                        child: Text(
                          "Үсгэн Ертөнц",
                          style: TextStyle(color: Colors.yellow,fontSize: 30),
                        ),
                      ),
                    ))
              ]),
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
