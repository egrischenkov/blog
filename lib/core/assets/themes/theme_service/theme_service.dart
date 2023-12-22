import 'package:flutter/material.dart';

/// A service that stores and retrieves app theme mode.
class ThemeService extends ChangeNotifier {
  /// Gets current theme mode.
  ThemeMode get currentThemeMode => _themeMode;

  ThemeMode _themeMode;

  /// Create an instance [ThemeServiceImpl].
  ThemeService(this._themeMode);

  /// Switches theme mode.
  void switchTheme() {
    _themeMode = switch (_themeMode) {
      ThemeMode.light => ThemeMode.dark,
      _ => ThemeMode.light,
    };

    notifyListeners();
  }
}
