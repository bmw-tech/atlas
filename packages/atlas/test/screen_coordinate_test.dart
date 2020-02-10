import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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

    test('different instances with same properties should be equal', () {
      final screenCoord1 = ScreenCoordinates(x: 1, y: 2);
      final screenCoord2 = ScreenCoordinates(x: 1, y: 2);

      expect(screenCoord1, screenCoord2);
    });

    test('different instances with different properties should NOT be equal',
        () {
      final screenCoord1 = ScreenCoordinates(x: 1, y: 2);
      final screenCoord2 = ScreenCoordinates(x: 1, y: 3);

      expect(screenCoord1, isNot(equals(screenCoord2)));
    });

    test('should override hashCode', () {
      final screenCoord = ScreenCoordinates(x: 1, y: 2);
      expect(1.hashCode, screenCoord.x.hashCode);
      expect(2.hashCode, screenCoord.y.hashCode);
    });
  });
}
