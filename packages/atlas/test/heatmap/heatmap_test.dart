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
      final heatmap = Heatmap(points: heatpoints);

      expect(heatmap.points, equals(heatpoints));
      expect(heatmap.color, isNull);
      expect(heatmap.opacity, 1);
      expect(heatmap.showCounter, isFalse);
      expect(heatmap.counterColor, Colors.black);
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
      final heatmap = Heatmap(
        points: heatpoints,
        color: heatcolor,
        opacity: 0.5,
        showCounter: true,
        counterColor: Colors.white,
      );

      expect(heatmap.points, equals(heatpoints));
      expect(heatmap.color, equals(heatcolor));
      expect(heatmap.opacity, 0.5);
      expect(heatmap.showCounter, isTrue);
      expect(heatmap.counterColor, Colors.white);
    });
  });
}
