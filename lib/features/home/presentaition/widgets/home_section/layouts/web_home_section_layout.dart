import 'package:blog/core/assets/res/resources.dart';
import 'package:blog/core/common/extensions/build_context_extension.dart';
import 'package:blog/core/utils/sized_box.dart';
import 'package:flutter/material.dart';

/// Web layout for home section.
class WebHomeSectionLayout extends StatelessWidget {
  /// @nodoc.
  final double parallaxOffsetX;

  /// @nodoc.
  final double parallaxOffsetY;

  /// @nodoc.
  const WebHomeSectionLayout({
    required this.parallaxOffsetX,
    required this.parallaxOffsetY,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorsTheme = context.colorsTheme;
    final textTheme = context.textTheme;

    return SizedBox(
      height: 500,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform(
            transform: Matrix4.translationValues(
              parallaxOffsetX,
              parallaxOffsetY,
              0,
            ),
            child: Image.asset(
              AppImages.imgHomeBackground,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 164),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: colorsTheme.inactive.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.homeSectionGreating,
                        style: textTheme.bold22.copyWith(color: colorsTheme.accent),
                      ),
                      16.h,
                      Text(l10n.homeSectionName, style: textTheme.bold24),
                      8.h,
                      Text(l10n.homeSectionSurname, style: textTheme.bold24),
                      16.h,
                      Text(
                        l10n.homeSectionSelfDescription,
                        style: textTheme.bold14.copyWith(color: colorsTheme.inactive),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Image.asset(AppImages.imgAvatar),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
