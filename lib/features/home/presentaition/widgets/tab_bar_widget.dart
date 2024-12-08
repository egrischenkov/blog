part of 'package:blog/features/home/presentaition/home_page.dart';

/// Tab bar.
///
/// Manages app navigation.d
class TabBarWidget extends StatelessWidget {
  /// @nodoc.
  final void Function(ItemToScroll item) scrollToItem;

  /// @nodoc.
  final void Function(BuildContext context) showSettingsDialog;

  /// @nodoc
  const TabBarWidget({
    required this.scrollToItem,
    required this.showSettingsDialog,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final colorsTheme = context.colorsTheme;

    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ResponsiveRowColumn(
        layout: isTablet ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        columnMainAxisSize: MainAxisSize.min,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ResponsiveRowColumnItem(
            rowFit: FlexFit.tight,
            child: Padding(
              padding: isTablet ? const EdgeInsets.only(left: 8) : EdgeInsets.zero,
              child: Text(
                l10n.homeTitle,
                style: textTheme.bold24.copyWith(color: colorsTheme.onBackground),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          if (!isTablet) const ResponsiveRowColumnItem(child: SizedBox(width: 16)),
          ResponsiveRowColumnItem(
            child: Row(
              children: [
                TabItem(
                  onTap: () => scrollToItem(ItemToScroll.home),
                  title: l10n.homeTabTitle,
                ),
                const SizedBox(width: 16),
                TabItem(
                  onTap: () => scrollToItem(ItemToScroll.content),
                  title: l10n.contentTabTitle,
                ),
                const SizedBox(width: 16),
                TabItem(
                  onTap: () => scrollToItem(ItemToScroll.about),
                  title: l10n.aboutTabTitle,
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () => showSettingsDialog(context),
                  icon: Icon(
                    Icons.settings,
                    color: colorsTheme.inactive,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Represents item we need to scroll to.
enum ItemToScroll {
  /// @nodoc
  home,

  /// @nodoc
  content,

  /// @nodoc
  about,
}
