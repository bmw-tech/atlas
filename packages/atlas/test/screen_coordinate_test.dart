import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('ScreenCoordinate', () {
    test('should thow AssertionError if x is null', () {
      try {
        ScreenCoordinates(
          x: null,
          y: 1,
        );
        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should throw AssertionError if y is null', () {
      try {
        ScreenCoordinates(
          x: 1,
          y: null,
        );
        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });
  });
}
