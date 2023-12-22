import 'package:blog/core/assets/themes/color_theme/app_colors_theme.dart';
import 'package:blog/core/assets/themes/text_theme/app_text_theme.dart';
import 'package:flutter/material.dart';

/// {@template app_theme_data}
/// Class of the app themes data..
/// {@endtemplate}
abstract final class AppThemeData {
  /// Light theme configuration.
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _lightColorScheme.primary,
      onPrimary: _lightColorScheme.onPrimary,
      secondary: _lightColorScheme.secondary,
      onSecondary: _lightColorScheme.onSecondary,
      error: _lightColorScheme.danger,
      onError: _lightColorScheme.onDanger,
      background: _lightColorScheme.background,
      onBackground: _lightColorScheme.onBackground,
      surface: _lightColorScheme.surface,
      onSurface: _lightColorScheme.onSurface,
    ),
    textTheme: const TextTheme().apply(
      bodyColor: _lightColorScheme.textBodyColor,
      displayColor: _lightColorScheme.textDisplayColor,
    ),
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.primary,
      elevation: 0,
      iconTheme: IconThemeData(
        color: _lightColorScheme.onPrimary,
      ),
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    extensions: [_lightColorScheme, _textTheme],
  );

  /// Dark theme configuration.
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _darkColorScheme.primary,
      onPrimary: _darkColorScheme.onPrimary,
      secondary: _darkColorScheme.secondary,
      onSecondary: _darkColorScheme.onSecondary,
      error: _darkColorScheme.danger,
      onError: _darkColorScheme.onDanger,
      background: _darkColorScheme.background,
      onBackground: _darkColorScheme.onBackground,
      surface: _darkColorScheme.surface,
      onSurface: _darkColorScheme.onSurface,
    ),
    textTheme: const TextTheme().apply(
      bodyColor: _darkColorScheme.textBodyColor,
      displayColor: _darkColorScheme.textDisplayColor,
    ),
    appBarTheme: AppBarTheme(
      color: _darkColorScheme.primary,
      elevation: 0,
      iconTheme: IconThemeData(
        color: _darkColorScheme.onPrimary,
      ),
    ),
    scaffoldBackgroundColor: _darkColorScheme.background,
    extensions: [_darkColorScheme, _textTheme],
  );

  static const _lightColorScheme = AppColorsTheme.light();
  static const _darkColorScheme = AppColorsTheme.dark();

  static final _textTheme = AppTextTheme.base();
}
