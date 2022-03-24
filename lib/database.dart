import 'dart:core';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:quiz_app/word.dart';

class Database {
  late FirebaseDatabase database;
  late DatabaseReference ref;
  late Word word;
  // late DatabaseEvent event;
  Database() {
    Firebase.initializeApp().whenComplete(() async {
      database = FirebaseDatabase.instance;
      ref = FirebaseDatabase.instance.ref("words");
    });
  }
  addData(String data) {
    ref.child(data).set({
      'name': data,
      "image": "https://static.scientificamerican.com/sciam/cache/file/7A715AD8-449D-4B5A-ABA2C5D92D9B5A21_source.png",
      'audio_file': "example.com",
      'quiz': false
    });
  }

  Future<Word?> getData(String value) async {
    var data = await ref.child(value).once();
    word = Word(name: "", imagePath: "", audio_file: "", quiz: false);
    var refData = data.snapshot.value as Map;

    if (refData.isNotEmpty) {
      word.name = refData["name"];
      word.imagePath = refData["image"];
      word.audio_file = refData["audio_file"];
      word.quiz = refData["quiz"];
      return word;
    }
  }
}
