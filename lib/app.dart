import 'package:blog/core/assets/themes/theme_data.dart';
import 'package:blog/core/common/services/theme_service/i_theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

/// Application widget.
///
/// Includes [MaterialApp]'s settings.
class App extends StatelessWidget {
  /// @nodoc
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IThemeService>(
      builder: (_, themeService, __) => AnimatedBuilder(
        animation: themeService,
        builder: (_, __) {
          return MaterialApp(
            home: const Placeholder(),
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: themeService.currentThemeMode,
            localizationsDelegates: _localizationsDelegates,
            supportedLocales: _localizations,
          );
        },
      ),
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
