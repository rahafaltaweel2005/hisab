import 'package:flutter/material.dart';

/// نظام الألوان الخاص بتطبيق Hisab
/// الأسماء منظمة حسب الاستخدام الفعلي بالواجهة، مش حسب اللون نفسه،
/// عشان لو غيّرت اللون بكرا ما تحتاج تدور بكل مكان بالكود.
class ColorConst {
  ColorConst._(); // منع إنشاء instance من الكلاس

  // ==================================================
  // الألوان الأساسية (Brand Colors)
  // ==================================================

  /// اللون الأساسي — يستخدم في: العنوان الرئيسي، الأزرار الرئيسية،
  /// AppBar، الأيقونات الأساسية، التبويب النشط
  static const Color primary = Color(0xFF1B2A4E); // كحلي داكن

  /// اللون الثانوي — يستخدم في: الأزرار الثانوية، الروابط،
  /// عناصر الوضع الليلي الأساسية (primary بالـ dark theme)
  static const Color secondary = Color(0xFF2E7D6B); // أخضر مطفي (مالي/ثقة)

  /// اللون الثالث — يستخدم في: التمييز اللطيف، badges، highlights بسيطة
  static const Color tertiary = Color(0xFFC9A24B); // ذهبي فاتح

  // ==================================================
  // ألوان النصوص (Text Colors)
  // ==================================================

  /// العنوان الرئيسي والنصوص الأساسية (Headlines, Titles)
  static const Color textDark = Color(0xFF1A1A2E);

  /// العنوان الفرعي والنصوص الثانوية (Subtitles, captions, hints)
  static const Color neutral = Color(0xFF6B7280);

  /// النص فوق خلفية داكنة (Dark mode primary text)
  static const Color textLight = Color(0xFFF5F5F7);

  // ==================================================
  // ألوان الخلفيات (Backgrounds)
  // ==================================================

  /// خلفية الشاشة — الوضع الفاتح
  static const Color bgLight = Color(0xFFF7F8FA);

  /// خلفية الشاشة — الوضع الداكن
  static const Color bgDark = Color(0xFF0F1420);

  /// خلفية الكروت والعناصر المرفوعة — الوضع الفاتح (Cards, Sheets)
  static const Color surfaceLight = Color(0xFFFFFFFF);

  /// خلفية الكروت والعناصر المرفوعة — الوضع الداكن
  static const Color surfaceDark = Color(0xFF1A2233);

  // ==================================================
  // ألوان الحدود (Borders)
  // ==================================================

  /// حدود الحقول والكروت — الوضع الفاتح
  static const Color border = Color(0xFFE2E5EA);

  /// حدود الحقول والكروت — الوضع الداكن
  static const Color borderDark = Color(0xFF2A3245);

  // ==================================================
  // ألوان الحالة (Semantic / Status Colors)
  // ==================================================

  /// الأخطاء ورسائل التحقق الفاشلة (Validation errors, delete confirm)
  static const Color error = Color(0xFFD32F2F);

  /// الرصيد الموجب / القيم الإيجابية (Balance > 0, RemainingAmount > 0)
  static const Color positive = Color(0xFF2E7D6B);

  /// الرصيد السالب / القيم السلبية (Balance < 0, RemainingAmount < 0)
  static const Color negative = Color(0xFFD32F2F);

  /// حالات التحذير الخفيفة (اختياري، لو احتجته لاحقًا)
  static const Color warning = Color(0xFFE0A030);
}