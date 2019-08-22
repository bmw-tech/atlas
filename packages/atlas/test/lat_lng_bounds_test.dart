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
  });
}
