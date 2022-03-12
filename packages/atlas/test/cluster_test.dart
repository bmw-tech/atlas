import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';

main() {
  group('Cluster', () {
    test('should have correct properties when no onTap is provided', () {
      final expectedId = 'id';
      final dynamic expectedOnTap = null;
      final cluster = Cluster(
        id: expectedId,
        onTap: expectedOnTap,
      );
      expect(cluster.id, expectedId);
      expect(cluster.onTap, expectedOnTap);
    });

    test('should have correct properties when no zIndex is provided', () {
      final expectedId = 'id';
      final dynamic expectedOnTap = null;
      final expectedZIndex = 0.0;
      final cluster = Cluster(
        id: expectedId,
        onTap: expectedOnTap,
      );
      expect(cluster.id, expectedId);
      expect(cluster.onTap, expectedOnTap);
      expect(cluster.zIndex, expectedZIndex);
    });

    test('should have correct properties when zIndex is provided', () {
      final expectedId = 'id';
      final dynamic expectedOnTap = null;
      final expectedZIndex = 1.0;
      final cluster = Cluster(
        id: expectedId,
        onTap: expectedOnTap,
        zIndex: 1.0,
      );
      expect(cluster.id, expectedId);
      expect(cluster.onTap, expectedOnTap);
      expect(cluster.zIndex, expectedZIndex);
    });

    test('should have correct properties when onTap is provided', () {
      final expectedId = 'id';
      final expectedOnTap = () {};
      final cluster = Cluster(
        id: expectedId,
        onTap: expectedOnTap,
      );
      expect(cluster.id, expectedId);
      expect(cluster.onTap, expectedOnTap);
    });

    test('should have correct properties when position is provided', () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final cluster = Cluster(
        id: expectedId,
        position: expectedPosition,
      );
      expect(cluster.id, expectedId);
      expect(cluster.position, expectedPosition);
    });

    test('should have correct properties when no icon is provided', () {
      final expectedId = 'id';
      final expectedIcon = null;
      final cluster = Cluster(
        id: expectedId,
        icon: expectedIcon,
      );
      expect(cluster.id, expectedId);
      expect(cluster.icon, expectedIcon);
    });

    test('should have correct properties when icon is provided', () {
      final expectedId = 'id';
      final expectedIcon = ClusterIcon(
        assetName: 'assest',
      );
      final cluster = Cluster(
        id: expectedId,
        icon: expectedIcon,
      );
      expect(cluster.id, expectedId);
      expect(cluster.icon, expectedIcon);
    });

    test('should have correct properties when markers is provided', () {
      final expectedId = 'id';
      final expectedMarkers = Set<Marker>.from([
        Marker(
          id: 'a',
          position: LatLng(
            latitude: 37.42796133580664,
            longitude: -122.085749655962,
          ),
        )
      ]);
      final cluster = Cluster(
        id: expectedId,
        markers: expectedMarkers,
      );
      expect(cluster.id, expectedId);
      expect(cluster.markers, expectedMarkers);
    });

    test('different instances with same properties should be equal', () {
      final onTap = () {};
      final markers = [
        Marker(
          id: 'id',
          position: LatLng(
            latitude: 37.42796133580664,
            longitude: -122.085749655962,
          ),
        ),
      ].toSet();
      final cluster1 = Cluster(
        id: 'id',
        position: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        onTap: onTap,
        zIndex: 1.0,
        markers: markers,
        description: 'a',
        icon: ClusterIcon(
          assetName: 'assest/',
        ),
      );
      final cluster2 = Cluster(
        id: 'id',
        position: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        onTap: onTap,
        zIndex: 1.0,
        markers: markers,
        description: 'a',
        icon: ClusterIcon(
          assetName: 'assest/',
        ),
      );

      expect(cluster1, cluster2);
    });

    test('should have correct properties when description is provided', () {
      final expectedId = 'id';
      final expectedPosition = LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      );
      final dynamic expectedOnTap = null;
      final expectedDescription = 'a';
      final cluster = Cluster(
        id: expectedId,
        position: expectedPosition,
        onTap: expectedOnTap,
        description: expectedDescription,
      );
      expect(cluster.id, expectedId);
      expect(cluster.position, expectedPosition);
      expect(cluster.onTap, expectedOnTap);
      expect(cluster.description, expectedDescription);
    });
  });
}
