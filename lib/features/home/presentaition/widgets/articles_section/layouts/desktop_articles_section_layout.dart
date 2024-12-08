import 'package:blog/core/common/extensions/build_context_extension.dart';
import 'package:blog/features/home/domain/entities/article_entity.dart';
import 'package:flutter/material.dart';

/// Desktop layout for articles section.
class DesktopArticlesSectionLayout extends StatelessWidget {
  /// @nodoc.
  final ArticleEntity article;

  /// @nodoc.
  final void Function(bool isHover) handleHover;

  /// @nodoc.
  final void Function(ArticleEntity article) navigateToArticlePage;

  /// @nodoc.
  final String Function(DateTime creationData) formatCreationDate;

  /// @nodoc.
  final bool isHovered;

  /// @nodoc.
  const DesktopArticlesSectionLayout({
    required this.article,
    required this.isHovered,
    required this.handleHover,
    required this.navigateToArticlePage,
    required this.formatCreationDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorsTheme = context.colorsTheme;

    return MouseRegion(
      onHover: (_) => handleHover(true),
      onExit: (_) => handleHover(false),
      child: GestureDetector(
        onTap: () => navigateToArticlePage(article),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          transform: Matrix4.translationValues(0, isHovered ? -8 : 0, 0),
          height: 500,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(article.imagePath), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style: textTheme.bold24.copyWith(color: colorsTheme.onPrimary),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 24),
              Text(
                formatCreationDate(article.createdAt),
                style: textTheme.bold16.copyWith(color: colorsTheme.onPrimary),
              ),
              const Spacer(),
              Text(
                article.topic,
                style: textTheme.bold16.copyWith(color: colorsTheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
