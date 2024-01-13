part of 'package:blog/features/home/presentaition/home_page.dart';

/// Widget with grid of articles.
class ArticlesSectionWidget extends StatelessWidget {
  /// @nodoc
  const ArticlesSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(112),
      shrinkWrap: true,
      itemCount: mockItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 32,
        crossAxisSpacing: 32,
      ),
      itemBuilder: (_, index) {
        final item = mockItems[index];

        return _ArticleWidget(articleEntity: item);
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
        onTap: () => _navigateToArticlePage(widget.articleEntity),
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

/// @nodoc
final mockItems = [
  ArticleEntity(
    title: 'About something very very interesting',
    topic: 'programming',
    imagePath: AppImages.imgArticlePlaceholder,
    createdAt: DateTime(DateTime.now().year - 1, DateTime.now().month, DateTime.now().day),
    articleInMarkdown: 'assets/articles/null_in_dart.md',
  ),
  ArticleEntity(
    title: 'How to write clean code',
    topic: 'programming',
    imagePath: AppImages.imgArticlePlaceholder,
    createdAt: DateTime(DateTime.now().year, DateTime.now().month - 1, DateTime.now().day),
    articleInMarkdown: 'assets/articles/null_in_dart.md',
  ),
  ArticleEntity(
    title: 'How to write tests',
    topic: 'programming',
    imagePath: AppImages.imgArticlePlaceholder,
    createdAt: DateTime.now(),
    articleInMarkdown: 'assets/articles/null_in_dart.md',
  ),
  ArticleEntity(
    title: 'How to earn much money',
    topic: 'programming',
    imagePath: AppImages.imgArticlePlaceholder,
    createdAt: DateTime.now(),
    articleInMarkdown: 'assets/articles/null_in_dart.md',
  ),
  ArticleEntity(
    title: 'How to earn much money',
    topic: 'programming',
    imagePath: AppImages.imgArticlePlaceholder,
    createdAt: DateTime.now(),
    articleInMarkdown: 'assets/articles/null_in_dart.md',
  ),
  ArticleEntity(
    title: 'How to earn much money',
    topic: 'programming',
    imagePath: AppImages.imgArticlePlaceholder,
    createdAt: DateTime.now(),
    articleInMarkdown: 'assets/articles/null_in_dart.md',
  ),
  ArticleEntity(
    title: 'How to earn much money',
    topic: 'programming',
    imagePath: AppImages.imgArticlePlaceholder,
    createdAt: DateTime.now(),
    articleInMarkdown: 'assets/articles/null_in_dart.md',
  ),
  ArticleEntity(
    title: 'How to earn much money',
    topic: 'programming',
    imagePath: AppImages.imgArticlePlaceholder,
    createdAt: DateTime.now(),
    articleInMarkdown: 'assets/articles/null_in_dart.md',
  ),
  ArticleEntity(
    title: 'How to earn much money',
    topic: 'programming',
    imagePath: AppImages.imgArticlePlaceholder,
    createdAt: DateTime.now(),
    articleInMarkdown: 'assets/articles/null_in_dart.md',
  ),
  ArticleEntity(
    title: 'How to earn much money',
    topic: 'programming',
    imagePath: AppImages.imgArticlePlaceholder,
    createdAt: DateTime.now(),
    articleInMarkdown: 'assets/articles/null_in_dart.md',
  ),
];
