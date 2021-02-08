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
      );
      expect(deviceLocation.target.latitude, 1.0);
      expect(deviceLocation.target.longitude, 1.0);
      expect(deviceLocation.accuracy, 1.0);
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
  });
}
