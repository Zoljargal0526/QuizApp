import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  late SharedPreferences _prefs;
  static var shared = Shared();
  int _levelData = 1;
  Shared() {
    //_levelData = getLevel();
  }
  Future<int> getLevel() async {
    _prefs = await SharedPreferences.getInstance();
    final int level = (_prefs.getInt('level') ?? 1);
    return level;
  }

  Future<void> incrementLevel(int level) async {
    _prefs = await SharedPreferences.getInstance();
    level = (_prefs.getInt('level') ?? 1) + 1;
    _prefs.setInt("level", level);
  }
}
