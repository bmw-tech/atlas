import 'dart:ui';

import 'heatcolor_interpolation.dart';

/// Defines the color of each pixel based on its density value in a heatmap

class Heatcolor {
  final HeatcolorInterpolation interpolation;
  final Map<double, Color> densityColors;

  Heatcolor({required this.interpolation, required this.densityColors});

  String toProperty() {
    final density = densityColors.keys.map((density) {
      final color = densityColors[density]!.toProperty();
      return '$density,"$color"';
    }).join(',');
    return '["interpolate",${interpolation.toProperty()},["heatmap-density"],$density]';
  }
}

extension ColorProperty on Color {
  String toProperty() => 'rgba($red,$green,$blue,$alpha)';
}
