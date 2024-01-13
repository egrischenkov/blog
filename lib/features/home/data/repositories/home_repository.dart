import 'package:blog/core/common/interfaces/dto_converter.dart';
import 'package:blog/features/home/data/data_providers/home_data_provider.dart';
import 'package:blog/features/home/data/dto/article_dto.dart';
import 'package:blog/features/home/domain/entities/article_entity.dart';
import 'package:blog/features/home/domain/repositories/i_home_repository.dart';

/// @nodoc
class HomeRepository implements IHomeRepository {
  /// @nodoc
  final IHomeDataProvider _dataProvider;

  final DtoConverter<ArticleEntity, ArticleDto> _articlesConverter;

  /// @nodoc
  HomeRepository({
    required HomeDataProvider dataProvider,
    required DtoConverter<ArticleEntity, ArticleDto> articlesConverter,
  })  : _dataProvider = dataProvider,
        _articlesConverter = articlesConverter;

  @override
  Future<List<ArticleEntity>> getArticles() async {
    final articleDtos = await _dataProvider.getArticleDtos();
    return _articlesConverter.convertMultiple(articleDtos).toList();
  }
}
