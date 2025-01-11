import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    surface: const Color.fromARGB(255, 247, 247, 247),
    primary: Colors.white,
    secondary: Colors.black,
    primaryContainer: const Color.fromARGB(255, 250, 250, 250),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.alphaBlend(
        personalizedColor.withValues(alpha: 0.35), Colors.grey.shade200),
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w900,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w700,
    ),
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
    surface: const Color.fromARGB(255, 27, 27, 27),
    primary: Colors.black,
    secondary: Colors.white,
    primaryContainer: const Color.fromARGB(255, 40, 40, 40),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.alphaBlend(
        personalizedColor.withValues(alpha: 0.2), Colors.grey.shade900),
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w900,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w700,
    ),
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
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    subtitleTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
);

List<Color> personalizableColors = [
  Colors.pink,
  Colors.blue,
  Colors.green,
  Colors.orange,
];
int currentPersonalizableColor = 3;
Color personalizedColor = personalizableColors[currentPersonalizableColor];
