import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static late final SharedPreferences prefs;
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
}
