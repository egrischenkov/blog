// ignore_for_file: public_member_api_docs
import 'package:blog/core/assets/themes/theme_data.dart';
import 'package:blog/core/assets/themes/theme_service/theme_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // TODO(egrischenkov): Need to inject this later.
  final _themeService = ThemeService(ThemeMode.system);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeService,
      builder: (_, __) {
        return MaterialApp(
          home: const Placeholder(),
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          themeMode: _themeService.currentThemeMode,
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: _localizations,
        );
      },
    );
  }
}

const _localizations = [Locale('en', 'EN'), Locale('ru', 'RUS')];

const _localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
