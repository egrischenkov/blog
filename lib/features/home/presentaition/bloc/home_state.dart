part of 'home_bloc.dart';

/// Data status of home page.
enum HomeStatus {
  /// @nodoc
  initial,

  /// @nodoc
  loading,

  /// @nodoc
  success,

  /// @nodoc
  failure,
}

/// @nodoc
extension HomeStatusX on HomeStatus {
  /// Before anything loads.
  bool get isInitial => this == HomeStatus.initial;

  /// During the API call.
  bool get isLoading => this == HomeStatus.loading;

  /// If the API call successful
  bool get isSuccess => this == HomeStatus.success;

  /// If the API call unsuccessful.
  bool get isFailure => this == HomeStatus.failure;
}

/// @nodoc
final class HomeState extends Equatable {
  /// @nodoc
  final HomeStatus status;

  /// @nodoc
  const HomeState({
    this.status = HomeStatus.initial,
  });

  /// @nodoc
  HomeState copyWith({
    HomeStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
