import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Polyline', () {
    test('should throw AssertionError if id is null', () {
      try {
        Polyline(
          id: null,
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
        );

        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should throw AssertionError if points is null', () {
      try {
        Polyline(
          id: 'id',
          points: null,
        );
        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should have correct properties when no Color is provided', () {
      final expectedId = 'id';
      final expectedPoints = [
        LatLng(
          latitude: 38.7439498,
          longitude: -9.1490721,
        ),
        LatLng(
          latitude: 36.7439498,
          longitude: 126.1490721,
        )
      ];

      final expectedColor = null;

      final polyline = Polyline(
        id: expectedId,
        points: expectedPoints,
        color: expectedColor,
      );

      expect(polyline.id, expectedId);
      expect(polyline.points, expectedPoints);
      expect(polyline.color, expectedColor);
    });

    test('should have correct properties when Color is provided', () {
      final expectedId = 'id';
      final expectedPoints = [
        LatLng(
          latitude: 38.7439498,
          longitude: -9.1490721,
        ),
        LatLng(
          latitude: 36.7439498,
          longitude: 126.1490721,
        )
      ];

      final expectedColor = Colors.orange;

      final polyline = Polyline(
        id: expectedId,
        points: expectedPoints,
        color: expectedColor,
      );

      expect(polyline.id, expectedId);
      expect(polyline.points, expectedPoints);
      expect(polyline.color, expectedColor);
    });

    test('different instances with same properties should be equal', () {
      final expectedPoints = [
        LatLng(
          latitude: 38.7439498,
          longitude: -9.1490721,
        ),
        LatLng(
          latitude: 36.7439498,
          longitude: 126.1490721,
        )
      ];

      final polyline1 = Polyline(
        id: 'id',
        points: expectedPoints,
        color: Colors.green,
      );

      final polyline2 = Polyline(
        id: 'id',
        points: expectedPoints,
        color: Colors.green,
      );

      expect(polyline1, polyline2);
    });
  });
}
