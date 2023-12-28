import 'package:blog/core/common/extensions/build_context_x.dart';
import 'package:blog/features/home/presentaition/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';

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
