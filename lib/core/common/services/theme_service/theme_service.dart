import 'package:blog/core/common/services/preferences_service/i_preferences_service.dart';
import 'package:blog/core/common/services/theme_service/i_theme_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

/// A service that stores and retrieves app theme mode.
class ThemeService extends IThemeService {
  final IPreferencesService _preferencesService;
  @override
  late ThemeMode currentThemeMode;

  /// Creates instance of [ThemeService] with preferences - [IPreferencesService].
  ThemeService(this._preferencesService) {
    currentThemeMode = _getCurrentTheme();
  }

  @override
  Future<void> selectTheme(ThemeMode selectedThemeMode) async {
    if (currentThemeMode == selectedThemeMode) return;

    currentThemeMode = selectedThemeMode;
    await _preferencesService.set(PreferencesKey.theme, currentThemeMode.name);

    notifyListeners();
  }

  ThemeMode _getCurrentTheme() {
    final currentTheme = _preferencesService.get<String>(PreferencesKey.theme);
    return ThemeMode.values.firstWhereOrNull((e) => e.name == currentTheme) ?? ThemeMode.system;
  }
}
