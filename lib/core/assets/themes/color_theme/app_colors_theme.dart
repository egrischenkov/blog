import 'package:blog/core/assets/themes/color_theme/colors_palette.dart';
import 'package:flutter/material.dart';

/// Colors that we directly use in devlopment.
///
/// For example in {@macro app_theme_data}:
/// ```dart
/// ThemeData(
///   extensions: [AppColorsTheme.light(), _textTheme],
///   colorScheme: ColorScheme(
///     brightness: Brightness.light,
///     primary: AppColorsTheme.light().primary,
///   ),
/// )
/// ```
@immutable
final class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  /// Base branding color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  final Color primary;

  /// The color of the text on [primary].
  final Color onPrimary;

  /// Secondary branding color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  ///
  /// Complements [primary] color.
  final Color secondary;

  /// The color of the text on [secondary].
  final Color onSecondary;

  /// Surface color.
  ///
  /// Usually, the background color of cards, alerts, dialogs, bottom sheets, etc
  /// is considered a surface.
  final Color surface;

  /// The color of the text on [surface].
  final Color onSurface;

  /// Background color.
  ///
  /// Usually refers to the general background of the screen.
  final Color background;

  /// The color of the text on [background].
  final Color onBackground;

  /// Text body color.
  final Color textBodyColor;

  /// Text display color
  final Color textDisplayColor;

  /// Color of danger.
  ///
  /// Commonly used to display errors.
  final Color danger;

  /// The color of the text on [danger].
  final Color onDanger;

  /// Color of inactive or just grey items.
  final Color inactive;

  /// Color for accent details.
  final Color accent;

  /// Secondary color for accent details.
  final Color secondaryAccent;

  /// Base light theme.
  const AppColorsTheme.light()
      : primary = ColorsPalette.violetsAreBlue,
        onPrimary = ColorsPalette.white,
        secondary = ColorsPalette.lotion,
        onSecondary = ColorsPalette.onyx,
        surface = ColorsPalette.white,
        onSurface = ColorsPalette.onyx,
        background = ColorsPalette.white,
        onBackground = ColorsPalette.onyx,
        textBodyColor = ColorsPalette.onyx,
        textDisplayColor = ColorsPalette.onyx,
        danger = ColorsPalette.begonia,
        onDanger = ColorsPalette.white,
        inactive = ColorsPalette.coolGrey,
        accent = ColorsPalette.violetsAreBlue,
        secondaryAccent = ColorsPalette.paleChestnut;

  /// Base dark theme.
  const AppColorsTheme.dark()
      : primary = ColorsPalette.palatinateBlue,
        onPrimary = ColorsPalette.white,
        secondary = ColorsPalette.eerieBlack,
        onSecondary = ColorsPalette.white,
        surface = ColorsPalette.raisinBlack,
        onSurface = ColorsPalette.white,
        background = ColorsPalette.raisinBlack,
        onBackground = ColorsPalette.white,
        textBodyColor = ColorsPalette.white,
        textDisplayColor = ColorsPalette.white,
        danger = ColorsPalette.begonia,
        onDanger = ColorsPalette.white,
        inactive = ColorsPalette.coolGrey,
        accent = ColorsPalette.violetsAreBlue,
        secondaryAccent = ColorsPalette.paleChestnut;

  const AppColorsTheme._({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.onSurface,
    required this.background,
    required this.onBackground,
    required this.textBodyColor,
    required this.textDisplayColor,
    required this.danger,
    required this.onDanger,
    required this.inactive,
    required this.accent,
    required this.secondaryAccent,
  });

  @override
  ThemeExtension<AppColorsTheme> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? surface,
    Color? surfaceSecondary,
    Color? onSurface,
    Color? background,
    Color? onBackground,
    Color? textBodyColor,
    Color? textDisplayColor,
    Color? danger,
    Color? onDanger,
    Color? inactive,
    Color? accent,
    Color? secondaryAccent,
  }) {
    return AppColorsTheme._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      textBodyColor: textBodyColor ?? this.textBodyColor,
      textDisplayColor: textDisplayColor ?? this.textDisplayColor,
      danger: danger ?? this.danger,
      onDanger: onDanger ?? this.onDanger,
      inactive: inactive ?? this.inactive,
      accent: accent ?? this.accent,
      secondaryAccent: secondaryAccent ?? this.secondaryAccent,
    );
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
    ThemeExtension<AppColorsTheme>? other,
    double t,
  ) {
    if (other is! AppColorsTheme) {
      return this;
    }

    return AppColorsTheme._(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      textBodyColor: Color.lerp(textBodyColor, other.textBodyColor, t)!,
      textDisplayColor: Color.lerp(textDisplayColor, other.textDisplayColor, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      onDanger: Color.lerp(onDanger, other.onDanger, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      secondaryAccent: Color.lerp(secondaryAccent, other.secondaryAccent, t)!,
    );
  }
}
