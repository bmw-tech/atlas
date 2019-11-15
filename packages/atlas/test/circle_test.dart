import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Circle', () {
    test('should throw AssertionError if id is null', () {
      try {
        Circle(
          id: null,
          center: LatLng(
            latitude: 38.7439498,
            longitude: -9.1490721,
          ),
          radius: 0.0,
        );

        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should throw AssertionError if center is null', () {
      try {
        Circle(
          id: 'id',
          center: null,
          radius: 0.0,
        );

        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should throw AssertionError if radius is null', () {
      try {
        Circle(
          id: 'id',
          center: LatLng(
            latitude: 38.7439498,
            longitude: -9.1490721,
          ),
          radius: null,
        );

        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should have correct properties when no fillColor is provided', () {
      final expectedId = 'id';
      final expectedCenter = LatLng(
        latitude: 38.7439498,
        longitude: -9.1490721,
      );
      final expectedRadius = 10.0;
      final expectedFillColor = null;

      final circle = Circle(
        id: expectedId,
        center: expectedCenter,
        radius: expectedRadius,
        fillColor: expectedFillColor,
      );

      expect(circle.id, expectedId);
      expect(circle.center, expectedCenter);
      expect(circle.radius, expectedRadius);
      expect(circle.fillColor, expectedFillColor);
    });

    test('should have correct properties when fillColor is provided', () {
      final expectedId = 'id';
      final expectedCenter = LatLng(
        latitude: 38.7439498,
        longitude: -9.1490721,
      );
      final expectedRadius = 10.0;
      final expectedFillColor = Colors.green;

      final circle = Circle(
        id: expectedId,
        center: expectedCenter,
        radius: expectedRadius,
        fillColor: expectedFillColor,
      );

      expect(circle.id, expectedId);
      expect(circle.center, expectedCenter);
      expect(circle.radius, expectedRadius);
      expect(circle.fillColor, expectedFillColor);
    });

    test('should have correct properties when no strokeColor is provided', () {
      final expectedId = 'id';
      final expectedCenter = LatLng(
        latitude: 38.7439498,
        longitude: -9.1490721,
      );
      final expectedRadius = 10.0;
      final expectedStrokeColor = null;

      final circle = Circle(
        id: expectedId,
        center: expectedCenter,
        radius: expectedRadius,
        strokeColor: expectedStrokeColor,
      );

      expect(circle.id, expectedId);
      expect(circle.center, expectedCenter);
      expect(circle.radius, expectedRadius);
      expect(circle.strokeColor, expectedStrokeColor);
    });

    test('should have correct properties when strokeColor is provided', () {
      final expectedId = 'id';
      final expectedCenter = LatLng(
        latitude: 38.7439498,
        longitude: -9.1490721,
      );
      final expectedRadius = 10.0;
      final expectedStrokeColor = Colors.orange;

      final circle = Circle(
        id: expectedId,
        center: expectedCenter,
        radius: expectedRadius,
        strokeColor: expectedStrokeColor,
      );

      expect(circle.id, expectedId);
      expect(circle.center, expectedCenter);
      expect(circle.radius, expectedRadius);
      expect(circle.strokeColor, expectedStrokeColor);
    });

    test('should have correct properties when no zIndex is provided', () {
      final expectedId = 'id';
      final expectedCenter = LatLng(
        latitude: 38.7439498,
        longitude: -9.1490721,
      );
      final expectedRadius = 10.0;
      final expectedZIndex = null;

      final circle = Circle(
        id: expectedId,
        center: expectedCenter,
        radius: expectedRadius,
        zIndex: expectedZIndex,
      );

      expect(circle.id, expectedId);
      expect(circle.center, expectedCenter);
      expect(circle.radius, expectedRadius);
      expect(circle.zIndex, expectedZIndex);
    });

    test('should have correct properties when zIndex is provided', () {
      final expectedId = 'id';
      final expectedCenter = LatLng(
        latitude: 38.7439498,
        longitude: -9.1490721,
      );
      final expectedRadius = 10.0;
      final expectedZIndex = 1.0;

      final circle = Circle(
        id: expectedId,
        center: expectedCenter,
        radius: expectedRadius,
        zIndex: expectedZIndex,
      );

      expect(circle.id, expectedId);
      expect(circle.center, expectedCenter);
      expect(circle.radius, expectedRadius);
      expect(circle.zIndex, expectedZIndex);
    });

    test('different instances with same properties should be equal', () {
      final circle1 = Circle(
        id: 'id',
        center: LatLng(
          latitude: 38.7439498,
          longitude: -9.1490721,
        ),
        radius: 10.0,
        fillColor: Colors.green,
        strokeColor: Colors.orange,
        zIndex: 1.0,
      );
      final circle2 = Circle(
        id: 'id',
        center: LatLng(
          latitude: 38.7439498,
          longitude: -9.1490721,
        ),
        radius: 10.0,
        fillColor: Colors.green,
        strokeColor: Colors.orange,
        zIndex: 1.0,
      );

      expect(circle1, circle2);
    });
  });
}
