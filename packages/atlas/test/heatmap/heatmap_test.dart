import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Heatmap Tests', () {
    test('Heatmap is correctly instantiated with default values', () {
      final heatpoints = <Heatpoint>{
        Heatpoint(id: '1', position: LatLng(latitude: 37.7749, longitude: -122.4194), counter: 10),
        Heatpoint(id: '2', position: LatLng(latitude: 34.0522, longitude: -118.2437), counter: 20),
      };
      final heatmap = Heatmap(heatpoints: heatpoints);

      expect(heatmap.heatpoints, equals(heatpoints));
      expect(heatmap.heatcolor, isNull);
      expect(heatmap.showCounter, isFalse);
    });

    test('Heatmap correctly assigns non-default values', () {
      final heatpoints = <Heatpoint>{
        Heatpoint(id: '1', position: LatLng(latitude: 37.7749, longitude: -122.4194), counter: 10),
        Heatpoint(id: '2', position: LatLng(latitude: 34.0522, longitude: -118.2437), counter: 20),
      };
      final heatcolor = Heatcolor(
        interpolation: LinearInterpolation(),
        densityColors: {0.0: Colors.red, 0.5: Colors.green, 1.0: Colors.blue},
      );
      final heatmap = Heatmap(heatpoints: heatpoints, heatcolor: heatcolor, showCounter: true);

      expect(heatmap.heatpoints, equals(heatpoints));
      expect(heatmap.heatcolor, equals(heatcolor));
      expect(heatmap.showCounter, isTrue);
    });
  });
}
