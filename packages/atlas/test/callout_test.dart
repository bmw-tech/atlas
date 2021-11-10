import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Callout', () {
    test('should throw AssertionError if id is null', () {
      try {
        Callout(
          id: null,
          position: LatLng(
            latitude: 37.42796133580664,
            longitude: -122.085749655962,
          ),
        );
        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should throw AssertionError if position is null', () {
      try {
        Callout(id: 'id', position: null);
        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should have correct properties when no zIndex is provided', () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedZIndex = 0.0;
      final callout = Callout(
        id: expectedId,
        position: expectedPosition,
      );
      expect(callout.id, expectedId);
      expect(callout.position, expectedPosition);
      expect(callout.zIndex, expectedZIndex);
    });

    test('should have correct properties when no AnnotationType is provided',
        () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedAnnotationType = null;
      final callout = Callout(
        id: expectedId,
        position: expectedPosition,
        annotationType: expectedAnnotationType,
      );
      expect(callout.id, expectedId);
      expect(callout.position, expectedPosition);
      expect(callout.annotationType, expectedAnnotationType);
    });

    test('should have correct properties when AnnotationType is provided', () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedAnnotationType = AnnotationType.route;
      final callout = Callout(
        id: expectedId,
        position: expectedPosition,
        annotationType: expectedAnnotationType,
      );
      expect(callout.id, expectedId);
      expect(callout.position, expectedPosition);
      expect(callout.annotationType, expectedAnnotationType);
    });

    test('should have correct properties when zIndex is provided', () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedZIndex = 1.0;
      final expectedOnTap = () {};
      final marker = Callout(
        id: expectedId,
        position: expectedPosition,
        zIndex: 1.0,
        onTap: expectedOnTap,
      );
      expect(marker.id, expectedId);
      expect(marker.position, expectedPosition);
      expect(marker.zIndex, expectedZIndex);
      expect(marker.onTap, expectedOnTap);
    });

    test('different instances with same properties should be equal', () {
      final callout1 = Callout(
        id: 'id',
        position: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zIndex: 1.0,
      );
      final callout2 = Callout(
        id: 'id',
        position: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zIndex: 1.0,
      );
      expect(callout1, callout2);
    });

    test('should override hashCode properly', () {
      final String id = "1";
      final double latitude = 1.0;
      final double longitude = 1.0;
      final AnnotationType annotationType = AnnotationType.route;
      final MarkerIcon icon = MarkerIcon(assetName: 'my-asset');
      final List<String> texts = ["T1, T2"];

      final callout = Callout(
          id: id,
          position: LatLng(
            latitude: latitude,
            longitude: longitude,
          ),
          annotationType: annotationType,
          icon: icon,
          texts: texts);

      expect(
          callout.hashCode,
          callout.id.hashCode ^
              callout.position.hashCode ^
              callout.annotationType.hashCode ^
              callout.icon.hashCode ^
              callout.texts.hashCode);
    });
  });
}
