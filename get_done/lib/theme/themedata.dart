import 'package:flutter/material.dart';
import 'package:get_done/theme/themeprovider.dart';
import 'package:provider/provider.dart';

ThemeData lightMode(BuildContext context) {
  Color personalizedColor =
      Provider.of<ThemeProvider>(context).personalizedColor;

  return ThemeData(
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      // bodySmall: TextStyle(
      //   color: Colors.white,
      // ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    ),
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      surface: const Color.fromARGB(255, 239, 239, 239),
      primary: Colors.white,
      secondary: Colors.black,
      tertiary: Colors.grey.shade800,
      primaryContainer: const Color.fromARGB(255, 250, 250, 250),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color.alphaBlend(
          personalizedColor.withValues(alpha: 0.35), Colors.grey.shade200),
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w900,
        color: Colors.green,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.black,
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
        color: Colors.grey.shade900,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      iconColor: Colors.grey.shade800,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all<Color>(personalizedColor),
    ),
    chipTheme: ChipThemeData(
      labelStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      selectedColor: Color.alphaBlend(personalizedColor.withValues(alpha: 0.2), Colors.grey.shade300),
    ),
  );
}

ThemeData darkMode(BuildContext context) {
  Color personalizedColor = Provider.of<ThemeProvider>(context).personalizedColor;
  
  return ThemeData(
    fontFamily: 'Poppins',
    textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins'
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
        )),
    colorScheme: ColorScheme.light(
      brightness: Brightness.dark,
      surface: const Color.fromARGB(255, 27, 27, 27),
      primary: Colors.black,
      secondary: Colors.white,
      tertiary: Colors.grey.shade400,
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
        color: Colors.grey.shade200,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      iconColor: Colors.grey.shade200,
      subtitleTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all<Color>(personalizedColor),
    ),
    chipTheme: ChipThemeData(
      labelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      selectedColor: Color.alphaBlend(personalizedColor.withValues(alpha: 0.2), Colors.grey.shade700),
    ),
  );
}

List<Color> personalizableColors = [
  Colors.pink,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.grey, //todo silber
];
int currentPersonalizableColor = 1;
// Color personalizedColor = personalizableColors[currentPersonalizableColor];
