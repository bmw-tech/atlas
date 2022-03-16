import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';

main() {
  group('Cluster Icon', () {
    test('should throw assertion error if assetName is null', () {
      try {
        ClusterIcon(
          assetName: null,
        );
        fail('should throw assertion error');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    test('should override == properly when using assetName', () {
      expect(
        ClusterIcon(
          assetName: 'my-asset',
        ),
        ClusterIcon(
          assetName: 'my-asset',
        ),
      );
    });

    test('should override == properly when using assetBytes', () {
      final assetBytes = Uint8List(10);
      expect(
        ClusterIcon(
          assetBytes: assetBytes,
        ),
        ClusterIcon(
          assetBytes: assetBytes,
        ),
      );
    });

    test('should override hashCode properly', () {
      final clusterIcon = ClusterIcon(
        assetName: 'my-asset',
      );
      expect(
        clusterIcon.hashCode,
        clusterIcon.assetName.hashCode ^ clusterIcon.assetBytes.hashCode,
      );
    });
  });
}
