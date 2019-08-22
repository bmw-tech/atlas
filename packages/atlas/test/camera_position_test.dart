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
  });
}
