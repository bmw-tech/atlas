import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';

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

    test('should have correct target and zoom level when no zoom is provided',
        () {
      final expectedTarget = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedZoom = 0.0;
      final position = CameraPosition(target: expectedTarget);
      expect(position.target, expectedTarget);
      expect(position.zoom, expectedZoom);
    });

    test('should have correct target and zoom level when zoom is provided', () {
      final expectedTarget = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedZoom = 10.0;
      final position = CameraPosition(
        target: expectedTarget,
        zoom: expectedZoom,
      );
      expect(position.target, expectedTarget);
      expect(position.zoom, expectedZoom);
    });
  });
}
