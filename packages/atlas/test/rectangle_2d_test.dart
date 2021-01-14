import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';

main() {
  group('Rectangle2D', () {
    test('should have correct properties when provided', () {
      final double expectedOriginX = 1.0;
      final double expectedOriginY = 1.0;
      final double expectedHeight = 1.0;
      final double expectedWidth = 1.0;
      final rectangle2D = Rectangle2D(
        originX: expectedOriginX,
        originY: expectedOriginY,
        height: expectedHeight,
        width: expectedWidth,
      );
      expect(rectangle2D.originX, expectedOriginX);
      expect(rectangle2D.originY, expectedOriginY);
      expect(rectangle2D.height, expectedHeight);
      expect(rectangle2D.width, expectedWidth);
    });
    test('should override == properly', () {
      final double expectedOriginX = 1.0;
      final double expectedOriginY = 1.0;
      final double expectedHeight = 1.0;
      final double expectedWidth = 1.0;

      expect(
          Rectangle2D(
            originX: expectedOriginX,
            originY: expectedOriginY,
            height: expectedHeight,
            width: expectedWidth,
          ),
          Rectangle2D(
            originX: expectedOriginX,
            originY: expectedOriginY,
            height: expectedHeight,
            width: expectedWidth,
          ));
    });

    test('should override hashCode properly', () {
      final double expectedOriginX = 1.0;
      final double expectedOriginY = 1.0;
      final double expectedHeight = 1.0;
      final double expectedWidth = 1.0;
      final rectangle2D = Rectangle2D(
        originX: expectedOriginX,
        originY: expectedOriginY,
        height: expectedHeight,
        width: expectedWidth,
      );
      expect(
          rectangle2D.hashCode,
          rectangle2D.originX.hashCode ^
              rectangle2D.originY.hashCode ^
              rectangle2D.width.hashCode ^
              rectangle2D.height.hashCode);
    });
  });
}
