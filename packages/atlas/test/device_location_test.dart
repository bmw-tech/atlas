import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('DeviceLocation', () {
    test('should throw AssertionError if target is null', () {
      try {
        DeviceLocation(target: null);
        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should have correct properties when provided', () {
      final deviceLocation = DeviceLocation(
        target: LatLng(
          latitude: 1.0,
          longitude: 1.0,
        ),
        accuracy: 1.0,
        altitude: 1.0,
      );
      expect(deviceLocation.target?.latitude, 1.0);
      expect(deviceLocation.target?.longitude, 1.0);
      expect(deviceLocation.accuracy, 1.0);
      expect(deviceLocation.altitude, 1.0);
    });

    test('accuracy should be zero when not provided', () {
      final deviceLocation = DeviceLocation(
        target: LatLng(
          latitude: 1.0,
          longitude: 1.0,
        ),
      );
      expect(deviceLocation.accuracy, 0.0);
    });

    test('accuracy should be null when passing null', () {
      final deviceLocation = DeviceLocation(
        target: LatLng(
          latitude: 1.0,
          longitude: 1.0,
        ),
        accuracy: null,
      );
      expect(deviceLocation.accuracy, null);
    });

    test('different instances with same properties should be equal', () {
      final deviceLocationA = DeviceLocation(
        target: LatLng(
          latitude: 1.0,
          longitude: 1.0,
        ),
        accuracy: 1.0,
        altitude: 1.0,
      );

      final deviceLocationB = DeviceLocation(
        target: LatLng(
          latitude: 1.0,
          longitude: 1.0,
        ),
        accuracy: 1.0,
        altitude: 1.0,
      );

      expect(deviceLocationA, deviceLocationB);
    });

    test('should override hashCode properly', () {
      final double latitude = 1.0;
      final double longitude = 1.0;
      final double accuracy = 1.0;
      final double altitude = 1.0;

      final deviceLocation = DeviceLocation(
        target: LatLng(
          latitude: latitude,
          longitude: longitude,
        ),
        accuracy: accuracy,
        altitude: altitude,
      );
      expect(
          deviceLocation.hashCode,
          deviceLocation.target.hashCode ^
              deviceLocation.accuracy.hashCode ^
              deviceLocation.altitude.hashCode);
    });
  });
}
