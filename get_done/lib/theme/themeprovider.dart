import 'package:flutter/material.dart';
import 'package:get_done/theme/themedata.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    WidgetsBinding.instance.performReassemble();
    notifyListeners();
  }

  void setTheme(mode) {
    themeMode = mode;
  }


  Color _personalizedColor = personalizableColors[currentPersonalizableColor];

  Color get personalizedColor => _personalizedColor;

  void updateColor(Color newColor) {
    _personalizedColor = newColor;
    notifyListeners();
  } 
}
