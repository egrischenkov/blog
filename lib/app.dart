import 'package:blog/core/assets/themes/theme_data.dart';
import 'package:blog/core/common/services/locale_service.dart/i_locale_service.dart';
import 'package:blog/core/common/services/theme_service/i_theme_service.dart';
import 'package:blog/features/home/presentaition/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

const _title = 'Grischenkov\'s BLOG';

/// Application widget.
///
/// Includes [MaterialApp]'s settings.
class App extends StatelessWidget {
  /// @nodoc
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<IThemeService, ILocaleService>(
      builder: (_, themeService, localeService, __) => AnimatedBuilder(
        animation: themeService,
        builder: (_, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: _title,
            home: HomePage(),
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: themeService.currentThemeMode,
            locale: localeService.currentLocale,
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
