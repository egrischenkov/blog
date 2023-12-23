import 'package:blog/app.dart';
import 'package:blog/core/common/services/theme_service/i_theme_service.dart';
import 'package:blog/core/common/services/theme_service/theme_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  List<SingleChildWidget> appScopeDependencies() {
    return [
      ChangeNotifierProvider<IThemeService>(create: (_) => ThemeService(ThemeMode.system)),
    ];
  }

  runApp(
    MultiProvider(
      providers: appScopeDependencies(),
      child: const App(),
    ),
  );
}
