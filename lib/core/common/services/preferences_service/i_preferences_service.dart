/// Preferences.
abstract interface class IPreferencesService {
  /// Sets value to preferences.
  Future<bool> set(PreferencesKey key, Object? value);

  /// Gets value from prefernces.
  T? get<T>(PreferencesKey key, [T? defaultValue]);
}

/// Key for preference's value.
enum PreferencesKey {
  /// Theme key.
  theme,

  /// Locale key.
  locale,
}
