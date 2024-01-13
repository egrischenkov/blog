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
    // TODO(egrischenkov): String representation must be as: '2002-02-27'.
    required DateTime createdAt,
  }) = _ArticleEntity;
}
