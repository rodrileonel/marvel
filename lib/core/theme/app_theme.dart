import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData commonTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.black, fontSize: 20),
      bodyMedium: TextStyle(color: AppColors.black, fontSize: 16),
    ),
    primaryColor: AppColors.black,
  );
}

abstract class AppColors {
  // Blue
  static const Color lightBlue = Color(0xFFF0EBF6);

  // Black
  static const Color black = Color(0xFF343434);
}
