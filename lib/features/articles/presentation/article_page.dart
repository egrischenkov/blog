import 'dart:developer';

import 'package:blog/core/common/extensions/build_context_extension.dart';
import 'package:blog/core/common/widgets/footer_widget.dart';
import 'package:blog/features/home/domain/entities/article_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

/// Page with article content.
///
/// Shows article's content in Markdown format.
class ArticlePage extends StatelessWidget {
  /// @nodoc
  final ArticleEntity articleEntity;

  /// @nodoc
  const ArticlePage({
    super.key,
    required this.articleEntity,
  });

  @override
  Widget build(BuildContext context) {
    final colorsTheme = context.colorsTheme;
    final textTheme = context.textTheme;

    return Scaffold(
      backgroundColor: colorsTheme.secondary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            backgroundColor: colorsTheme.background,
            elevation: 5,
            title: Text(articleEntity.title, style: textTheme.bold22),
            centerTitle: false,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 64)),
          SliverToBoxAdapter(
            child: Container(
              height: 400,
              margin: const EdgeInsets.symmetric(horizontal: 128),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(articleEntity.imagePath),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 128),
              child: MarkdownBody(
                selectable: true,
                data: articleEntity.articleInMarkdown,
                onTapLink: (_, url, __) {
                  url != null ? launchUrl(Uri.parse(url)) : log('Url is null');
                },
                styleSheet: MarkdownStyleSheet(
                  textScaler: const TextScaler.linear(1.5),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: FooterWidget()),
        ],
      ),
    );
  }
}
