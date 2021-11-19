import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('LatLng', () {
    test('should compute normalized latitude when latitude is < -90', () {
      final pair = LatLng(latitude: -100, longitude: 0.0);
      expect(pair.latitude, -90);
    });

    test('should compute normalized latitude when latitude is > 90', () {
      final pair = LatLng(latitude: 100, longitude: 0.0);
      expect(pair.latitude, 90);
    });

    test(
        'should compute normalized latitude when latitude is between -90 and 90',
        () {
      final pair = LatLng(latitude: 0.0, longitude: 0.0);
      expect(pair.latitude, 0.0);
    });

    test('should compute normalized longitude when longitude is < -180', () {
      final pair = LatLng(latitude: 0.0, longitude: -190.0);
      expect(pair.longitude, 170.0);
    });

    test('should compute normalized longitude when longitude is < -180', () {
      final pair = LatLng(latitude: 0.0, longitude: -190.0);
      expect(pair.longitude, 170.0);
    });

    test('should compute normalized longitude when longitude is > 180', () {
      final pair = LatLng(latitude: 0.0, longitude: 190.0);
      expect(pair.longitude, -170.0);
    });

    test(
        'should compute normalized longitude when longitude is between -180 and 180',
        () {
      final pair = LatLng(latitude: 0.0, longitude: 0.0);
      expect(pair.longitude, 0.0);
    });
  });
}
