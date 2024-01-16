import 'package:blog/core/common/services/locale_service.dart/i_locale_service.dart';
import 'package:blog/core/common/services/theme_service/i_theme_service.dart';
import 'package:blog/features/home/data/converters/articles_converter.dart';
import 'package:blog/features/home/data/data_providers/home_data_provider.dart';
import 'package:blog/features/home/data/repositories/home_repository.dart';
import 'package:blog/features/home/presentaition/bloc/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Creates instance of [HomeCubit] and injects required dependencies.
HomeCubit createHomeCubit(BuildContext context) {
  final localeService = context.read<ILocaleService>();
  return HomeCubit(
    context.read<IThemeService>(),
    context.read<ILocaleService>(),
    HomeRepository(
      articlesConverter: ArticlesConverter(),
      dataProvider: HomeDataProvider(context, localeService.currentLocale.languageCode),
    ),
  );
}
