import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Poi', () {
    test('should throw AssertionError if latLng is null', () {
      try {
        Poi(
          latLng: null,
        );
        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });
  });
}
