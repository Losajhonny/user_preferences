import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  /*
   * No es un gestor de estado
   * por lo tanto no redibuja el widget
   */
  static late SharedPreferences _prefs;
  static String _name = '';
  static bool _isDarkMode = false;
  static int _gender = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // getters &6 setters
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static bool get isDarkmode {
    return _prefs.getBool('isDarkmode') ?? _isDarkMode;
  }

  static set isDarkmode(bool isDarkmode) {
    _isDarkMode = isDarkmode;
    _prefs.setBool('isDarkmode', isDarkmode);
  }

  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int gender) {
    _gender = gender;
    _prefs.setInt('gender', gender);
  }
}
