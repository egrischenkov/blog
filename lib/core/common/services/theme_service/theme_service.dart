import 'package:blog/core/common/services/theme_service/i_theme_service.dart';
import 'package:flutter/material.dart';

/// A service that stores and retrieves app theme mode.
class ThemeService extends IThemeService {
  @override
  ThemeMode get currentThemeMode => _themeMode;

  ThemeMode _themeMode;

  /// Create an instance [ThemeService].
  ThemeService(this._themeMode);

  @override
  void switchTheme() {
    _themeMode = switch (_themeMode) {
      ThemeMode.light => ThemeMode.dark,
      _ => ThemeMode.light,
    };

    notifyListeners();
  }
}
