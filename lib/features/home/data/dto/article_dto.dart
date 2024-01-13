import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_dto.freezed.dart';

/// @nodoc
@freezed
class ArticleDto with _$ArticleDto {
  /// @nodoc
  const factory ArticleDto({
    required String title,
    required String topic,
    required String articleInMarkdown,
    required String imagePath,
    required String createdAt,
  }) = _ArticleDto;
}
