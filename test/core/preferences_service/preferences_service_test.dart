import 'package:blog/core/common/services/preferences_service/i_preferences_service.dart';
import 'package:blog/core/common/services/preferences_service/preferences_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesMock extends Mock implements SharedPreferences {}

const testString = 'test';

void main() {
  group('Preferences service tests.', () {
    late SharedPreferencesService preferences;
    late SharedPreferencesMock sharedPreferencesMock;

    setUp(() {
      sharedPreferencesMock = SharedPreferencesMock();
      preferences = SharedPreferencesService(sharedPreferencesMock);
    });

    group('Testing set method.', () {
      test('Setting a String value in preferences evaluates to true.', () async {
        when(() => sharedPreferencesMock.setString(any(), any())).thenAnswer((_) => Future.value(true));

        for (final preferencesKey in PreferencesKey.values) {
          final result = await preferences.set(preferencesKey, testString);

          verify(() => sharedPreferencesMock.setString(preferencesKey.name, testString));
          verifyNever(() => sharedPreferencesMock.setInt(preferencesKey.name, any()));
          verifyNever(() => sharedPreferencesMock.setBool(preferencesKey.name, any()));

          expect(result, isTrue);
        }
      });

      test('Setting a String value in preferences evaluates to false.', () async {
        when(() => sharedPreferencesMock.setString(any(), any())).thenAnswer((_) => Future.value(false));

        for (final preferencesKey in PreferencesKey.values) {
          final result = await preferences.set(preferencesKey, testString);

          verify(() => sharedPreferencesMock.setString(preferencesKey.name, testString));
          verifyNever(() => sharedPreferencesMock.setInt(preferencesKey.name, any()));
          verifyNever(() => sharedPreferencesMock.setBool(preferencesKey.name, any()));

          expect(result, isFalse);
        }
      });

      test('Setting a bool value in preferences evaluates to true.', () async {
        when(() => sharedPreferencesMock.setBool(any(), any())).thenAnswer((_) => Future.value(true));

        for (final preferencesKey in PreferencesKey.values) {
          final result = await preferences.set(preferencesKey, true);

          verify(() => sharedPreferencesMock.setBool(preferencesKey.name, true));
          verifyNever(() => sharedPreferencesMock.setInt(preferencesKey.name, any()));
          verifyNever(() => sharedPreferencesMock.setString(preferencesKey.name, any()));

          expect(result, isTrue);
        }
      });
      test('Setting a bool value in preferences evaluates to false.', () async {
        when(() => sharedPreferencesMock.setBool(any(), any())).thenAnswer((_) => Future.value(false));

        for (final preferencesKey in PreferencesKey.values) {
          final result = await preferences.set(preferencesKey, false);

          verify(() => sharedPreferencesMock.setBool(preferencesKey.name, false));
          verifyNever(() => sharedPreferencesMock.setInt(preferencesKey.name, any()));
          verifyNever(() => sharedPreferencesMock.setString(preferencesKey.name, any()));

          expect(result, isFalse);
        }
      });

      test('Setting an int value in preferences evaluates to true.', () async {
        when(() => sharedPreferencesMock.setInt(any(), any())).thenAnswer((_) => Future.value(true));

        for (final preferencesKey in PreferencesKey.values) {
          final result = await preferences.set(preferencesKey, 1);

          verify(() => sharedPreferencesMock.setInt(preferencesKey.name, 1));
          verifyNever(() => sharedPreferencesMock.setBool(preferencesKey.name, any()));
          verifyNever(() => sharedPreferencesMock.setString(preferencesKey.name, any()));

          expect(result, isTrue);
        }
      });

      test('Setting a bool value in preferences evaluates to false.', () async {
        when(() => sharedPreferencesMock.setInt(any(), any())).thenAnswer((_) => Future.value(false));

        for (final preferencesKey in PreferencesKey.values) {
          final result = await preferences.set(preferencesKey, 1);

          verify(() => sharedPreferencesMock.setInt(preferencesKey.name, 1));
          verifyNever(() => sharedPreferencesMock.setBool(preferencesKey.name, any()));
          verifyNever(() => sharedPreferencesMock.setString(preferencesKey.name, any()));

          expect(result, isFalse);
        }
      });
    });

    group('Testing get method.', () {
      test('Getting an existing String value.', () {
        when(() => sharedPreferencesMock.get(any())).thenReturn(testString);
        when(() => sharedPreferencesMock.containsKey(any())).thenReturn(true);

        for (final preferencesKey in PreferencesKey.values) {
          final result = preferences.get<String>(preferencesKey);

          verify(() => sharedPreferencesMock.containsKey(preferencesKey.name));
          verify(() => sharedPreferencesMock.get(preferencesKey.name));

          expect(result, testString);
        }
      });

      test('Getting a non-existent String value.', () {
        const defaultValue = 'default';

        when(() => sharedPreferencesMock.getString(any())).thenReturn(null);
        when(() => sharedPreferencesMock.containsKey(any())).thenReturn(false);

        for (final preferencesKey in PreferencesKey.values) {
          final result = preferences.get<String>(preferencesKey, defaultValue);

          verify(() => sharedPreferencesMock.containsKey(preferencesKey.name));
          verifyNever(() => sharedPreferencesMock.get(preferencesKey.name));

          expect(result, defaultValue);
        }
      });

      test('Getting an existing bool value.', () {
        when(() => sharedPreferencesMock.get(any())).thenReturn(true);
        when(() => sharedPreferencesMock.containsKey(any())).thenReturn(true);

        for (final preferencesKey in PreferencesKey.values) {
          final result = preferences.get<bool>(preferencesKey);

          verify(() => sharedPreferencesMock.containsKey(preferencesKey.name));
          verify(() => sharedPreferencesMock.get(preferencesKey.name));

          expect(result, isTrue);
        }
      });

      test('Getting a non-existent bool value.', () {
        const defaultValue = true;

        when(() => sharedPreferencesMock.get(any())).thenReturn(null);
        when(() => sharedPreferencesMock.containsKey(any())).thenReturn(false);

        for (final preferencesKey in PreferencesKey.values) {
          final result = preferences.get<bool>(preferencesKey, defaultValue);

          verify(() => sharedPreferencesMock.containsKey(preferencesKey.name));
          verifyNever(() => sharedPreferencesMock.get(preferencesKey.name));

          expect(result, defaultValue);
        }
      });

      test('Getting an existing int value.', () {
        const expectedResult = 1;

        when(() => sharedPreferencesMock.get(any())).thenReturn(expectedResult);
        when(() => sharedPreferencesMock.containsKey(any())).thenReturn(true);

        for (final preferencesKey in PreferencesKey.values) {
          final result = preferences.get<int>(preferencesKey);

          verify(() => sharedPreferencesMock.containsKey(preferencesKey.name));
          verify(() => sharedPreferencesMock.get(preferencesKey.name));

          expect(result, expectedResult);
        }
      });

      test('Getting a non-existent int value.', () {
        const defaultValue = 1;

        when(() => sharedPreferencesMock.get(any())).thenReturn(null);
        when(() => sharedPreferencesMock.containsKey(any())).thenReturn(false);

        for (final preferencesKey in PreferencesKey.values) {
          final result = preferences.get<int>(preferencesKey, defaultValue);

          verify(() => sharedPreferencesMock.containsKey(preferencesKey.name));
          verifyNever(() => sharedPreferencesMock.get(preferencesKey.name));

          expect(result, defaultValue);
        }
      });

      test('Trying to get unavailable type value.', () {
        expect(() => preferences.get<List<String>>(PreferencesKey.locale), throwsAssertionError);
      });
    });
  });
}
