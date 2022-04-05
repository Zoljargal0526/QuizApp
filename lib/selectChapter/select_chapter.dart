import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/gameScreen/gameScreen.dart';
import 'package:quiz_app/gameScreen2/gameScreen2.dart';
import 'package:quiz_app/gameScreen3/gameScreen3.dart';
import 'package:quiz_app/selectChapter/chapter_model.dart';
import 'package:quiz_app/shared_pref.dart';
import 'package:sticky_headers/sticky_headers.dart';

class SelectChapter extends StatefulWidget {
  const SelectChapter({Key? key}) : super(key: key);

  @override
  State<SelectChapter> createState() => _SelectChapterState();
}

class _SelectChapterState extends State<SelectChapter> {
  @override
  Widget build(BuildContext context) {
    double spaceWidth = MediaQuery.of(context).size.width * 0.1;
    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.black, title: Text("Үе Сонгох"), actions: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.volume_up),
              onPressed: () {
                Shared.audioPlayerR.audioPlayer.setReleaseMode(ReleaseMode.STOP);
              },
            ),
          ],
        )
      ]),
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.blue.withOpacity(0.7), Colors.pink, Colors.green])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView.builder(
                itemCount: chaptersList.length,
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemBuilder: (context, index) {
                  return StickyHeader(
                    overlapHeaders: true,
                    content: GestureDetector(
                      onTap: () {
                        goGameScreen(chaptersList[index].title);
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(spaceWidth, 0, spaceWidth, 0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellow, width: 3, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: AssetImage(chaptersList[index].imagePath),
                              fit: BoxFit.cover,
                            )),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)), color: Colors.grey.withOpacity(0.6)),
                                padding: EdgeInsets.all(5),
                                child: AutoSizeText(
                                  chaptersList[index].description,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    header: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      padding: EdgeInsets.fromLTRB(spaceWidth + 2, 2, spaceWidth + 2, 0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black.withOpacity(0.6),
                          ),
                          height: 100,
                          child: FittedBox(
                              child: Text(
                            chaptersList[index].title,
                            style: TextStyle(color: Colors.yellow),
                          ))),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.black)))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GameScreen2()));
                },
                child: Container(
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    width: 200,
                    child: FittedBox(
                        child: Text(
                      "Сонгох",
                      style: TextStyle(color: Colors.white),
                    )))),
          ],
        ),
      ),
    );
  }

  void goGameScreen(String chapterName) {
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
              return chapterName == "Бүлэг-1"
                  ? GameScreen(title: chapterName)
                  : chapterName == "Бүлэг-2"
                      ? GameScreen2()
                      : GameScreen3();
            }));
  }
}
