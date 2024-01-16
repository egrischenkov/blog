part of 'home_cubit.dart';

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
  final List<ArticleEntity> articles;

  /// @nodoc
  const HomeState({
    this.status = HomeStatus.initial,
    this.articles = const [],
  });

  /// @nodoc
  HomeState copyWith({
    HomeStatus? status,
    List<ArticleEntity>? articles,
  }) {
    return HomeState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object> get props => [status, articles];
}
