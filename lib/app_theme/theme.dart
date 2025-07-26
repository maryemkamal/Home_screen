import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteApp,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainColor,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secnderyColor,
        foregroundColor: AppColors.whiteApp,
        textStyle: const TextStyle(fontSize: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.whiteBloc, fontSize: 18),
      bodyMedium: TextStyle(color: AppColors.whiteBloc, fontSize: 16),
      headlineLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    ),

  );
}
