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
        return GridView.builder(
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
            return _ArticleWidget(articleEntity: item);
          },
        );
      },
    );
  }
}

class _ArticleWidget extends StatefulWidget {
  final ArticleEntity articleEntity;

  const _ArticleWidget({required this.articleEntity});

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
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final colorsScheme = context.colorsTheme;

    return MouseRegion(
      onHover: (_) => _handleHover(hover: true),
      onExit: (_) => _handleHover(hover: false),
      child: GestureDetector(
        onTap: () => _navigateToArticlePage(_articleEntity),
        child: Hero(
          tag: ArticlePageConstants.mainArticlePicture,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            transform: Matrix4.translationValues(0, isHovered ? -8 : 0, 0),
            height: 500,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(_articleEntity.imagePath), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _articleEntity.title,
                  style: textTheme.bold24.copyWith(color: colorsScheme.onPrimary),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 24),
                Text(
                  _formatArticleCreationDate(_articleEntity.createdAt, l10n),
                  style: textTheme.bold16.copyWith(color: colorsScheme.onPrimary),
                ),
                const Spacer(),
                Text(
                  _articleEntity.topic,
                  style: textTheme.bold16.copyWith(color: colorsScheme.onPrimary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToArticlePage(ArticleEntity articleEntity) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ArticlePage(articleEntity: articleEntity),
      ),
    );
  }

  void _handleHover({required bool hover}) {
    setState(() {
      isHovered = hover;
    });
  }

  String _formatArticleCreationDate(DateTime articleDate, AppLocalizations l10n) {
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
