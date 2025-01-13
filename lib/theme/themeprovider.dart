import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // Standard auf System-Theme

  // Getter für ThemeMode
  ThemeMode get themeMode => _themeMode;

  // Setter für ThemeMode
  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  // Methode: System-Theme aktivieren
  void setTheme(mode) {
    themeMode = mode;
  }
}
