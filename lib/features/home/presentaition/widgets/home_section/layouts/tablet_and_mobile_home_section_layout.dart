import 'package:blog/core/assets/res/resources.dart';
import 'package:blog/core/common/extensions/build_context_extension.dart';
import 'package:blog/core/utils/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Layout for Tablet and mobile.
class TabletAndMobileHomesSectionLayout extends StatelessWidget {
  /// @nodoc.
  final double parallaxOffsetX;

  /// @nodoc.
  final double parallaxOffsetY;

  /// @nodoc
  const TabletAndMobileHomesSectionLayout({
    required this.parallaxOffsetX,
    required this.parallaxOffsetY,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorsTheme = context.colorsTheme;
    final textTheme = context.textTheme;

    return ResponsiveRowColumn(
      layout: ResponsiveBreakpoints.of(context).isMobile ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      columnMainAxisSize: MainAxisSize.min,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      rowMainAxisAlignment: MainAxisAlignment.center,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 2,
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
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: ResponsiveBreakpoints.of(context).isTablet ? 600 : double.infinity,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: colorsTheme.inactive.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
              ),
            ],
          ),
        ),
        // Avatar image
        ResponsiveRowColumnItem(
          rowFlex: 1,
          columnOrder: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Image.asset(
              AppImages.imgAvatar,
              width: ResponsiveValue<double>(
                context,
                defaultValue: 200.0,
                conditionalValues: [
                  const Condition.smallerThan(name: TABLET, value: 150.0),
                  const Condition.equals(name: TABLET, value: 300.0),
                ],
              ).value,
            ),
          ),
        ),
      ],
    );
  }
}
