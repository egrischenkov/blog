import 'package:bloc/bloc.dart';
import 'package:blog/core/common/services/theme_service/i_theme_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

/// Cubit for HomePage.
class HomeCubit extends Cubit<HomeState> {
  final IThemeService _themeService;

  /// @nodoc
  HomeCubit(this._themeService) : super(const HomeState()) {
    _init();
  }

  /// Gets current [ThemeMode]
  ThemeMode get currentThemeMode => _themeService.currentThemeMode;

  /// Changes theme.
  void changeTheme(ThemeMode selectedThemeMode) {
    _themeService.selectTheme(selectedThemeMode);
  }

  Future<void> _init() async {}
}
