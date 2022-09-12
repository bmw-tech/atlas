import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('DeviceLocation', () {
    test('should have correct properties when provided', () {
      final deviceLocation = DeviceLocation(
        target: LatLng(
          latitude: 1.0,
          longitude: 1.0,
        ),
        accuracy: 1.0,
        altitude: 1.0,
        heading: 1.0,
        colorOutlineIndicator: Colors.white,
        object3DAsset: 'test',
        textureAsset: 'test',
      );
      expect(deviceLocation.target.latitude, 1.0);
      expect(deviceLocation.target.longitude, 1.0);
      expect(deviceLocation.accuracy, 1.0);
      expect(deviceLocation.heading, 1.0);
      expect(deviceLocation.colorOutlineIndicator, Colors.white);
      expect(deviceLocation.isActive, false);
      expect(deviceLocation.object3DAsset, 'test');
      expect(deviceLocation.textureAsset, 'test');
    });

    test('accuracy should be zero when not provided', () {
      final deviceLocation = DeviceLocation(
        target: LatLng(
          latitude: 1.0,
          longitude: 1.0,
        ),
      );
      expect(deviceLocation.accuracy, 0.0);
    });

    test('accuracy should be null when passing null', () {
      final deviceLocation = DeviceLocation(
        target: LatLng(
          latitude: 1.0,
          longitude: 1.0,
        ),
        accuracy: null,
      );
      expect(deviceLocation.accuracy, null);
    });

    test('heading should be null when passing null', () {
      final deviceLocation = DeviceLocation(
        target: LatLng(
          latitude: 1.0,
          longitude: 1.0,
        ),
        heading: null,
      );
      expect(deviceLocation.heading, null);
    });

    test('heading should be zero when not provided', () {
      final deviceLocation = DeviceLocation(
        target: LatLng(
          latitude: 1.0,
          longitude: 1.0,
        ),
      );
      expect(deviceLocation.heading, 0.0);
    });

    test('different instances with same properties should be equal', () {
      final deviceLocationA = DeviceLocation(
        target: LatLng(
          latitude: 1.0,
          longitude: 1.0,
        ),
        accuracy: 1.0,
        altitude: 1.0,
        heading: 1.0,
        colorOutlineIndicator: Colors.white,
        isActive: true,
        object3DAsset: 'test',
        textureAsset: 'test',
      );

      final deviceLocationB = DeviceLocation(
        target: LatLng(
          latitude: 1.0,
          longitude: 1.0,
        ),
        accuracy: 1.0,
        altitude: 1.0,
        heading: 1.0,
        colorOutlineIndicator: Colors.white,
        isActive: true,
        object3DAsset: 'test',
        textureAsset: 'test',
      );

      expect(deviceLocationA, deviceLocationB);
    });

    test('should override hashCode properly', () {
      final double latitude = 1.0;
      final double longitude = 1.0;
      final double accuracy = 1.0;
      final double altitude = 1.0;
      final double heading = 1.0;
      final Color colorOutlineIndicator = Colors.white;
      final bool isActive = true;
      final String object3DAsset = 'test';
      final String textureAsset = 'test';

      final deviceLocation = DeviceLocation(
        target: LatLng(
          latitude: latitude,
          longitude: longitude,
        ),
        accuracy: accuracy,
        altitude: altitude,
        heading: heading,
        colorOutlineIndicator: colorOutlineIndicator,
        isActive: isActive,
        object3DAsset: object3DAsset,
        textureAsset: textureAsset,
      );
      expect(
          deviceLocation.hashCode,
          deviceLocation.target.hashCode ^
              deviceLocation.accuracy.hashCode ^
              deviceLocation.altitude.hashCode ^
              deviceLocation.heading.hashCode ^
              deviceLocation.isActive.hashCode ^
              deviceLocation.object3DAsset.hashCode ^
              deviceLocation.colorOutlineIndicator.hashCode ^
              deviceLocation.textureAsset.hashCode);
    });
  });
}
