import 'package:flutter/material.dart';

/// Service for managing language in the app.
abstract class ILocaleService extends ChangeNotifier {
  /// Current locale.
  abstract Locale currentLocale;

  /// Selects locale.
  void selectLocale(String selectedLocaleCode);
}
