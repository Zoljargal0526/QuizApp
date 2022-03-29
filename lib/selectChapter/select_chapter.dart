import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/selectChapter/chapter_model.dart';
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
      appBar: AppBar(elevation: 0, title: Text("Үе Сонгох"), actions: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.volume_up),
              onPressed: () {},
            ),
          ],
        )
      ]),
      body: Column(
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
                  content: Container(
                    margin: EdgeInsets.fromLTRB(spaceWidth, 0, spaceWidth, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 3, style: BorderStyle.solid),
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
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)), color: Colors.blueAccent.withOpacity(0.6)),
                            padding: EdgeInsets.all(5),
                            child: AutoSizeText(
                              chaptersList[index].description,
                              maxLines: 3,
                              style: TextStyle(color: Colors.yellow, fontSize: 25),
                            ),
                          ),
                        )
                      ],
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
                          style: TextStyle(color: Colors.white),
                        ))),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text("Сонгох")),
        ],
      ),
    );
  }
}
