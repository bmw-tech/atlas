import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Polygon', () {
    test('should throw AssertionError if id is null', () {
      try {
        Polygon(
          id: null,
          points: [
            LatLng(
              latitude: 48.133,
              longitude: 11.5888,
            ),
            LatLng(
              latitude: 48.233,
              longitude: 11.5888,
            ),
            LatLng(
              latitude: 48.333,
              longitude: 11.4888,
            ),
          ],
          fillColor: Colors.red,
          strokeColor: Colors.red,
          strokeWidth: 1,
        );

        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should throw AssertionError if points is null', () {
      try {
        Polygon(
          id: 'id',
          points: null,
        );
        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should have correct properties when stroke color is NOT provided',
        () {
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

      final polygon = Polygon(
        id: expectedId,
        points: expectedPoints,
        strokeColor: expectedColor,
      );

      expect(polygon.id, expectedId);
      expect(polygon.points, expectedPoints);
      expect(polygon.strokeColor, expectedColor);
    });

    test('should have correct properties when strokeColor is provided', () {
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

      final polygon = Polygon(
        id: expectedId,
        points: expectedPoints,
        strokeColor: expectedColor,
      );

      expect(polygon.id, expectedId);
      expect(polygon.points, expectedPoints);
      expect(polygon.strokeColor, expectedColor);
    });

    test('should have correct properties when fillColor is provided', () {
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

      final polygon = Polygon(
        id: expectedId,
        points: expectedPoints,
        fillColor: expectedColor,
      );

      expect(polygon.id, expectedId);
      expect(polygon.points, expectedPoints);
      expect(polygon.fillColor, expectedColor);
    });

    test('should have correct properties when strokeWidth is provided', () {
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

      final polygon = Polygon(
        id: expectedId,
        points: expectedPoints,
        strokeWidth: 3,
      );

      expect(polygon.id, expectedId);
      expect(polygon.points, expectedPoints);
      expect(polygon.strokeWidth, 3);
    });

    test('should have correct properties when strokeWidth is NOT provided', () {
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

      final polygon = Polygon(
        id: expectedId,
        points: expectedPoints,
        strokeColor: expectedColor,
      );

      expect(polygon.id, expectedId);
      expect(polygon.points, expectedPoints);
      expect(polygon.strokeColor, expectedColor);
      expect(polygon.strokeWidth, 1);
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

      final polygon1 = Polygon(
        id: 'id',
        points: expectedPoints,
        strokeColor: Colors.green,
      );

      final polygon2 = Polygon(
        id: 'id',
        points: expectedPoints,
        strokeColor: Colors.green,
      );

      expect(polygon1, polygon2);
    });

    test('different instances with different properties should NOT be equal',
        () {
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

      final polygon1 = Polygon(
        id: 'id',
        points: expectedPoints,
        fillColor: Colors.green,
      );

      final polygon2 = Polygon(
        id: 'id',
        points: expectedPoints,
        strokeColor: Colors.green,
      );

      expect(polygon1, isNot(equals(polygon2)));
    });
  });
}
