part of 'package:blog/features/home/presentaition/home_page.dart';

/// Widget with main photo and short self description.
class HomeSectionWidget extends StatelessWidget {
  final double _parallaxOffsetX;
  final double _parallaxOffsetY;

  /// @nodoc
  const HomeSectionWidget({
    required double parallaxOffsetX,
    required double parallaxOffsetY,
    super.key,
  })  : _parallaxOffsetY = parallaxOffsetY,
        _parallaxOffsetX = parallaxOffsetX;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isDesktop
        ? DesktopHomeSectionLayout(
            parallaxOffsetX: _parallaxOffsetX,
            parallaxOffsetY: _parallaxOffsetY,
          )
        : TabletAndMobileHomesSectionLayout(
            parallaxOffsetX: _parallaxOffsetX,
            parallaxOffsetY: _parallaxOffsetY,
          );
  }
}
