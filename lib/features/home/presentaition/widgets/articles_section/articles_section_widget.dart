part of 'package:blog/features/home/presentaition/home_page.dart';

/// Widget with grid of articles.
class ArticlesSectionWidget extends StatelessWidget {
  /// @nodoc
  const ArticlesSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (_, state) {
        if (state.status == HomeStatus.failure) return ArticlesErrorWidget(onUpdate: cubit.updateArticles);

        final loading = state.status == HomeStatus.loading;
        final articles = state.articles;

        final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

        return isDesktop
            ? GridView.builder(
                padding: const EdgeInsets.all(112),
                shrinkWrap: true,
                itemCount: loading ? 6 : articles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 32,
                  crossAxisSpacing: 32,
                ),
                itemBuilder: (_, index) {
                  if (loading) return const _ShimmerArticleWidget();

                  final item = articles[index];
                  return _ArticleWidget(
                    key: ValueKey(item.articleInMarkdown),
                    articleEntity: item,
                  );
                },
              )
            : ListView.separated(
                shrinkWrap: true,
                itemCount: loading ? 6 : articles.length,
                itemBuilder: (_, index) {
                  if (loading) return const _ShimmerArticleWidget();

                  final item = articles[index];
                  return _ArticleWidget(
                    key: ValueKey(item.articleInMarkdown),
                    articleEntity: item,
                  );
                },
                separatorBuilder: (_, __) {
                  return 16.h;
                },
              );
      },
    );
  }
}

class _ArticleWidget extends StatefulWidget {
  final ArticleEntity articleEntity;

  const _ArticleWidget({super.key, required this.articleEntity});

  @override
  State<_ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<_ArticleWidget> {
  late final ArticleEntity _articleEntity;
  late bool isHovered;

  @override
  void initState() {
    super.initState();
    _articleEntity = widget.articleEntity;
    isHovered = false;
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return isDesktop
        ? DesktopArticlesSectionLayout(
            article: _articleEntity,
            isHovered: isHovered,
            formatCreationDate: _formatArticleCreationDate,
            navigateToArticlePage: _navigateToArticlePage,
            handleHover: _handleHover,
          )
        : TableAndMobileArticlesSectionLayout(
            article: _articleEntity,
            isHovered: isHovered,
            formatCreationDate: _formatArticleCreationDate,
            navigateToArticlePage: _navigateToArticlePage,
            handleHover: _handleHover,
          );
  }

  void _navigateToArticlePage(ArticleEntity articleEntity) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ArticlePage(articleEntity: articleEntity),
      ),
    );
  }

  void _handleHover(bool hover) {
    setState(() {
      isHovered = hover;
    });
  }

  String _formatArticleCreationDate(DateTime articleDate) {
    final l10n = context.l10n;
    final currentDate = DateTime.now();

    final difference = currentDate.difference(articleDate);

    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).floor();
      return l10n.contentSectionYearsAgo(years);
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return l10n.contentSectionMonthsAgo(months);
    } else if (difference.inDays >= 1) {
      return l10n.contentSectionDaysAgo(difference.inDays);
    } else if (difference.inHours >= 1) {
      return l10n.contentSectionHoursAgo(difference.inHours);
    } else if (difference.inMinutes >= 1) {
      return l10n.contentSectionMinutesAgo(difference.inMinutes);
    } else {
      return l10n.contentSectionToday;
    }
  }
}

class _ShimmerArticleWidget extends StatelessWidget {
  const _ShimmerArticleWidget();

  @override
  Widget build(BuildContext context) {
    final colorsTheme = context.colorsTheme;

    return Shimmer(
      gradient: colorsTheme.shimmerGradient,
      child: Container(
        height: 500,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: colorsTheme.primary,
        ),
      ),
    );
  }
}
