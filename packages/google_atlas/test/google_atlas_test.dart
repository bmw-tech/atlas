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

    test('should return correct GoogleMap when build is called with no markers',
        () {
      final initialCameraPosition = CameraPosition(
        target: LatLng(latitude: 0.0, longitude: -190.0),
        zoom: 10.0,
      );
      final expectedInitialGoogleCameraPosition = GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(0.0, -190.0),
        zoom: 10.0,
      );
      final expectedGoogleMarkers = Set<GoogleMaps.Marker>();
      final googleMap = googleAtlas.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        showMyLocation: false,
      );
      expect(googleMap is GoogleMaps.GoogleMap, true);
      expect(
        (googleMap as GoogleMaps.GoogleMap).initialCameraPosition,
        expectedInitialGoogleCameraPosition,
      );
      expect(
        (googleMap as GoogleMaps.GoogleMap).mapType,
        GoogleMaps.MapType.normal,
      );
      expect(
        (googleMap as GoogleMaps.GoogleMap).markers,
        expectedGoogleMarkers,
      );
    });

    test('should return correct GoogleMap when build is called with markers',
        () {
      final initialCameraPosition = CameraPosition(
        target: LatLng(latitude: 0.0, longitude: -190.0),
        zoom: 10.0,
      );
      final expectedInitialGoogleCameraPosition = GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(0.0, -190.0),
        zoom: 10.0,
      );
      final expectedGoogleMarkers = Set<GoogleMaps.Marker>.from([
        GoogleMaps.Marker(
          markerId: GoogleMaps.MarkerId('markerId'),
          onTap: () {},
          position: GoogleMaps.LatLng(0.0, -190.0),
        )
      ]);
      final googleMap = googleAtlas.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>.from([
          Marker(
            id: 'markerId',
            onTap: () {},
            position: LatLng(latitude: 0.0, longitude: -190.0),
          ),
        ]),
        showMyLocation: false,
      );
      expect(googleMap is GoogleMaps.GoogleMap, true);
      expect(
        (googleMap as GoogleMaps.GoogleMap).initialCameraPosition,
        expectedInitialGoogleCameraPosition,
      );
      expect(
        (googleMap as GoogleMaps.GoogleMap).mapType,
        GoogleMaps.MapType.normal,
      );
      expect(
        (googleMap as GoogleMaps.GoogleMap).markers,
        expectedGoogleMarkers,
      );
    });

    test('should return correct GoogleMap when build is called without onTap',
        () {
      final initialCameraPosition = CameraPosition(
        target: LatLng(latitude: 0.0, longitude: -190.0),
        zoom: 10.0,
      );
      final expectedInitialGoogleCameraPosition = GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(0.0, -190.0),
        zoom: 10.0,
      );
      final googleMap = googleAtlas.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        showMyLocation: false,
      );
      expect(googleMap is GoogleMaps.GoogleMap, true);
      expect(
        (googleMap as GoogleMaps.GoogleMap).initialCameraPosition,
        expectedInitialGoogleCameraPosition,
      );
      expect(
        (googleMap as GoogleMaps.GoogleMap).mapType,
        GoogleMaps.MapType.normal,
      );
      try {
        (googleMap as GoogleMaps.GoogleMap).onTap(GoogleMaps.LatLng(0, 0));
      } catch (_) {
        fail('should not throw');
      }
    });

    test('should return correct GoogleMap when build is called with onTap', () {
      final initialCameraPosition = CameraPosition(
        target: LatLng(latitude: 0.0, longitude: -190.0),
        zoom: 10.0,
      );
      final expectedInitialGoogleCameraPosition = GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(0.0, -190.0),
        zoom: 10.0,
      );
      int onTapCallCount = 0;
      LatLng onTapPosition;
      final onTap = (LatLng position) {
        onTapCallCount++;
        onTapPosition = position;
      };
      final googleMap = googleAtlas.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        showMyLocation: false,
        onTap: onTap,
      );
      expect(googleMap is GoogleMaps.GoogleMap, true);
      expect(
        (googleMap as GoogleMaps.GoogleMap).initialCameraPosition,
        expectedInitialGoogleCameraPosition,
      );
      expect(
        (googleMap as GoogleMaps.GoogleMap).mapType,
        GoogleMaps.MapType.normal,
      );
      (googleMap as GoogleMaps.GoogleMap).onTap(GoogleMaps.LatLng(0, 0));
      expect(onTapCallCount, 1);
      expect(onTapPosition.latitude, 0);
      expect(onTapPosition.longitude, 0);
    });

    test(
        'should return correct GoogleMap when build is called with showMyLocation = false',
        () {
      final initialCameraPosition = CameraPosition(
        target: LatLng(latitude: 0.0, longitude: -190.0),
        zoom: 10.0,
      );
      final expectedInitialGoogleCameraPosition = GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(0.0, -190.0),
        zoom: 10.0,
      );
      final expectedMyLocationEnabled = false;
      final googleMap = googleAtlas.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        showMyLocation: expectedMyLocationEnabled,
      );
      expect(googleMap is GoogleMaps.GoogleMap, true);
      expect(
        (googleMap as GoogleMaps.GoogleMap).initialCameraPosition,
        expectedInitialGoogleCameraPosition,
      );
      expect(
        (googleMap as GoogleMaps.GoogleMap).mapType,
        GoogleMaps.MapType.normal,
      );
      expect(
        (googleMap as GoogleMaps.GoogleMap).myLocationEnabled,
        expectedMyLocationEnabled,
      );
    });

    test(
        'should return correct GoogleMap when build is called with showMyLocation = true',
        () {
      final initialCameraPosition = CameraPosition(
        target: LatLng(latitude: 0.0, longitude: -190.0),
        zoom: 10.0,
      );
      final expectedInitialGoogleCameraPosition = GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(0.0, -190.0),
        zoom: 10.0,
      );
      final expectedMyLocationEnabled = true;
      final googleMap = googleAtlas.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        showMyLocation: expectedMyLocationEnabled,
      );
      expect(googleMap is GoogleMaps.GoogleMap, true);
      expect(
        (googleMap as GoogleMaps.GoogleMap).initialCameraPosition,
        expectedInitialGoogleCameraPosition,
      );
      expect(
        (googleMap as GoogleMaps.GoogleMap).mapType,
        GoogleMaps.MapType.normal,
      );
      expect(
        (googleMap as GoogleMaps.GoogleMap).myLocationEnabled,
        expectedMyLocationEnabled,
      );
    });
  });
}
