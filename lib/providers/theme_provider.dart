import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  final SharedPreferences prefs;

  ThemeProvider({required this.prefs}) {
    _loadTheme();
  }

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void _loadTheme() {
    final themeIndex = prefs.getInt(_themeKey) ?? 0;
    switch (themeIndex) {
      case 0:
        _themeMode = ThemeMode.light;
        break;
      case 1:
        _themeMode = ThemeMode.dark;
        break;
      case 2:
        _themeMode = ThemeMode.system;
        break;
      default:
        _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
      prefs.setInt(_themeKey, 1);
    } else if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.system;
      prefs.setInt(_themeKey, 2);
    } else {
      _themeMode = ThemeMode.light;
      prefs.setInt(_themeKey, 0);
    }
    notifyListeners();
  }

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    int index = 0;
    switch (mode) {
      case ThemeMode.light:
        index = 0;
        break;
      case ThemeMode.dark:
        index = 1;
        break;
      case ThemeMode.system:
        index = 2;
        break;
    }
    prefs.setInt(_themeKey, index);
    notifyListeners();
  }

  String getThemeName(String lang) {
    switch (_themeMode) {
      case ThemeMode.light:
        return lang == 'ar' ? 'فاتح' : 'Light';
      case ThemeMode.dark:
        return lang == 'ar' ? 'داكن' : 'Dark';
      case ThemeMode.system:
        return lang == 'ar' ? 'النظام' : 'System';
    }
  }

  IconData getThemeIcon() {
    switch (_themeMode) {
      case ThemeMode.light:
        return Icons.wb_sunny;
      case ThemeMode.dark:
        return Icons.nightlight_round;
      case ThemeMode.system:
        return Icons.settings_brightness;
    }
  }
}
