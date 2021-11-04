import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('CameraPosition', () {
    test('should throw AssertionError if target is null', () {
      try {
        CameraPosition(target: null);
        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should have correct properties when provided', () {
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final cameraPosition = CameraPosition(
        target: expectedPosition,
        zoom: 10.0,
      );

      expect(cameraPosition.target, expectedPosition);
      expect(cameraPosition.zoom, 10.0);
    });

    test('should override == properly', () {
      final cameraPosition1 = CameraPosition(
        target: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 10.0,
      );
      final cameraPosition2 = CameraPosition(
        target: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 10.0,
      );

      expect(cameraPosition1, cameraPosition2);
    });

    test('should override hashCode properly', () {
      final cameraPosition = CameraPosition(
        target: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 10.0,
      );
      expect(cameraPosition.hashCode,
          cameraPosition.target.hashCode ^ cameraPosition.zoom.hashCode);
    });
  });
}
