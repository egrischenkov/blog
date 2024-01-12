import 'package:blog/core/common/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

/// Page with article content.
///
/// Shows article's content in Markdown format.
class ArticlePage extends StatelessWidget {
  /// @nodoc
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = context.colorsTheme;

    return Scaffold(
      backgroundColor: colorsTheme.secondary,
    );
  }
}
