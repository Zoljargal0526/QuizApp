import 'dart:core';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:quiz_app/gameScreen/chapter_data_model.dart';
import 'package:quiz_app/gameScreen/word.dart';

import 'gameScreen3/chapterDataModel3.dart';
import 'gameScreen4/chapterDataModel4.dart';

class Database {
  late FirebaseDatabase database;
  late DatabaseReference ref;
  late Word word;
  late ChapterDataModel chapter;
  late ChapterDataModel3 chapter3;
  late ChapterDataModel4 chapter4;
  // late DatabaseEvent event;
  Database() {
    Firebase.initializeApp().whenComplete(() async {
      database = FirebaseDatabase.instance;
    });
  }
  addData(String data, String mon, String id) {
    ref = FirebaseDatabase.instance.ref("words");
    String image = mon.replaceAll(' ', '');
    ref.child(data).set({'name': data, "image": "images/$image.png", 'mon': mon, 'id': id});
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

  Future<Word?> getSearchWordById(int value) async {
    ref = FirebaseDatabase.instance.ref("words");
    //var data = await ref.orderByChild("/id").equalTo(value).once();
    var data = await ref.orderByChild("/id").equalTo(value).once();
    //var data = await ref.limitToFirst(value).once();
    var refData = data.snapshot.value as Map? ?? {};
    var rData = refData.values.first; // river:{name="river"} iig {name="river"} bolgoson
    //print(rData["name"]);
    if (rData.isNotEmpty) {
      Word word = Word(name: "", imagePath: "", mon: "");
      word.name = rData["name"];
      word.imagePath = rData["image"];
      word.mon = rData["mon"];
      word.id = rData["id"].toString();
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

  Future<ChapterDataModel3?> getChapterData3(String level) async {
    ref = FirebaseDatabase.instance.ref("chapters").child("chapter3");
    var data = await ref.child("level" + level).once();
    chapter3 = ChapterDataModel3(result: '', hint1: "", hint2: "", hint3: '', backgroundPath: "", blackbackgroundPath: "");
    var refData = data.snapshot.value as Map;

    if (refData.isNotEmpty) {
      chapter3.result = refData["result"] as String? ?? "";
      chapter3.hint1 = refData["hint1"];
      chapter3.hint2 = refData["hint2"];
      chapter3.hint3 = refData["hint3"];
      chapter3.backgroundPath = refData["background"];
      chapter3.blackbackgroundPath = refData["backgroundw"];
      return chapter3;
    }
  }

  Future<ChapterDataModel4?> getChapterData4(String level) async {
    ref = FirebaseDatabase.instance.ref("chapters").child("chapter4");
    var data = await ref.child("level" + level).once();
    chapter4 = ChapterDataModel4(
      word1: '',
      word2: "",
      word3: "",
      backgroundPath: "",
    );
    var refData = data.snapshot.value as Map;
    if (refData.isNotEmpty) {
      chapter4.word1 = refData["word1"];
      chapter4.word2 = refData["word2"];
      chapter4.word3 = refData["word3"];
      chapter4.backgroundPath = refData["image"];
      return chapter4;
    }
  }

  Future<int?> countWords() async {
    ref = FirebaseDatabase.instance.ref("words");
    var data = await ref.once();
    int k = data.snapshot.children.length;
    return k;
  }
}
