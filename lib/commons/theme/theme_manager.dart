import 'package:flutter/material.dart';
import '../preferences.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    StorageHelper.setBool(StorageKeys.theme, isDark);
    notifyListeners();
  }
}

var theme = ThemeManager();
