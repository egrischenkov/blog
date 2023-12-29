import 'package:bloc/bloc.dart';
import 'package:blog/core/common/services/theme_service/i_theme_service.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

/// @nodoc.
class HomeCubit extends Cubit<HomeState> {
  // ignore: unused_field
  final IThemeService _themeService;

  /// @nodoc
  HomeCubit(this._themeService) : super(const HomeState()) {
    _init();
  }

  Future<void> _init() async {}
}
