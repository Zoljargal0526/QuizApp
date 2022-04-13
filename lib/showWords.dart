import 'package:flutter/material.dart';
import 'package:quiz_app/gameScreen/download_show_image.dart';
import 'package:quiz_app/shared_pref.dart';

import 'gameScreen/word.dart';

class ShowWords extends StatefulWidget {
  const ShowWords({Key? key}) : super(key: key);

  @override
  State<ShowWords> createState() => _ShowWordsState();
}

class _ShowWordsState extends State<ShowWords> {
  List<Word> words = List.empty(growable: true);
  int max = 0;
  int start = 1;
  int last = 0;
  double height = 0;
  int tappedIndex = -1;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    words = [];
    start = 1;
    last = 0;
    tappedIndex = -1;
    getListWordData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        getListWordData();
      }
    });
    super.initState();
  }

  Future<void> getListWordData() async {
    last = start + 15;
    max = (await Shared.db.countWords()) ?? 0;
    //max = 16;
    if (last > max) {
      last = max - 1;
    }
    for (int i = start; i < last; i++) {
      var w = await (Shared.db.getSearchWordById(i)) ?? Word();
      words.add(w);
    }
    start = start + 15;
    setState(() {
      words;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
          child: ListView.builder(
              itemCount: words.length + 1,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                if (index == words.length) {
                  return Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    ListTile(
                        onTap: () {
                          setState(() {
                            if (tappedIndex == index) {
                              tappedIndex = -1;
                              print(tappedIndex.toString() + " " + index.toString());
                            } else {
                              tappedIndex = index;
                              height = 100;
                              print(tappedIndex.toString() + " " + index.toString());
                            }
                          });
                        },
                        tileColor: Colors.white,
                        leading: Icon(Icons.list),
                        trailing: Text(
                          words[index].id,
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                        title: Text(words[index].mon)),
                    AnimatedContainer(
                      height: tappedIndex == index ? height : 0,
                      color: tappedIndex == index ? Colors.orange : Colors.white,
                      width: MediaQuery.of(context).size.width,
                      duration: Duration(seconds: 1),
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ShowImage(
                            width: 100,
                            path: words[index].imagePath,
                          ),
                          Text(
                            "English:" + words[index].name,
                            style: TextStyle(fontSize: 20, color: tappedIndex == index ? Colors.black : Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              })),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = "";
              }
            },
            icon: Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios));

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [''];
    return Container();
  }
}
