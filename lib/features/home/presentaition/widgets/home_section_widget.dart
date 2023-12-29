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
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform(
            transform: Matrix4.translationValues(_parallaxOffsetX, _parallaxOffsetY, 0),
            child: Image.network(
              'https://i0.wp.com/www.pixcores.com/wp-content/uploads/2023/03/image-9.webp?w=1214&ssl=1',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Center(
            child: Container(
              // width: 200.0,
              height: 200.0,
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
