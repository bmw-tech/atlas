import 'dart:ui';

import 'package:atlas/src/heatmap/heatcolor.dart';
import 'package:atlas/src/heatmap/heatcolor_interpolation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Heatcolor Tests', () {
    test('Heatcolor returns correct property string', () {
      final interpolation = LinearInterpolation();
      final densityColors = {
        0.0: Color.fromARGB(255, 255, 0, 0), // Red
        0.5: Color.fromARGB(255, 0, 255, 0), // Green
        1.0: Color.fromARGB(255, 0, 0, 255), // Blue
      };
      final heatcolor = Heatcolor(interpolation: interpolation, densityColors: densityColors);
      final expectedString = '["interpolate",["linear"],["heatmap-density"],'
          '0.0,"rgba(255,0,0,255)",'
          '0.5,"rgba(0,255,0,255)",'
          '1.0,"rgba(0,0,255,255)"]';

      expect(heatcolor.toProperty(), expectedString);
    });
  });
}
