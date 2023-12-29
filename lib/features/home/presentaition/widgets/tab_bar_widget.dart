part of 'package:blog/features/home/presentaition/home_page.dart';

/// Tab bar.
///
/// Manages app navigation.
class TabBarWidget extends StatelessWidget {
  /// @nodoc
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final colorsTheme = context.colorTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              l10n.homeTitle,
              style: textTheme.bold24.copyWith(color: colorsTheme.onBackground),
            ),
          ),
          const SizedBox(width: 16),
          Row(
            children: [
              _TabItem(
                onTap: () {},
                title: l10n.homeTabTitle,
              ),
              const SizedBox(width: 16),
              _TabItem(
                onTap: () {},
                title: l10n.aboutTabTitle,
              ),
              const SizedBox(width: 16),
              _TabItem(
                onTap: () {},
                title: l10n.contentTabTitle,
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () => _showSettingsDialog(context, l10n, textTheme, colorsTheme),
                icon: Icon(
                  Icons.settings,
                  color: colorsTheme.inactive,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSettingsDialog(
    BuildContext context,
    AppLocalizations l10n,
    AppTextTheme textTheme,
    AppColorsTheme colorsTheme,
  ) {
    int selectedLanguageRadio = LocaleCode.values.map((l) => l.name).toList().indexOf(l10n.localeName);
    // int selectedThemeRadio = ThemeMode.values.indexOf();
    int selectedThemeRadio = 0;

    showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            l10n.settingsTitle,
            style: textTheme.bold22,
            textAlign: TextAlign.center,
          ),
          content: StatefulBuilder(
            builder: (_, setState) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(l10n.settingsAppearanceTitle, style: textTheme.bold16),
                  Text(
                    l10n.settingsAppearanceSubtitle,
                    style: textTheme.regular11.copyWith(color: colorsTheme.inactive),
                  ),
                  Column(
                    children: List.generate(ThemeMode.values.length, (index) {
                      final themeMode = ThemeMode.values[index];

                      return RadioListTile<int>(
                        value: index,
                        groupValue: selectedThemeRadio,
                        onChanged: (value) {
                          if (value != null) setState(() => selectedThemeRadio = value);
                        },
                        title: Text(themeMode.getTitle(l10n), style: textTheme.regular14),
                      );
                    }),
                  ),
                  const SizedBox(height: 16),
                  Text(l10n.settingsLanguageTitle, style: textTheme.bold16),
                  Column(
                    children: List<Widget>.generate(LocaleCode.values.length, (index) {
                      final localeCode = LocaleCode.values[index];

                      return RadioListTile<int>(
                        value: index,
                        groupValue: selectedLanguageRadio,
                        onChanged: (value) {
                          if (value != null) setState(() => selectedLanguageRadio = value);
                        },
                        title: Text(localeCode.getTitle(l10n), style: textTheme.regular14),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TabItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _TabItem({required this.title, required this.onTap});

  @override
  State<_TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<_TabItem> with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(
      begin: 0,
      end: 32,
    ).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorTheme = context.colorTheme;
    final tabStyle = textTheme.bold14.copyWith(color: colorTheme.onBackground);

    return Stack(
      children: [
        Container(
          height: animation.value,
          width: 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorTheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        MouseRegion(
          onHover: (_) {
            animationController.forward();
          },
          onExit: (_) {
            animationController.reverse();
          },
          child: TextButton(
            onPressed: widget.onTap,
            child: Text(widget.title, style: tabStyle),
          ),
        ),
      ],
    );
  }
}
