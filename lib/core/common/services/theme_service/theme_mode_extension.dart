import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Extension on [ThemeMode].
///
/// Allows to select appropriate localizations.
extension ThemeModeExtension on ThemeMode {
  /// Gets appropriate title according to current [ThemeMode].
  String getTitle(AppLocalizations l10n) => switch (this) {
        ThemeMode.system => l10n.settingsAppearanceSystemTheme,
        ThemeMode.light => l10n.settingsAppearanceLightTheme,
        ThemeMode.dark => l10n.settingsAppearanceDarkTheme,
      };
}
