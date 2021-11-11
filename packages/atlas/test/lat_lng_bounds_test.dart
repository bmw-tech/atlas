import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('LatLngBounds', () {
    test('should throw AssertionError if northeast is null', () {
      try {
        LatLngBounds(
          northeast: null,
          southwest: LatLng(latitude: 0, longitude: 0),
        );
        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should throw AssertionError if southwest is null', () {
      try {
        LatLngBounds(
          northeast: LatLng(latitude: 0, longitude: 0),
          southwest: null,
        );
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

      final latLngBounds = LatLngBounds(
        northeast: expectedPosition,
        southwest: expectedPosition,
      );

      expect(latLngBounds.northeast, expectedPosition);
      expect(latLngBounds.southwest, expectedPosition);
    });

    test('should override == properly', () {
      final latLngBounds1 = LatLngBounds(
        northeast: LatLng(latitude: 0, longitude: 0),
        southwest: LatLng(latitude: 1, longitude: 1),
      );

      final latLngBounds2 = LatLngBounds(
        northeast: LatLng(latitude: 0, longitude: 0),
        southwest: LatLng(latitude: 1, longitude: 1),
      );

      expect(latLngBounds1, latLngBounds2);
    });

    test('should override hashCode properly', () {
      final latLngBounds = LatLngBounds(
        northeast: LatLng(latitude: 0, longitude: 0),
        southwest: LatLng(latitude: 1, longitude: 1),
      );

      expect(latLngBounds.hashCode,
          latLngBounds.northeast.hashCode ^ latLngBounds.southwest.hashCode);
    });
  });
}
