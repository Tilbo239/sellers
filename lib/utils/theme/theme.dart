import 'package:flutter/material.dart';
import 'package:sellers/utils/theme/custom_themes/text_theme.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF0099fe));

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: kColorScheme,
    scaffoldBackgroundColor: kColorScheme.onPrimary,
    textTheme: TTextTeme.lightTextTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
