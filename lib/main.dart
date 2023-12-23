import 'package:blog/app.dart';
import 'package:blog/core/common/services/preferences_service/preferences_service.dart';
import 'package:blog/core/common/services/theme_service/i_theme_service.dart';
import 'package:blog/core/common/services/theme_service/theme_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final preferences = SharedPreferencesService(sharedPreferences);

  List<SingleChildWidget> appScopeDependencies() {
    return [
      ChangeNotifierProvider<IThemeService>(create: (_) => ThemeService(preferences)),
    ];
  }

  runApp(
    MultiProvider(
      providers: appScopeDependencies(),
      child: const App(),
    ),
  );
}
