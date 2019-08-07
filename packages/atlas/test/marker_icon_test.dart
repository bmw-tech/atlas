import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';

main() {
  group('Marker Icon', () {
    test('should throw assertion error if assetName is null', () {
      try {
        MarkerIcon(
          assetName: null,
        );
        fail('should throw assertion error');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });
  });
}
