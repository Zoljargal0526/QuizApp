import 'dart:math';

import 'package:quiz_app/storagef.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'audio_player.dart';
import 'database.dart';

class Shared {
  static late final SharedPreferences prefs;
  static late final Database db;
  static late final StorageF storagef;
  static late final AudioPlayerR audioPlayerR;
  static const _chars = 'АБВГДЕЖЗИЛМНОӨРСТУҮХЦЧЭЮЯ';

  static final Random _rnd = Random();
  static String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

/* int levelData = 1;
  Future<int> getLevel() async {
    levelData = (prefs.getInt('level') ?? 1);
    return levelData;
  }

  Future<void> incrementLevel(int level) async {
    level = (prefs.getInt('level') ?? 1) + 1;
    prefs.setInt("level", level);
    levelData = level;
  }*/
  static const randomstr = [
    'Нохой',
    "Заан",
    "Гүрвэл",
    "Болжмор",
    "Үхэр",
    "Ямаа",
    "Хонь",
    "Могой",
    "гахай",
    "муур",
    "галуу",
    "тахиа",
    "чоно",
    "үнэг",
    "туулай",
    "шоргоолж",
    "Булга",
    "Шар шувуу",
    "Тоншуул",
    "Матар",
    "Минж",
    "Хандгай",
    "Хэрэм",
    "Үен",
    "Жирх",
    "Суусар",
    "Хярс",
    "Шилүүс",
    "Ирвэс",
    "Дорго",
    "Бор гөрөөс",
    "Хүдэр",
    "Буга",
    "Зээр",
    "Цаа Буга",
    "гөрөөс",
    "Хулан",
    "оцон шувуу",
    "Тахь",
    "Тэмээ",
    "Тарвага",
    "Зурам",
    "Мануул",
    "Зээх",
    "Өмхий хүрэн",
    "Чандага",
    "Зараа",
    "Хулгана",
    "Загас",
    "Зөгий",
    "Бар",
    "Арслан",
  ];
}
