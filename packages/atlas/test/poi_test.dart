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

    test('should have correct properties when provided', () {
      final latLng = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedPoi = Poi(
        id: "poi-1",
        name: "Poi 1",
        latLng: latLng,
      );

      expect(expectedPoi.id, "poi-1");
      expect(expectedPoi.name, "Poi 1");
      expect(expectedPoi.latLng, latLng);
    });

    test('should override == properly', () {
      final poi1 = Poi(
        id: "poi-1",
        name: "Poi 1",
        latLng: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
      );

      final poi2 = Poi(
        id: "poi-1",
        name: "Poi 1",
        latLng: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
      );

      expect(poi1, poi2);
    });

    test('should override hashCode properly', () {
      final poi = Poi(
        id: "poi-1",
        name: "Poi 1",
        latLng: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
      );

      expect(poi.hashCode,
          poi.id.hashCode ^ poi.name.hashCode ^ poi.latLng.hashCode);
    });
  });
}
