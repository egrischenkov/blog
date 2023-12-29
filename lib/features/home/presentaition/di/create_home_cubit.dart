import 'package:blog/core/common/services/theme_service/i_theme_service.dart';
import 'package:blog/features/home/presentaition/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Creates instance of [HomeCubit] and injects required dependencies.
HomeCubit createHomeCubit(BuildContext context) {
  return HomeCubit(
    context.read<IThemeService>(),
  );
}
