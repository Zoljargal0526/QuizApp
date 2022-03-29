import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/selectChapter/select_chapter.dart';
import 'package:quiz_app/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mainMenu/loading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Shared.prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SelectChapter();
          }
          return Loading();
        },
      ),
    );
  }
}
