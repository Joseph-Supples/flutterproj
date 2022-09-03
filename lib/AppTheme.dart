import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF5F6F8),
    listTileTheme: ListTileThemeData(
      iconColor: const Color(0xFFa8c7f8),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: Colors.teal,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    textTheme: Typography.blackMountainView
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF101E33),
    listTileTheme: ListTileThemeData(
      iconColor: const Color(0xFF305B99),
      textColor: const Color(0xFFDDDFE2),

    ),
    appBarTheme: AppBarTheme(
      color: const Color(0xFF8791a5),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF101E33),
      onPrimary: const Color(0xFF101E33),
      primaryVariant: Colors.black,
      secondary: const Color(0xFF8791a5),
    ),
    cardTheme: CardTheme(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    textTheme: TextTheme(
      titleSmall: (
          TextStyle(
            color: Colors.red,
            fontSize: 16
          )
      ),
      bodySmall: TextStyle(
          color: Colors.grey,
          fontSize: 12
      )
    ) //Typography.whiteMountainView
  );
}