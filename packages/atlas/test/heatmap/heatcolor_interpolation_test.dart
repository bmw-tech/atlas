import 'package:atlas/src/heatmap/heatcolor_interpolation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HeatcolorInterpolation Tests', () {
    test('LinearInterpolation returns correct property', () {
      final interpolation = LinearInterpolation();
      expect(interpolation.toProperty(), '["linear"]');
    });

    test('ExponentialInterpolation returns correct property', () {
      final base = 2.0;
      final interpolation = ExponentialInterpolation(base);
      expect(interpolation.toProperty(), '["exponential", $base]');
    });

    test('CubitInterpolation returns correct property', () {
      final x1 = 0.42;
      final y1 = 0.0;
      final x2 = 0.58;
      final y2 = 1.0;
      final interpolation = CubitInterpolation(x1, y1, x2, y2);
      expect(interpolation.toProperty(), '["cubic-bezier"], $x1, $y1, $x2, $y2]');
    });
  });
}
