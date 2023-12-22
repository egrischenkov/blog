import 'package:blog/core/assets/themes/text_theme/app_text_style.dart';
import 'package:flutter/material.dart';

/// App text style scheme.
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  /// Text style 11_400.
  final TextStyle regular11;

  /// Text style 14_400.
  ///
  /// This text size will be used on screens where paragraphs of text are required,
  /// or longer reading. Ej: Article text
  final TextStyle regular14;

  /// Text style 16_400.
  final TextStyle regular16;

  /// Text style 15_600 for titles components.
  ///
  /// This text size will be used for smaller titles within components,
  /// for example: title of recipes or title of chat conversations
  final TextStyle semibold15;

  /// Text style 10_700 for bottom menu.
  ///
  /// This text size will only be used in the menu sections of the app.
  /// Do not use a font smaller than this size.
  final TextStyle bold10;

  /// Text style 12_700 for labels.
  final TextStyle bold12;

  /// Text style 14_700.
  final TextStyle bold14;

  /// Text style 16_700 for titles, buttons.
  ///
  /// This text size will be used for component section titles.
  /// This text size will be used for all actionable texts.
  final TextStyle bold16;

  /// Text style 18_700 for H2.
  final TextStyle bold18;

  /// Text style 22_700 for H1.
  ///
  /// This text size will be used on screens where an important message needs to be communicated
  /// in large and does not require more than two lines of text. Example “Hit your Health Goals”
  final TextStyle bold22;

  /// Text style 24_700 for avatar.
  final TextStyle bold24;

  const AppTextTheme._({
    required this.regular11,
    required this.regular14,
    required this.regular16,
    required this.semibold15,
    required this.bold10,
    required this.bold12,
    required this.bold14,
    required this.bold16,
    required this.bold18,
    required this.bold22,
    required this.bold24,
  });

  /// Base app text theme.
  AppTextTheme.base()
      : regular11 = AppTextStyle.regular11.value,
        regular14 = AppTextStyle.regular14.value,
        regular16 = AppTextStyle.regular16.value,
        semibold15 = AppTextStyle.semibold15.value,
        bold10 = AppTextStyle.bold10.value,
        bold12 = AppTextStyle.bold12.value,
        bold14 = AppTextStyle.bold14.value,
        bold16 = AppTextStyle.bold16.value,
        bold18 = AppTextStyle.bold18.value,
        bold22 = AppTextStyle.bold22.value,
        bold24 = AppTextStyle.bold24.value;

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme._(
      regular11: TextStyle.lerp(regular11, other.regular11, t)!,
      regular14: TextStyle.lerp(regular14, other.regular14, t)!,
      regular16: TextStyle.lerp(regular16, other.regular16, t)!,
      semibold15: TextStyle.lerp(semibold15, other.semibold15, t)!,
      bold10: TextStyle.lerp(bold10, other.bold10, t)!,
      bold12: TextStyle.lerp(bold12, other.bold12, t)!,
      bold14: TextStyle.lerp(bold14, other.bold14, t)!,
      bold16: TextStyle.lerp(bold16, other.bold16, t)!,
      bold18: TextStyle.lerp(bold18, other.bold18, t)!,
      bold22: TextStyle.lerp(bold22, other.bold22, t)!,
      bold24: TextStyle.lerp(bold24, other.bold24, t)!,
    );
  }

  /// @nodoc.
  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? regular13H20Secondary,
    TextStyle? regular11,
    TextStyle? regular14,
    TextStyle? regular16,
    TextStyle? semibold15,
    TextStyle? bold10,
    TextStyle? bold12,
    TextStyle? bold14,
    TextStyle? bold16,
    TextStyle? bold18,
    TextStyle? bold22,
    TextStyle? bold24,
  }) {
    return AppTextTheme._(
      regular11: regular11 ?? this.regular11,
      regular14: regular14 ?? this.regular14,
      regular16: regular16 ?? this.regular16,
      semibold15: semibold15 ?? this.semibold15,
      bold10: bold10 ?? this.bold10,
      bold12: bold12 ?? this.bold12,
      bold14: bold14 ?? this.bold14,
      bold16: bold16 ?? this.bold16,
      bold18: bold18 ?? this.bold18,
      bold22: bold22 ?? this.bold22,
      bold24: bold24 ?? this.bold24,
    );
  }
}
