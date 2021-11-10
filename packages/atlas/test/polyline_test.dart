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

    test('should have correct properties when width is provided', () {
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
        width: 5,
      );

      expect(polyline.id, expectedId);
      expect(polyline.points, expectedPoints);
      expect(polyline.color, expectedColor);
      expect(polyline.width, 5);
    });

    test('should have correct properties when no isDottedLine is provided', () {
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

      final polyline = Polyline(
        id: expectedId,
        points: expectedPoints,
        isDottedLine: true,
      );

      expect(polyline.id, expectedId);
      expect(polyline.points, expectedPoints);
      expect(polyline.isDottedLine, true);
    });

    test('should have correct properties when isDottedLine is provided', () {
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

      final polyline = Polyline(
        id: expectedId,
        points: expectedPoints,
      );

      expect(polyline.id, expectedId);
      expect(polyline.points, expectedPoints);
      expect(polyline.isDottedLine, false);
    });

    test('should have correct properties when intervals is provided', () {
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
          intervals: [10.0, 10.0]);

      expect(polyline.id, expectedId);
      expect(polyline.points, expectedPoints);
      expect(polyline.color, expectedColor);
      expect(polyline.width, 10);
      expect(polyline.intervals, [10.0, 10.0]);
    });

    test('should have correct properties when width is NOT provided', () {
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
      expect(polyline.width, 10);
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

    test('should have correct properties when no zIndex is provided', () {
      final expectedId = 'id';
      final expectedPoints = [
        LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        )
      ];
      final expectedOnTap = () {};
      final expectedZIndex = 0.0;
      final marker = Polyline(
        id: expectedId,
        points: expectedPoints,
        onTap: expectedOnTap,
      );
      expect(marker.id, expectedId);
      expect(marker.points, expectedPoints);
      expect(marker.onTap, expectedOnTap);
      expect(marker.zIndex, expectedZIndex);
    });

    test('should have correct properties when is zIndex is provided', () {
      final expectedId = 'id';
      final expectedPoints = [
        LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        )
      ];
      final expectedOnTap = () {};
      final expectedZIndex = 2.0;
      final marker = Polyline(
        id: expectedId,
        points: expectedPoints,
        onTap: expectedOnTap,
        zIndex: 2.0,
      );
      expect(marker.id, expectedId);
      expect(marker.points, expectedPoints);
      expect(marker.onTap, expectedOnTap);
      expect(marker.zIndex, expectedZIndex);
    });
  });
}
