import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';

main() {
  group('BoundingBoxData', () {
    test(
      'should throw AssertionError if bounds is null',
      () {
        try {
          BoundingBoxData(
            bounds: null,
          );
          fail('should throw AssertionError');
        } catch (error) {
          expect(error, isAssertionError);
        }
      },
    );
    test('should have correct properties when provided', () {
      final expectedBounds = LatLngBounds(
        northeast: LatLng(latitude: 1.0, longitude: 1.0),
        southwest: LatLng(latitude: 2.0, longitude: 2.0),
      );
      final expectedRectangle2D = Rectangle2D(
        originX: 1.0,
        originY: 1.0,
        height: 1.0,
        width: 1.0,
      );
      final Padding expectedPadding = Padding(defaultPadding: 1.0);
      final boundingBoxData = BoundingBoxData(
        bounds: expectedBounds,
        rectangle2d: expectedRectangle2D,
        padding: expectedPadding,
      );
      expect(boundingBoxData.bounds, expectedBounds);
      expect(boundingBoxData.rectangle2d, expectedRectangle2D);
      expect(boundingBoxData.padding, expectedPadding);
    });
    test('should override == properly', () {
      final expectedBounds = LatLngBounds(
        northeast: LatLng(latitude: 1.0, longitude: 1.0),
        southwest: LatLng(latitude: 2.0, longitude: 2.0),
      );
      final expectedRectangle2D = Rectangle2D(
        originX: 1.0,
        originY: 1.0,
        height: 1.0,
        width: 1.0,
      );
      final Padding expectedPadding = Padding(defaultPadding: 1.0);

      expect(
          BoundingBoxData(
            bounds: expectedBounds,
            rectangle2d: expectedRectangle2D,
            padding: expectedPadding,
          ),
          BoundingBoxData(
            bounds: expectedBounds,
            rectangle2d: expectedRectangle2D,
            padding: expectedPadding,
          ));
    });

    test('should override hashCode properly', () {
      final expectedBounds = LatLngBounds(
        northeast: LatLng(latitude: 1.0, longitude: 1.0),
        southwest: LatLng(latitude: 2.0, longitude: 2.0),
      );
      final expectedRectangle2D = Rectangle2D(
        originX: 1.0,
        originY: 1.0,
        height: 1.0,
        width: 1.0,
      );
      final Padding expectedPadding = Padding(defaultPadding: 1.0);
      final boundingBoxData = BoundingBoxData(
        bounds: expectedBounds,
        rectangle2d: expectedRectangle2D,
        padding: expectedPadding,
      );
      expect(
          boundingBoxData.hashCode,
          boundingBoxData.bounds.hashCode ^
              boundingBoxData.rectangle2d.hashCode ^
              boundingBoxData.padding.hashCode);
    });
  });
}
