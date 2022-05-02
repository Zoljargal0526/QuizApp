import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/gameScreen5/texts.dart';

class GameScreen5 extends StatefulWidget {
  const GameScreen5({Key? key}) : super(key: key);

  @override
  State<GameScreen5> createState() => _GameScreen5State();
}

class _GameScreen5State extends State<GameScreen5> {
  List<String> result = List.empty(growable: true);
  Duration duration = Duration();
  Timer? timer;
  bool isStarted = false;
  bool isDone = false;
  double height = 0;
  @override
  void initState() {
    super.initState();
    result = Texts.tale1.split(' ');
    isStarted = false;
    isDone = false;
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
    isStarted = true;
    isDone = false;
  }

  void addTime() {
    final addSeconds = 1;

    if (mounted)
      setState(() {
        final seconds = duration.inSeconds + addSeconds;
        if (seconds == 11) {
          ShowDialog("Цаг боллоо.", 'Хамгийн сүүлд уншсан үг дээр удаан дарж уншсан үгийнхээ тоог хараарай');
          isDone = true;
          reset();
        } else {
          duration = Duration(seconds: seconds);
        }
      });
  }

  void reset() {
    setState(() {
      duration = Duration();
    });
    timer?.cancel();
    isStarted = false;
  }

  void ShowDialog(String title, String content) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(title: Text(title), content: Text(content), actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    height = 0;
                  });
                },
                child: Icon(Icons.check),
              ),
            ]),
        barrierDismissible: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Чи хэдэн үг уншиж чадах вэ?"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isStarted ? reset() : startTimer();
          height = MediaQuery.of(context).size.height * 0.15;
        },
        child: isStarted ? Icon(Icons.stop) : Icon(Icons.play_arrow),
      ),
      body: Container(
        color: Colors.white38,
        child: Column(
          children: [
            AnimatedContainer(
              padding: EdgeInsets.all(10),
              color: Colors.orange,
              height: height,
              duration: Duration(seconds: 1),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  '${duration.inSeconds}',
                  style: TextStyle(color: Colors.black, fontSize: 60),
                ),
                if (isStarted) Lottie.asset("lib/assets/gameScreen3images/flowTimer.json", fit: BoxFit.cover),
              ]),
            ),
            Expanded(
                child: Container(
              child: SingleChildScrollView(
                child: Wrap(spacing: 5, alignment: WrapAlignment.start, children: [
                  for (int w = 0; w < result.length; w++)
                    GestureDetector(
                      onLongPress: () {
                        if (isDone) {
                          ShowDialog("Баяр хүргэе", "Таны уншсан үгийн тоо:" + (w + 1).toString());
                        } else {
                          ShowDialog("Алдаа", "Таны уншсан үгийн тоог мэдэх боложгүй байна. Та эхлээд цаг гүйлгэн уншиж эхэлнэ үү!");
                        }
                      },
                      child:AutoSizeText(
                          result[w],
                          maxLines: 1,
                          minFontSize: 25,
                          maxFontSize: 30,
                          style: TextStyle(color: Colors.black),
                      ),
                    ),
                ]),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
