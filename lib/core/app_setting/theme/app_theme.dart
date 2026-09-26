import 'package:flutter/material.dart';
import '../../constant/app_spacing.dart';
import '../../constant/color_const.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: ColorConst.bgLight,

    colorScheme: const ColorScheme.light(
      primary: ColorConst.primary,
      onPrimary: ColorConst.textLight,
      secondary: ColorConst.secondary,
      tertiary: ColorConst.tertiary,
      surface: Colors.white,
      onSurface: ColorConst.textDark,
      onSurfaceVariant: ColorConst.neutral,
      surfaceContainerHighest: ColorConst.surfaceLight,
      outline: ColorConst.border,
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
      hintStyle: TextStyle(
        color: ColorConst.neutral.withValues(alpha: 0.55),
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(
          color: ColorConst.border,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(
          color: ColorConst.border,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(
          color: ColorConst.primary,
          width: 1.5,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(
          color: ColorConst.error,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
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
        minimumSize: const Size(64, 52),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
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
        borderRadius: BorderRadius.circular(AppRadius.lg),
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