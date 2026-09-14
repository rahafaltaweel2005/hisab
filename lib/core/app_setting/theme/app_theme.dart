import 'package:flutter/material.dart';
import '../../constant/color_const.dart';

class AppTheme {
  AppTheme._();

  // ==================================================
  // Light Theme
  // ==================================================
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: ColorConst.bgLight,

    fontFamily: 'HankenGrotesk',

    colorScheme: const ColorScheme.light(
      primary: ColorConst.primary,
      secondary: ColorConst.secondary,
      tertiary: ColorConst.tertiary,
      surface: ColorConst.surfaceLight,
      error: ColorConst.error,
      onPrimary: Colors.white,
      onSurface: ColorConst.textDark,
      outline: ColorConst.border,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConst.bgLight,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 2,
      iconTheme: IconThemeData(color: ColorConst.primary),

      // العنوان الرئيسي لكل شاشة (AppBar title)
      titleTextStyle: TextStyle(
        fontFamily: 'Newsreader',
        color: ColorConst.primary,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
    ),

    cardTheme: CardThemeData(
      color: ColorConst.surfaceLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: const BorderSide(color: ColorConst.border, width: 1),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorConst.surfaceLight,

      hintStyle: TextStyle(
        color: ColorConst.neutral.withValues(alpha: 0.55),
        fontSize: 15,
      ),

      // العنوان الفرعي لكل حقل إدخال (Label)
      labelStyle: const TextStyle(
        color: ColorConst.textDark,
        fontWeight: FontWeight.w500,
      ),

      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: ColorConst.border, width: 1),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: ColorConst.primary, width: 1.4),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: ColorConst.error, width: 1.2),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: ColorConst.error, width: 1.4),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConst.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 56),
        elevation: 0,
        textStyle: const TextStyle(
          fontFamily: 'HankenGrotesk',
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorConst.secondary,
        textStyle: const TextStyle(
          fontFamily: 'HankenGrotesk',
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: ColorConst.border,
      thickness: 1,
      space: 1,
    ),

    textTheme: const TextTheme(
      // العنوان الرئيسي الكبير (شاشات مثل "تسجيل الدخول"، "إنشاء حساب")
      headlineLarge: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: ColorConst.primary,
      ),

      // العنوان الرئيسي المتوسط (عناوين الشاشات الداخلية)
      headlineMedium: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: ColorConst.primary,
      ),

      // العنوان الفرعي (تحت العنوان الرئيسي مباشرة، وصف قصير)
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: ColorConst.textDark,
      ),

      // نص فرعي أصغر (وصف تحت العناوين، تلميحات)
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorConst.neutral,
      ),

      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.6,
        color: ColorConst.textDark,
      ),

      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.5,
        color: ColorConst.neutral,
      ),

      // نصوص صغيرة (تواريخ، ملاحظات، Captions)
      bodySmall: TextStyle(
        fontSize: 12,
        color: ColorConst.neutral,
      ),

      // نص الأرقام المالية داخل الجداول (Balance, RemainingAmount)
      labelLarge: TextStyle(
        fontFamily: 'HankenGrotesk',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: ColorConst.textDark,
      ),
    ),
  );

  // ==================================================
  // Dark Theme
  // ==================================================
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: ColorConst.bgDark,

    fontFamily: 'HankenGrotesk',

    colorScheme: const ColorScheme.dark(
      primary: ColorConst.secondary,
      secondary: ColorConst.tertiary,
      tertiary: ColorConst.neutral,
      surface: ColorConst.surfaceDark,
      error: ColorConst.error,
      onPrimary: ColorConst.primary,
      onSurface: ColorConst.textLight,
      outline: ColorConst.borderDark,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConst.bgDark,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorConst.secondary),

      titleTextStyle: TextStyle(
        fontFamily: 'Newsreader',
        color: ColorConst.textLight,
        fontSize: 26,
        fontWeight: FontWeight.w700,
      ),
    ),

    cardTheme: CardThemeData(
      color: ColorConst.surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: const BorderSide(color: ColorConst.borderDark, width: 1),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorConst.surfaceDark,

      hintStyle: TextStyle(color: ColorConst.textLight.withValues(alpha: 0.4)),

      labelStyle: TextStyle(
        color: ColorConst.textLight.withValues(alpha: 0.85),
        fontWeight: FontWeight.w500,
      ),

      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: ColorConst.borderDark, width: 1),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: ColorConst.secondary, width: 1.4),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: ColorConst.error, width: 1.2),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: ColorConst.error, width: 1.4),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConst.secondary,
        foregroundColor: ColorConst.primary,
        minimumSize: const Size(double.infinity, 56),
        elevation: 0,
        textStyle: const TextStyle(
          fontFamily: 'HankenGrotesk',
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorConst.tertiary,
        textStyle: const TextStyle(
          fontFamily: 'HankenGrotesk',
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: ColorConst.borderDark,
      thickness: 1,
      space: 1,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: ColorConst.textLight,
      ),

      headlineMedium: TextStyle(
        fontFamily: 'Newsreader',
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: ColorConst.textLight,
      ),

      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: ColorConst.textLight,
      ),

      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorConst.neutral,
      ),

      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.6,
        color: ColorConst.textLight,
      ),

      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.5,
        color: ColorConst.neutral,
      ),

      bodySmall: TextStyle(
        fontSize: 12,
        color: ColorConst.neutral,
      ),

      labelLarge: TextStyle(
        fontFamily: 'HankenGrotesk',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: ColorConst.textLight,
      ),
    ),
  );

  // ==================================================
  // Helper: لون الأرقام المالية حسب القيمة (موجب/سالب)
  // ==================================================

  /// استخدمها بأي مكان بتعرض فيه Balance أو RemainingAmount
  /// مثال: Text(balance.toString(), style: TextStyle(color: AppTheme.amountColor(balance)))
  static Color amountColor(num value) {
    if (value < 0) return ColorConst.negative;
    if (value > 0) return ColorConst.positive;
    return ColorConst.neutral;
  }
}