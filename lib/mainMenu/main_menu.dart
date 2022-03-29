import 'package:flutter/material.dart';

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
          ElevatedButton(
              child: Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.play_arrow),
                      SizedBox(width: 5),
                      Text("Эхлэх", style: TextStyle(fontSize: 14)),
                    ],
                  )),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.black)))),
              onPressed: () {}),
          SizedBox(height: 20),
          ElevatedButton(
              child: Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.announcement),
                      SizedBox(width: 5),
                      Text("Тоглох заавар", style: TextStyle(fontSize: 14)),
                    ],
                  )),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.black)))),
              onPressed: () {}),
          SizedBox(height: 20),
          ElevatedButton(
              child: Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 5),
                      Text("Гарах", style: TextStyle(fontSize: 14)),
                    ],
                  )),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.black)))),
              onPressed: () {}),
        ]),
      ),
    );
  }
}
