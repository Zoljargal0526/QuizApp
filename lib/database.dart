import 'dart:core';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:quiz_app/gameScreen/chapter_data_model.dart';
import 'package:quiz_app/gameScreen/word.dart';

class Database {
  late FirebaseDatabase database;
  late DatabaseReference ref;
  late Word word;
  late ChapterDataModel chapter;
  // late DatabaseEvent event;
  Database() {
    Firebase.initializeApp().whenComplete(() async {
      database = FirebaseDatabase.instance;
    });
  }
  addData(String data) {
    ref = FirebaseDatabase.instance.ref("words");
    ref.child(data).set({
      'name': data,
      "image": "https://static.scientificamerican.com/sciam/cache/file/7A715AD8-449D-4B5A-ABA2C5D92D9B5A21_source.png",
      'audio_file': "example.com",
      'quiz': false
    });
  }

  Future<Word?> getWordData(String value) async {
    ref = FirebaseDatabase.instance.ref("words");
    var data = await ref.child(value).once();
    word = Word(name: "", imagePath: "", mon: "");
    var refData = data.snapshot.value as Map? ?? {};

    if (refData.isNotEmpty) {
      word.name = refData["name"];
      word.imagePath = refData["image"];
      word.mon = refData["mon"];
      return word;
    }
    return null;
  }

  Future<Word?> getSearchWord(String value) async {
    ref = FirebaseDatabase.instance.ref("words");
    var data = await ref.orderByChild("/mon").equalTo(value).once();
    var refData = data.snapshot.value as Map? ?? {};
    word = Word(name: "", imagePath: "", mon: "");
    if (refData.isNotEmpty) {
      word.name = refData["name"];
      word.imagePath = refData["image"];
      word.mon = refData["mon"];
      return word;
    }
    return null;
  }

  Future<ChapterDataModel?> getChapterData(String title, String level) async {
    if (title == "Бүлэг-1") {
      title = "chapter1";
    } else if (title == "Бүлэг-2") {
      title = "chapter2";
    } else if (title == "Бүлэг-3") {
      title = "chapter3";
    } else if (title == "Бүлэг-4") {
      title = "chapter4";
    }
    ref = FirebaseDatabase.instance.ref("chapters").child(title);
    var data = await ref.child("level" + level).once();
    chapter = ChapterDataModel(result: '', levelNum: level, chapterTitle: title, hint: '', help: '', backgroundPath: "");
    var refData = data.snapshot.value as Map;

    if (refData.isNotEmpty) {
      chapter.result = refData["result"] as String? ?? "";
      chapter.hint = refData["hint"];
      chapter.help = refData["help"];
      chapter.backgroundPath = refData["background"];
      return chapter;
    }
  }
}
