import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/mainMenu/main_menu.dart';
import 'package:quiz_app/shared_pref.dart';
import 'package:quiz_app/storagef.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'audio_player.dart';
import 'database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Shared.prefs = await SharedPreferences.getInstance();
  Firebase.initializeApp().whenComplete(() {
    Shared.db = Database();
    Shared.storagef = StorageF();
    Shared.audioPlayerR = AudioPlayerR();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  static String levelNum = Shared.prefs.getInt('level').toString();

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainMenu());
  }
}
