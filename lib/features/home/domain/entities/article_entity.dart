import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_entity.freezed.dart';

/// @nodoc
@freezed
class ArticleEntity with _$ArticleEntity {
  /// @nodoc
  const factory ArticleEntity({
    required String title,
    required String topic,
    required String articleInMarkdown,
    required String imagePath,
    required DateTime createdAt,
  }) = _ArticleEntity;
}
