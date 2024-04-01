import 'package:atlas/src/heatmap/heatcolor.dart';
import 'package:flutter/material.dart';

import 'heatpoint.dart';

/// Visualization to depict the intensity of data at geographical points.
class Heatmap {
  /// The points where to build the heatmaps
  final Set<Heatpoint> points;

  /// Defines the color of each pixel based on its density value in a heatmap
  final Heatcolor? color;

  /// The global opacity at which the heatmap layer will be drawn.
  final double opacity;

  /// Whether to show or not the counter of points
  final bool showCounter;

  /// The color with which the counter will be drawn.
  final Color counterColor;

  const Heatmap({
    required this.points,
    this.color,
    this.opacity = 1,
    this.showCounter = false,
    this.counterColor = Colors.black,
  });
}
