import 'package:blog/core/common/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

/// Widget that offers to reload page.
class ArticlesErrorWidget extends StatelessWidget {
  /// @nodoc
  final VoidCallback onUpdate;

  /// @nodoc
  const ArticlesErrorWidget({required this.onUpdate, super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorsTheme = context.colorsTheme;
    final textTheme = context.textTheme;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorsTheme.inactive.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(l10n.somethingWentWrong),
            const SizedBox(height: 16),
            TextButton(
              onPressed: onUpdate,
              child: Text(
                l10n.contentSectionReloadArticles,
                style: textTheme.bold14.copyWith(color: colorsTheme.accent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
