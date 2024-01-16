import 'dart:convert';

import 'package:blog/features/home/data/dto/article_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

/// @nodoc
class HomeDataProvider implements IHomeDataProvider {
  final BuildContext _context;
  final String _localeCode;

  /// @nodoc
  const HomeDataProvider(this._context, this._localeCode);

  @override
  Future<List<ArticleDto>> getArticleDtos() async {
    final contentJson = await DefaultAssetBundle.of(_context).loadString(_getContentJsonPath(_localeCode));
    final content = json.decode(contentJson) as List<dynamic>;
    final articles = await Future.wait(
      content.map((articleData) async {
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
    return articles;
  }

  String _getContentJsonPath(String localeCode) {
    return 'assets/content/content_$localeCode.json';
  }
}

/// Data provider for Home page.
abstract interface class IHomeDataProvider {
  /// Gets list of [ArticleDto].
  Future<List<ArticleDto>> getArticleDtos();
}
