import 'dart:ui';

import 'package:blog/core/common/services/locale_service.dart/i_locale_service.dart';
import 'package:blog/core/common/services/locale_service.dart/locale_code.dart';
import 'package:blog/core/common/services/preferences_service/i_preferences_service.dart';

/// Locale Service implementation.
final class LocaleService extends ILocaleService {
  final IPreferencesService _preferencesService;

  /// @nodoc
  LocaleService(this._preferencesService) {
    currentLocale = _getCurrentLocale();
  }

  @override
  late Locale currentLocale;

  @override
  void selectLocale(String selectedLocaleCode) {
    final selectedLocale = Locale(selectedLocaleCode);
    currentLocale = selectedLocale;
    _saveLocaleToPreferences(selectedLocale);

    notifyListeners();
  }

  void _saveLocaleToPreferences(Locale selectedLocale) {
    _preferencesService.set(PreferencesKey.locale, selectedLocale);
  }

  Locale _getCurrentLocale() {
    final currentlocaleCode = _preferencesService.get<String>(PreferencesKey.locale, LocaleCode.en.name);
    final isInitialLocaleSupported =
        LocaleCode.values.map((e) => e.name).contains(currentlocaleCode) && currentlocaleCode != null;
    return Locale(
      isInitialLocaleSupported ? currentlocaleCode : LocaleCode.en.name,
    );
  }
}
