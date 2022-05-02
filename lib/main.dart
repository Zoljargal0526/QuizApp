import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/shared_pref.dart';
import 'package:quiz_app/storagef.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'audio_player.dart';
import 'database.dart';
import 'mainMenu/main_menu.dart';

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
//tsum hutulburig sudlah
// uyeer taslah heseg nemeh
//dvrem tailbarlah
//jijig zohioh bichleh hiih nemeh
//tseej bichihg hiih heseg nemj bolno
//zurag daraad aldaa zasah maygin ym nemj bolno
//font tomruulj bichih bolomjoor hangah
//huwiaraa hadgaldg boloh
//notification seruuleg nemeh bolomj
//sonirholtoi ishlel medeellin heseg notificatioin ugdug boloh
//hoolnii talaarh medeelel hurgeh
//huwtsas ewheh daraalal
Future<void> main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();

  Shared.prefs = await SharedPreferences.getInstance();
  //Shared.prefs.setInt("level1", 1);
  /*Shared.prefs.setInt("level2", 1);
  Shared.prefs.setInt("level3", 1);
  Shared.prefs.setInt("level4", 1);*/
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
      debugShowCheckedModeBanner: false,
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainMenu());
  }
}
