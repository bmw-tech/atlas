import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';

main() {
  group('Map Icon', () {
    test('should throw assertion error if assetName is null', () {
      try {
        MarkerIcon(
          assetName: null,
          devicePixelRatio: 1,
        );
        fail('should throw assertion error');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should throw assertion error if devicePixelRatio is null', () {
      try {
        MarkerIcon(
          assetName: '',
          devicePixelRatio: null,
        );
        fail('should throw assertion error');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });
  });
}
