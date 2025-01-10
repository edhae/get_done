import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: const Color.fromARGB(255, 248, 248, 248),
    primary: Colors.white,
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: Color.alphaBlend(
        personalizedColor.withValues(alpha: 0.07), Colors.white),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all<Color>(
        const Color.fromARGB(255, 25, 25, 25),
      ),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color.alphaBlend(
        personalizedColor.withValues(alpha: 0.7), Colors.white),
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: const Color.fromARGB(255, 24, 24, 24),
    primary: Colors.black,
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: Color.alphaBlend(
        personalizedColor.withValues(alpha: 0.07), Colors.black),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all<Color>(
        const Color.fromARGB(255, 239, 239, 239),
      ),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color.alphaBlend(
        personalizedColor.withValues(alpha: 0.7), Colors.black),
  ),
);

List<Color> personalizableColors = [Colors.pink];
int currentPersonalizableColor = 0;
Color personalizedColor = personalizableColors[currentPersonalizableColor];
