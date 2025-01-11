import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    surface: const Color.fromARGB(255, 248, 248, 248),
    primary: Colors.white,
    secondary: Colors.black,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.alphaBlend(
        personalizedColor.withValues(alpha: 0.35), Colors.grey.shade200),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all<Color>(
        const Color.fromARGB(255, 25, 25, 25),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 34,
      fontWeight: FontWeight.w900,
    ),
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
);

ThemeData darkMode = ThemeData(
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.light(
    brightness: Brightness.dark,
    surface: const Color.fromARGB(255, 24, 24, 24),
    primary: Colors.black,
    secondary: Colors.white,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.alphaBlend(
        personalizedColor.withValues(alpha: 0.2), Colors.grey.shade900),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all<Color>(
        const Color.fromARGB(255, 239, 239, 239),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 34,
      fontWeight: FontWeight.w900,
    ),
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
    ),
  ),
);

List<Color> personalizableColors = [Colors.pink];
int currentPersonalizableColor = 0;
Color personalizedColor = personalizableColors[currentPersonalizableColor];
