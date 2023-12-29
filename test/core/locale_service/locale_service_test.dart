import 'package:blog/core/common/services/locale_service.dart/locale_code.dart';
import 'package:blog/core/common/services/locale_service.dart/locale_service.dart';
import 'package:blog/core/common/services/preferences_service/i_preferences_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../common_mocks/preferences_service_mock.dart';

void main() {
  group('Locale service test.', () {
    late PreferencesServiceMock preferencesServiceMock;

    setUp(() {
      preferencesServiceMock = PreferencesServiceMock();
    });
    test('Initial locale sets correctly. User hasn\'t selected locale yet.', () {
      when(() => preferencesServiceMock.get<String>(PreferencesKey.locale, any())).thenReturn(LocaleCode.ru.name);
      final localeService = LocaleService(preferencesServiceMock);

      final currentLocale = localeService.currentLocale;

      expect(currentLocale.languageCode, LocaleCode.ru.name);
    });

    test('Selects en locale while ru locale is currently selected.', () {
      when(() => preferencesServiceMock.get<String>(PreferencesKey.locale)).thenReturn(LocaleCode.ru.name);
      when(() => preferencesServiceMock.set(PreferencesKey.locale, any())).thenAnswer((_) => Future.value(true));
      final localeService = LocaleService(preferencesServiceMock);

      localeService.selectLocale(LocaleCode.en.name);

      verify(() => preferencesServiceMock.set(PreferencesKey.locale, any()));
      expect(localeService.currentLocale.languageCode, LocaleCode.en.name);
    });

    test('Selects ru locale while en locale is currently selected.', () {
      when(() => preferencesServiceMock.get<String>(PreferencesKey.locale)).thenReturn(LocaleCode.en.name);
      when(() => preferencesServiceMock.set(PreferencesKey.locale, any())).thenAnswer((_) => Future.value(true));
      final localeService = LocaleService(preferencesServiceMock);

      localeService.selectLocale(LocaleCode.ru.name);

      verify(() => preferencesServiceMock.set(PreferencesKey.locale, any()));
      expect(localeService.currentLocale.languageCode, LocaleCode.ru.name);
    });
  });
}
