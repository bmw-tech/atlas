import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('TrackPlayback', () {
    late String id;
    late List<Polyline> polylines;

    setUp(() {
      id = 'id';
      polylines = [
        Polyline(
          id: 'id_polyline',
          points: [
            LatLng(
              latitude: 38.7439498,
              longitude: -9.1490721,
            ),
            LatLng(
              latitude: 36.7439498,
              longitude: 126.1490721,
            )
          ],
        ),
      ];
    });

    test(
        'should have correct properties when no optional parameters are provided',
        () {
      final trackPlayback = TrackPlayback(
        id: id,
        polylines: polylines,
      );
      expect(trackPlayback.id, id);
      expect(trackPlayback.polylines, polylines);
      expect(trackPlayback.carIcon, null);
      expect(trackPlayback.duration, 5000);
      expect(trackPlayback.overlookingAngle, 0);
      expect(trackPlayback.afterEndMarkers, null);
      expect(trackPlayback.colors, null);
      expect(trackPlayback.speeds, null);
      expect(trackPlayback.onCanceled, null);
      expect(trackPlayback.onCompleted, null);
    });

    test('should have correct properties when carIcon is provided', () {
      final expected = MarkerIcon(
        assetName: 'xxxx',
        width: 20,
        height: 20,
      );
      final trackPlayback = TrackPlayback(
        id: id,
        polylines: polylines,
        carIcon: expected,
      );
      expect(trackPlayback.id, id);
      expect(trackPlayback.polylines, polylines);
      expect(trackPlayback.carIcon, expected);
    });

    test('should have correct properties when duration is provided', () {
      final expected = 1000;
      final trackPlayback = TrackPlayback(
        id: id,
        polylines: polylines,
        duration: expected,
      );
      expect(trackPlayback.id, id);
      expect(trackPlayback.polylines, polylines);
      expect(trackPlayback.duration, expected);
    });

    test('should have correct properties when overlookingAngle is provided',
        () {
      final expected = 10;
      final trackPlayback = TrackPlayback(
        id: id,
        polylines: polylines,
        overlookingAngle: expected,
      );
      expect(trackPlayback.id, id);
      expect(trackPlayback.polylines, polylines);
      expect(trackPlayback.overlookingAngle, expected);
    });

    test('should have correct properties when afterEndMarkers is provided', () {
      final expected = [
        Marker(
          id: 'id_marker',
          position: LatLng(
            latitude: 30.00,
            longitude: 30.00,
          ),
        ),
      ];
      final trackPlayback = TrackPlayback(
        id: id,
        polylines: polylines,
        afterEndMarkers: expected,
      );
      expect(trackPlayback.id, id);
      expect(trackPlayback.polylines, polylines);
      expect(trackPlayback.afterEndMarkers, expected);
    });

    test('should have correct properties when colors is provided', () {
      final expected = [
        Colors.yellow,
      ];
      final trackPlayback = TrackPlayback(
        id: id,
        polylines: polylines,
        colors: expected,
      );
      expect(trackPlayback.id, id);
      expect(trackPlayback.polylines, polylines);
      expect(trackPlayback.colors, expected);
    });

    test('should have correct properties when speeds is provided', () {
      final expected = [
        10,
        20,
      ];
      final trackPlayback = TrackPlayback(
        id: id,
        polylines: polylines,
        speeds: expected,
      );
      expect(trackPlayback.id, id);
      expect(trackPlayback.polylines, polylines);
      expect(trackPlayback.speeds, expected);
    });

    test('should have correct properties when onCompleted is provided', () {
      final Function() expected = () {};
      final trackPlayback = TrackPlayback(
        id: id,
        polylines: polylines,
        onCompleted: expected,
      );
      expect(trackPlayback.id, id);
      expect(trackPlayback.polylines, polylines);
      expect(trackPlayback.onCompleted, expected);
    });

    test('should have correct properties when onCanceled is provided', () {
      final Function() expected = () {};
      final trackPlayback = TrackPlayback(
        id: id,
        polylines: polylines,
        onCanceled: expected,
      );
      expect(trackPlayback.id, id);
      expect(trackPlayback.polylines, polylines);
      expect(trackPlayback.onCanceled, expected);
    });

    test('different instances with same properties should be equal', () {
      final trackPlayback1 = TrackPlayback(
        id: id,
        polylines: polylines,
        duration: 300,
      );

      final trackPlayback2 = TrackPlayback(
        id: id,
        polylines: polylines,
        duration: 300,
      );

      expect(trackPlayback1, trackPlayback2);
    });

    test('should override hashCode properly', () {
      final expectedCarIcon = MarkerIcon(
        assetName: 'xxxx',
        width: 20,
        height: 20,
      );
      final expectedDuration = 1000;
      final expectedOverlookingAngle = 10;
      final expectedAfterEndMarkers = [
        Marker(
          id: 'id_marker',
          position: LatLng(
            latitude: 30.00,
            longitude: 30.00,
          ),
        ),
      ];
      final expectedColors = [
        Colors.yellow,
      ];
      final expectedSpeeds = [
        10,
        20,
      ];
      final Function() expectedOnCanceled = () {};
      final Function() expectedOnCompleted = () {};

      final trackPlayback = TrackPlayback(
        id: id,
        polylines: polylines,
        carIcon: expectedCarIcon,
        duration: expectedDuration,
        overlookingAngle: expectedOverlookingAngle,
        afterEndMarkers: expectedAfterEndMarkers,
        colors: expectedColors,
        speeds: expectedSpeeds,
        onCompleted: expectedOnCompleted,
        onCanceled: expectedOnCanceled,
      );
      expect(
          trackPlayback.hashCode,
          trackPlayback.id.hashCode ^
              trackPlayback.polylines.hashCode ^
              trackPlayback.carIcon.hashCode ^
              trackPlayback.duration.hashCode ^
              trackPlayback.overlookingAngle.hashCode ^
              trackPlayback.afterEndMarkers.hashCode ^
              trackPlayback.colors.hashCode ^
              trackPlayback.speeds.hashCode ^
              trackPlayback.onCanceled.hashCode ^
              trackPlayback.onCompleted.hashCode);
    });
  });
}
