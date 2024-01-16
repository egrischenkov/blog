import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blog/core/common/services/locale_service.dart/i_locale_service.dart';
import 'package:blog/core/common/services/theme_service/i_theme_service.dart';
import 'package:blog/features/home/domain/entities/article_entity.dart';
import 'package:blog/features/home/domain/repositories/i_home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

/// Cubit for HomePage.
class HomeCubit extends Cubit<HomeState> {
  final IThemeService _themeService;
  final ILocaleService _localeService;
  // ignore: unused_field
  final IHomeRepository _homeRepository;

  /// @nodoc
  HomeCubit(
    this._themeService,
    this._localeService,
    this._homeRepository,
  ) : super(const HomeState()) {
    _initArticles();
  }

  /// Gets current [ThemeMode]
  ThemeMode get currentThemeMode => _themeService.currentThemeMode;

  /// Changes theme.
  void changeTheme(ThemeMode selectedThemeMode) {
    _themeService.selectTheme(selectedThemeMode);
  }

  /// Changes locale.
  void changeLocale(String selectedLocaleCode) {
    _localeService.selectLocale(selectedLocaleCode);
  }

  /// Updates list of articles.
  void updateArticles() => _initArticles();

  Future<void> _initArticles() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final articles = await _homeRepository.getArticles();

      emit(state.copyWith(status: HomeStatus.success, articles: articles));
    } catch (e, st) {
      log('Error occurred on loading articles: $e,\n$st');
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
