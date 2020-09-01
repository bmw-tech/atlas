import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;
import 'package:google_atlas/src/utils/utils.dart';

main() {
  group('LatLngUtils', () {
    group('toGoogleLatLngBounds', () {
      test('returns correct bounds', () {
        final LatLngBounds bounds = LatLngBounds(
          northeast: LatLng(latitude: 1, longitude: 1),
          southwest: LatLng(latitude: 0, longitude: 3),
        );
        final result = LatLngUtils.toGoogleLatLngBounds(bounds);
        expect(result.northeast.latitude, 1);
        expect(result.northeast.longitude, 1);
        expect(result.southwest.latitude, 0);
        expect(result.southwest.longitude, 3);
      });
    });

    group('toGoogleLatLng', () {
      test('returns correct LatLng', () {
        final result = LatLngUtils.toGoogleLatLng(
          LatLng(latitude: 10.1, longitude: -80.0),
        );
        expect(result.latitude, 10.1);
        expect(result.longitude, -80.0);
      });
    });

    group('fromGoogleLatLng', () {
      test('returns correct LatLng', () {
        final result = LatLngUtils.fromGoogleLatLng(
          GoogleMaps.LatLng(10.1, -80.0),
        );
        expect(result.latitude, 10.1);
        expect(result.longitude, -80.0);
      });
    });

    group('toGoogleScreenCoordinate', () {
      test('returns correct Google Screen Coordinate', () {
        final result = LatLngUtils.toGoogleScreenCoordinate(ScreenCoordinates(
          x: 1,
          y: 2,
        ));
        expect(result.x, 1);
        expect(result.y, 2);
      });
    });

    group('fromGoogleScreenCoordinate', () {
      test('returns correct Atlas Screen Coordinates', () {
        final result =
            LatLngUtils.fromGoogleScreenCoordinate(GoogleMaps.ScreenCoordinate(
          x: 1,
          y: 2,
        ));
        expect(result.x, 1);
        expect(result.y, 2);
      });
    });

    group('fromGoogleLatLngBounds', () {
      test('returns correct Atlas LatLngBounds', () {
        final northeast = GoogleMaps.LatLng(
          1,
          1,
        );
        final southwest = GoogleMaps.LatLng(
          0,
          0,
        );
        final testBoundingBox = GoogleMaps.LatLngBounds(
          northeast: northeast,
          southwest: southwest,
        );
        final result = LatLngUtils.fromGoogleLatLngBounds(testBoundingBox);
        final expectedNorthEast = LatLng(
          latitude: 1,
          longitude: 1,
        );
        final expectedSouthWest = LatLng(
          latitude: 0,
          longitude: 0,
        );
        expect(
          result.northeast.latitude,
          expectedNorthEast.latitude,
        );
        expect(
          result.southwest.longitude,
          expectedSouthWest.longitude,
        );
      });
    });
  });
}
