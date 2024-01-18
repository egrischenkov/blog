import 'package:blog/features/home/domain/entities/article_entity.dart';

/// Home repository.
abstract interface class IHomeRepository {
  /// Gets list of [ArticleEntity].
  Future<List<ArticleEntity>> getArticles(String localeCode);
}
