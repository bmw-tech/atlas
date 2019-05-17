import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';

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
  });
}
