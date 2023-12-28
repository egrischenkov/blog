import 'package:flutter/material.dart';

/// Theme service.
abstract class IThemeService with ChangeNotifier {
  /// Gets current theme mode.
  abstract ThemeMode currentThemeMode;

  /// Method for switching theme.
  Future<void> selectTheme(ThemeMode selectedThemeMode);
}
