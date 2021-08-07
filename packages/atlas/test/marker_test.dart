import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Marker', () {
    test('should throw AssertionError if id is null', () {
      try {
        Marker(
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
        Marker(id: 'id', position: null);
        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should have correct properties when no onTap is provided', () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedOnTap = null;
      final marker = Marker(
        id: expectedId,
        position: expectedPosition,
        onTap: expectedOnTap,
      );
      expect(marker.id, expectedId);
      expect(marker.position, expectedPosition);
      expect(marker.onTap, expectedOnTap);
    });

    test('should have correct properties when no zIndex is provided', () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedOnTap = null;
      final expectedZIndex = 0.0;
      final marker = Marker(
        id: expectedId,
        position: expectedPosition,
        onTap: expectedOnTap,
      );
      expect(marker.id, expectedId);
      expect(marker.position, expectedPosition);
      expect(marker.onTap, expectedOnTap);
      expect(marker.zIndex, expectedZIndex);
    });

    test('should have correct properties when zIndex is provided', () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedOnTap = null;
      final expectedZIndex = 1.0;
      final marker = Marker(
        id: expectedId,
        position: expectedPosition,
        onTap: expectedOnTap,
        zIndex: 1.0,
      );
      expect(marker.id, expectedId);
      expect(marker.position, expectedPosition);
      expect(marker.onTap, expectedOnTap);
      expect(marker.zIndex, expectedZIndex);
    });

    test('should have correct properties when onTap is provided', () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedOnTap = () {};
      final marker = Marker(
        id: expectedId,
        position: expectedPosition,
        onTap: expectedOnTap,
      );
      expect(marker.id, expectedId);
      expect(marker.position, expectedPosition);
      expect(marker.onTap, expectedOnTap);
    });

    test('should have correct properties when no MarkerAnnotation is provided',
        () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedMarkerAnnotation = null;
      final marker = Marker(
        id: expectedId,
        position: expectedPosition,
        annotation: expectedMarkerAnnotation,
      );
      expect(marker.id, expectedId);
      expect(marker.position, expectedPosition);
      expect(marker.annotation, expectedMarkerAnnotation);
    });

    test('should have correct properties when MarkerAnnotation is provided',
        () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedMarkerAnnotation = Annotation(
        title: 'MarkerAnnotation Title',
        subTitle: 'MarkerAnnotation subTitle',
      );
      final marker = Marker(
        id: expectedId,
        position: expectedPosition,
        annotation: expectedMarkerAnnotation,
      );
      expect(marker.id, expectedId);
      expect(marker.position, expectedPosition);
      expect(marker.annotation?.title, expectedMarkerAnnotation.title);
      expect(marker.annotation?.subTitle, expectedMarkerAnnotation.subTitle);
    });

    test('different instances with same properties should be equal', () {
      final marker1 = Marker(
        id: 'id',
        position: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        onTap: () {},
        zIndex: 1.0,
      );
      final marker2 = Marker(
        id: 'id',
        position: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        onTap: () {},
        zIndex: 1.0,
      );

      final anchor = Anchor();

      final marker3 = Marker(
        id: 'id',
        position: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        onTap: () {},
        zIndex: 1.0,
        anchor: anchor,
      );

      final marker4 = Marker(
        id: 'id',
        position: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        onTap: () {},
        zIndex: 1.0,
        anchor: anchor,
      );
      expect(marker1, marker2);
      expect(marker3, marker4);
    });

    test('should have correct properties when heading is provided', () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final expectedOnTap = null;
      final expectedHeading = 180;
      final marker = Marker(
        id: expectedId,
        position: expectedPosition,
        onTap: expectedOnTap,
        heading: 180,
      );
      expect(marker.id, expectedId);
      expect(marker.position, expectedPosition);
      expect(marker.onTap, expectedOnTap);
      expect(marker.heading, expectedHeading);
    });
  });
}
