import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/mainMenu/main_menu.dart';
import 'package:quiz_app/shared_pref.dart';
import 'package:quiz_app/storagef.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'audio_player.dart';
import 'database.dart';

class _WidgetsBindingObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    //print(state.toString());
    if (state == AppLifecycleState.resumed) {
      Shared.audioPlayerR.audioPlayer.resume();
    }
    if (state == AppLifecycleState.paused) {
      Shared.audioPlayerR.audioPlayer.pause();
    }
  }
}

Future<void> main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();

  Shared.prefs = await SharedPreferences.getInstance();
  Firebase.initializeApp().whenComplete(() {
    WidgetsBinding.instance?.addObserver(_WidgetsBindingObserver());
    Shared.db = Database();
    Shared.storagef = StorageF();
    Shared.audioPlayerR = AudioPlayerR();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
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
