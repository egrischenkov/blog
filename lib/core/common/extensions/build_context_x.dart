import 'package:blog/core/assets/themes/color_theme/app_colors_theme.dart';
import 'package:blog/core/assets/themes/text_theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Extension for convenient access to members available through [BuildContext].
extension BuildContextX on BuildContext {
  /// Access to [AppLocalizations]
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  /// Access to [AppTextTheme] extension.
  AppTextTheme get textTheme => Theme.of(this).extension<AppTextTheme>()!;

  /// Access to [AppColorsTheme] extension.
  AppColorsTheme get colorTheme => Theme.of(this).extension<AppColorsTheme>()!;
}
