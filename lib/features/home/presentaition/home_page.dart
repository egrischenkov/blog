import 'package:blog/core/assets/res/resources.dart';
import 'package:blog/core/common/widgets/footer_widget.dart';
import 'package:blog/features/articles/presentation/article_page.dart';
import 'package:blog/features/articles/presentation/article_page_constants.dart';
import 'package:blog/features/home/presentaition/widgets/articles_error_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:blog/core/assets/themes/color_theme/app_colors_theme.dart';
import 'package:blog/core/assets/themes/text_theme/app_text_theme.dart';
import 'package:blog/core/common/extensions/build_context_extension.dart';
import 'package:blog/core/common/services/locale_service.dart/locale_code.dart';
import 'package:blog/core/common/services/theme_service/theme_mode_extension.dart';
import 'package:blog/features/home/domain/entities/article_entity.dart';
import 'package:blog/features/home/presentaition/bloc/home_cubit.dart';
import 'package:blog/features/home/presentaition/di/create_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

part 'package:blog/features/home/presentaition/widgets/tab_bar_widget.dart';
part 'package:blog/features/home/presentaition/widgets/home_section_widget.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorsTheme.secondary,
      body: BlocProvider(
        create: createHomeCubit,
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
              SliverAppBar(
                forceElevated: true,
                floating: true,
                backgroundColor: colorsTheme.background,
                elevation: 5,
                expandedHeight: 150,
                flexibleSpace: FlexibleSpaceBar(
                  title: TabBarWidget(
                    homeKey: _homeKey,
                    contentKey: _contentKey,
                    aboutKey: _aboutKey,
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
