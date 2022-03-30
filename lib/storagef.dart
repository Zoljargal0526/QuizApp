import 'dart:core';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageF {
  late firebase_storage.FirebaseStorage storagef;
  late firebase_storage.Reference ref;
  // late DatabaseEvent event;
  StorageF() {
    storagef = firebase_storage.FirebaseStorage.instance;
    //ref = firebase_storage.FirebaseStorage.instance.ref().child('images').child('car.png');
  }

  Future<String> downloadURL(String path) async {
    String downloadURL = await storagef.ref(path).getDownloadURL();
    return downloadURL;
  }
}
