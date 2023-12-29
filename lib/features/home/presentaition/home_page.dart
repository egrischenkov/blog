import 'package:blog/core/assets/themes/color_theme/app_colors_theme.dart';
import 'package:blog/core/assets/themes/text_theme/app_text_theme.dart';
import 'package:blog/core/common/extensions/build_context_extension.dart';
import 'package:blog/core/common/services/locale_service.dart/locale_code.dart';
import 'package:blog/core/common/services/theme_service/theme_mode_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
part 'package:blog/features/home/presentaition/widgets/tab_bar_widget.dart';

/// Home page.
///
/// Contains all the blog's content and navigation bar.
class HomePage extends StatelessWidget {
  /// @nodoc
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;

    return Scaffold(
      backgroundColor: colorTheme.secondary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: colorTheme.background,
            elevation: 12,
            expandedHeight: 150,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: TabBarWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
