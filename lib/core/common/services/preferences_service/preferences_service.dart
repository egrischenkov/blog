import 'package:blog/core/common/services/preferences_service/i_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Shared preferences service implementation.
class SharedPreferencesService implements IPreferencesService {
  final SharedPreferences _preferences;

  /// @nodoc
  SharedPreferencesService(this._preferences);

  @override
  Future<bool> set(PreferencesKey key, Object? value) async {
    return switch (value) {
      String => await _preferences.setString(key.name, value as String),
      int => await _preferences.setInt(key.name, value as int),
      bool => await _preferences.setBool(key.name, value as bool),
      _ => await _preferences.setString(key.name, value.toString()),
    };
  }

  @override
  T? get<T>(PreferencesKey key, [T? defaultValue]) {
    assert(
      T is String || T is int || T is bool,
      'Unavailable type for getting value from preferences',
    );

    return _preferences.containsKey(key.name) ? _preferences.get(key.name) as T? ?? defaultValue : defaultValue;
  }
}
