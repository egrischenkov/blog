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
    final l10n = context.l10n;
    final colorsTheme = context.colorsTheme;
    final textTheme = context.textTheme;

    return SizedBox(
      height: 500,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform(
            transform: Matrix4.translationValues(_parallaxOffsetX, _parallaxOffsetY, 0),
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
                      const SizedBox(height: 16),
                      Text(l10n.homeSectionName, style: textTheme.bold24),
                      const SizedBox(height: 8),
                      Text(l10n.homeSectionSurname, style: textTheme.bold24),
                      const SizedBox(height: 16),
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
