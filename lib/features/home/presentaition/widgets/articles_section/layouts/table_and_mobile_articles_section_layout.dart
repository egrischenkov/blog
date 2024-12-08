import 'package:blog/core/common/extensions/build_context_extension.dart';
import 'package:blog/core/utils/sized_box.dart';
import 'package:blog/features/home/domain/entities/article_entity.dart';
import 'package:flutter/material.dart';

/// Table and mobile layout for articles section.
class TableAndMobileArticlesSectionLayout extends StatelessWidget {
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
  const TableAndMobileArticlesSectionLayout({
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: colorsTheme.background,
          ),
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    article.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              16.w,
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: textTheme.bold24.copyWith(color: colorsTheme.onPrimary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    8.h,
                    Text(
                      formatCreationDate(article.createdAt),
                      style: textTheme.bold16.copyWith(
                        color: colorsTheme.onPrimary,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      article.topic,
                      style: textTheme.bold16.copyWith(
                        color: colorsTheme.onPrimary,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
