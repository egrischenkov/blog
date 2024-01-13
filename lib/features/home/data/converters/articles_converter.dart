import 'package:blog/core/common/interfaces/dto_converter.dart';
import 'package:blog/features/home/data/dto/article_dto.dart';
import 'package:blog/features/home/domain/entities/article_entity.dart';

/// Converts [ArticleDto] to [ArticleEntity]
final class ArticlesConverter extends DtoConverter<ArticleEntity, ArticleDto> {
  @override
  ArticleEntity convert(ArticleDto dto) {
    final createdAt = DateTime.parse(dto.createdAt);

    return ArticleEntity(
      title: dto.title,
      topic: dto.topic,
      createdAt: createdAt,
      articleInMarkdown: dto.articleInMarkdown,
      imagePath: dto.imagePath,
    );
  }
}
