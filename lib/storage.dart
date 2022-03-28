import 'dart:core';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  late firebase_storage.FirebaseStorage storage;
  late firebase_storage.Reference ref;
  // late DatabaseEvent event;
  Storage() {
    storage = firebase_storage.FirebaseStorage.instance;
    //ref = firebase_storage.FirebaseStorage.instance.ref().child('images').child('car.png');
  }
  Future<String> downloadURL(String path) async {
    String downloadURL = await storage.ref(path).getDownloadURL();
    return downloadURL;
  }
}
