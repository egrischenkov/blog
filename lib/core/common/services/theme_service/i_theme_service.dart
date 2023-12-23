import 'package:flutter/material.dart';

/// Theme service.
abstract class IThemeService with ChangeNotifier {
  /// Gets current theme mode.
  ThemeMode get currentThemeMode;

  /// Method for switching theme.
  void switchTheme();
}
