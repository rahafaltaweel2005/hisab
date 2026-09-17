import 'package:flutter/material.dart';
import '../../constant/color_const.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: ColorConst.bgLight,

    colorScheme: const ColorScheme.light(
      primary: ColorConst.primary,
      secondary: ColorConst.secondary,
      tertiary: ColorConst.tertiary,
      surface: ColorConst.surfaceLight,
      error: ColorConst.error,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConst.bgLight,
      foregroundColor: ColorConst.textDark,
      elevation: 0,
      centerTitle: false,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: ColorConst.textDark,
      ),

      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: ColorConst.textDark,
      ),

      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ColorConst.textDark,
      ),

      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: ColorConst.textDark,
      ),

      bodyLarge: TextStyle(
        fontSize: 16,
        color: ColorConst.textDark,
      ),

      bodyMedium: TextStyle(
        fontSize: 14,
        color: ColorConst.neutral,
      ),

      bodySmall: TextStyle(
        fontSize: 12,
        color: ColorConst.neutral,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorConst.surfaceLight,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: ColorConst.border,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: ColorConst.border,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: ColorConst.primary,
          width: 1.5,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: ColorConst.error,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: ColorConst.error,
          width: 1.5,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConst.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 52),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),

        elevation: 0,

        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorConst.primary,

        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    cardTheme: CardThemeData(
      color: ColorConst.surfaceLight,
      elevation: 0,
      margin: EdgeInsets.zero,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(
          color: ColorConst.border,
        ),
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: ColorConst.border,
      thickness: 1,
    ),
  );
}