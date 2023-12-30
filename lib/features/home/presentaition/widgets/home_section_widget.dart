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
          Center(
            child: Container(
              color: Colors.transparent,
              child: const Center(
                child: Text(
                  'Test',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
