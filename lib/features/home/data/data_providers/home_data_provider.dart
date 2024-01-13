import 'dart:convert';

import 'package:blog/features/home/data/dto/article_dto.dart';
import 'package:flutter/services.dart';

const _contentJsonPath = 'assets/content.json';

/// @nodoc
class HomeDataProvider implements IHomeDataProvider {
  @override
  Future<List<ArticleDto>> getArticleDtos() async {
    final contentJsonString = await rootBundle.loadString(_contentJsonPath);
    final contentJson = json.decode(contentJsonString) as Iterable<Map<String, dynamic>>;

    return List<ArticleDto>.from(
      contentJson.map((articleData) async {
        final articlePath = articleData['articlePath'] as String;
        final article = await rootBundle.loadString(articlePath);

        return ArticleDto(
          title: articleData['title'] as String,
          topic: articleData['topic'] as String,
          articleInMarkdown: article,
          imagePath: articleData['imagePath'] as String,
          createdAt: articleData['createdAt'] as String,
        );
      }),
    );
  }
}

/// Data provider for Home page.
abstract interface class IHomeDataProvider {
  /// Gets list of [ArticleDto].
  Future<List<ArticleDto>> getArticleDtos();
}
