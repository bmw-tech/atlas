import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';
import 'package:google_atlas/google_atlas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

main() {
  group('GoogleAtlas', () {
    GoogleAtlas googleAtlas;

    setUp(() {
      googleAtlas = GoogleAtlas();
    });

    test('should return correct GoogleMap when build is called', () {
      final initialCameraPosition = CameraPosition(
        target: CoordinatePair(latitude: 0.0, longitude: -190.0),
        zoom: 10.0,
      );
      final expectedInitialGoogleCameraPosition = GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(0.0, -190.0),
        zoom: 10.0,
      );
      final googleMap =
          googleAtlas.build(initialCameraPosition: initialCameraPosition);
      expect(googleMap is GoogleMaps.GoogleMap, true);
      expect(
        (googleMap as GoogleMaps.GoogleMap).initialCameraPosition,
        expectedInitialGoogleCameraPosition,
      );
    });
  });
}
