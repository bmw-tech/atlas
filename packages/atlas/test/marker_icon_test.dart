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

    test('should override == properly', () {
      expect(
        MarkerIcon(
          assetName: 'my-asset',
        ),
        MarkerIcon(
          assetName: 'my-asset',
        ),
      );
    });

    test('should override hashCode properly', () {
      final markerIcon = MarkerIcon(
        assetName: 'my-asset',
      );
      expect(
        markerIcon.hashCode,
        markerIcon.runtimeType.hashCode ^ markerIcon.assetName.hashCode,
      );
    });
  });
}
