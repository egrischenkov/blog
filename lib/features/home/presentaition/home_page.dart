import 'package:blog/core/common/widgets/footer_widget.dart';
import 'package:blog/core/utils/intersperse.dart';
import 'package:blog/core/utils/sized_box.dart';
import 'package:blog/features/articles/presentation/article_page.dart';
import 'package:blog/features/home/presentaition/widgets/articles_error_widget.dart';
import 'package:blog/features/home/presentaition/widgets/home_section/layouts/tablet_and_mobile_home_section_layout.dart';
import 'package:blog/features/home/presentaition/widgets/home_section/layouts/web_home_section_layout.dart';
import 'package:blog/features/home/presentaition/widgets/tab_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:blog/core/common/extensions/build_context_extension.dart';
import 'package:blog/core/common/services/locale_service.dart/locale_code.dart';
import 'package:blog/core/common/services/theme_service/theme_mode_extension.dart';
import 'package:blog/features/home/domain/entities/article_entity.dart';
import 'package:blog/features/home/presentaition/bloc/home_cubit.dart';
import 'package:blog/features/home/presentaition/di/create_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shimmer/shimmer.dart';

part 'package:blog/features/home/presentaition/widgets/tab_bar_widget.dart';
part 'package:blog/features/home/presentaition/widgets/home_section/home_section_widget.dart';
part 'package:blog/features/home/presentaition/widgets/about_section_widget.dart';
part 'package:blog/features/home/presentaition/widgets/articles_section_widget.dart';

/// Typedef for parallax offset.
typedef ParallaxOffset = (double, double);

/// Key for [HomeSectionWidget].
final _homeKey = GlobalKey();

/// Key for [ArticlesSectionWidget].
final _contentKey = GlobalKey();

/// Key for [AboutSectionWidget].
final _aboutKey = GlobalKey();

/// Home page.
///
/// Contains all the blog's content and navigation bar.
class HomePage extends StatelessWidget {
  /// @nodoc
  HomePage({super.key});

  final ValueNotifier<ParallaxOffset> _parallaxOffset = ValueNotifier((0.0, 0.0));

  @override
  Widget build(BuildContext context) {
    final colorsTheme = context.colorsTheme;
    final l10n = context.l10n;
    final size = MediaQuery.of(context).size;
    final largerThanMobile = ResponsiveBreakpoints.of(context).largerThan(MOBILE);

    return BlocProvider(
      create: createHomeCubit,
      child: Scaffold(
        backgroundColor: colorsTheme.secondary,
        drawer: largerThanMobile
            ? null
            : Drawer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 64,
                        child: DrawerHeader(
                          padding: const EdgeInsets.all(16),
                          child: Text(l10n.homeMenu),
                        ),
                      ),
                      ...intersperse(
                        8.h,
                        [
                          TabItem(
                            title: l10n.homeTabTitle,
                            onTap: () {
                              _scrollToItem(ItemToScroll.home);
                              Navigator.pop(context);
                            },
                          ),
                          TabItem(
                            title: l10n.contentTabTitle,
                            onTap: () {
                              _scrollToItem(ItemToScroll.content);
                              Navigator.pop(context);
                            },
                          ),
                          TabItem(
                            title: l10n.aboutTabTitle,
                            onTap: () {
                              _scrollToItem(ItemToScroll.about);
                              Navigator.pop(context);
                            },
                          ),
                          Builder(
                            builder: (innerContext) {
                              return IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _showSettingsDialog(innerContext);
                                },
                                icon: Icon(
                                  Icons.settings,
                                  color: colorsTheme.inactive,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        appBar: largerThanMobile
            ? null
            : AppBar(
                backgroundColor: colorsTheme.background,
                title: Text(l10n.homeTitle),
                leading: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
              ),
        body: MaxWidthBox(
          maxWidth: 1500,
          child: MouseRegion(
            onHover: (event) {
              _parallaxOffset.value = _calculateParallaxOffset(
                size.width,
                event.localPosition.dx,
                event.localPosition.dy,
              );
            },
            child: CustomScrollView(
              slivers: [
                if (largerThanMobile)
                  SliverAppBar(
                    forceElevated: true,
                    floating: true,
                    backgroundColor: colorsTheme.background,
                    elevation: 5,
                    // expandedHeight: ResponsiveBreakpoints.of(context).isTablet ? 300 : 150,
                    expandedHeight: 150,
                    flexibleSpace: FlexibleSpaceBar(
                      title: TabBarWidget(
                        scrollToItem: _scrollToItem,
                        showSettingsDialog: _showSettingsDialog,
                      ),
                    ),
                  ),
                SliverToBoxAdapter(
                  key: _homeKey,
                  child: ValueListenableBuilder<ParallaxOffset>(
                    valueListenable: _parallaxOffset,
                    builder: (_, offset, __) {
                      return HomeSectionWidget(
                        parallaxOffsetX: offset.$1,
                        parallaxOffsetY: offset.$2,
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(key: _contentKey, child: const ArticlesSectionWidget()),
                SliverToBoxAdapter(key: _aboutKey, child: const AboutSectionWidget()),
                const SliverToBoxAdapter(child: FooterWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _scrollToItem(ItemToScroll item) {
    final currentContext = switch (item) {
      ItemToScroll.home => _homeKey.currentContext,
      ItemToScroll.content => _contentKey.currentContext,
      ItemToScroll.about => _aboutKey.currentContext,
    };

    if (currentContext == null) return;
    Scrollable.ensureVisible(
      currentContext,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _showSettingsDialog(
    BuildContext context,
  ) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final colorsTheme = context.colorsTheme;
    final cubit = context.read<HomeCubit>();
    int selectedLanguageRadio = LocaleCode.values.map((l) => l.name).toList().indexOf(l10n.localeName);
    int selectedThemeRadio = ThemeMode.values.indexOf(cubit.currentThemeMode);

    showDialog<void>(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            final l10n = context.l10n;
            return AlertDialog(
              title: Text(
                l10n.settingsTitle,
                style: textTheme.bold22,
                textAlign: TextAlign.center,
              ),
              content: Container(
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
                            cubit.changeTheme(themeMode);
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
                            cubit.changeLocale(localeCode.name);
                          },
                          title: Text(localeCode.getTitle(l10n), style: textTheme.regular14),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  ParallaxOffset _calculateParallaxOffset(
    double width,
    double localPositionX,
    double localPositionY,
  ) {
    return (
      (localPositionX - width / 2) / 80.0,
      -localPositionY / 80.0,
    );
  }
}
