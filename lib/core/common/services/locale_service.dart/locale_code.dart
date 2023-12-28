import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Representsl string code of locale.
enum LocaleCode {
  /// @nodoc
  en,

  /// @nodoc
  ru,
}

/// Extension on [LocaleCode].
///
/// Allows to select appropriate localizations.
extension LocaleCodeExtension on LocaleCode {
  /// Gets appropriate title according to current [LocaleCode].
  String getTitle(AppLocalizations l10n) => switch (this) {
        LocaleCode.en => l10n.settingsLanguageEnglish,
        LocaleCode.ru => l10n.settingsLanguageRussian,
      };
}
