import 'package:blog/core/common/services/preferences_service/i_preferences_service.dart';
import 'package:blog/core/common/services/theme_service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/preferences_service_mock.dart';

const darkTheme = 'dark';
const lightTheme = 'light';

void main() {
  group('Theme service test.', () {
    late PreferencesServiceMock preferencesServiceMock;

    setUp(() {
      preferencesServiceMock = PreferencesServiceMock();
    });

    test('Initial theme sets correctly. User hasn\'t selected theme yet.', () {
      when(() => preferencesServiceMock.get<String>(PreferencesKey.theme)).thenReturn(null);
      final themeService = ThemeService(preferencesServiceMock);

      final themeMode = themeService.currentThemeMode;

      expect(themeMode, ThemeMode.system);
    });

    test('Initial theme sets correctly. User has already selected one.', () {
      when(() => preferencesServiceMock.get<String>(PreferencesKey.theme)).thenReturn(darkTheme);
      final themeService = ThemeService(preferencesServiceMock);

      final themeMode = themeService.currentThemeMode;

      expect(themeMode, ThemeMode.dark);
    });

    test('Switches theme while system theme is currently selected.', () {
      when(() => preferencesServiceMock.get<String>(PreferencesKey.theme)).thenReturn(null);
      when(() => preferencesServiceMock.set(PreferencesKey.theme, any())).thenAnswer((_) => Future.value(true));
      final themeService = ThemeService(preferencesServiceMock);

      themeService.switchTheme();

      expect(themeService.currentThemeMode, ThemeMode.system);
    });

    test('Switches theme while light theme is currently selected.', () {
      when(() => preferencesServiceMock.get<String>(PreferencesKey.theme)).thenReturn(lightTheme);
      when(() => preferencesServiceMock.set(PreferencesKey.theme, any())).thenAnswer((_) => Future.value(true));
      final themeService = ThemeService(preferencesServiceMock);

      themeService.switchTheme();

      expect(themeService.currentThemeMode, ThemeMode.dark);
    });

    test('Switches theme while dark theme is currently selected.', () {
      when(() => preferencesServiceMock.get<String>(PreferencesKey.theme)).thenReturn(darkTheme);
      when(() => preferencesServiceMock.set(PreferencesKey.theme, any())).thenAnswer((_) => Future.value(true));
      final themeService = ThemeService(preferencesServiceMock);

      themeService.switchTheme();

      expect(themeService.currentThemeMode, ThemeMode.light);
    });
  });
}
