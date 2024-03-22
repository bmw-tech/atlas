import 'package:atlas/src/heatmap/heatcolor.dart';

import 'heatpoint.dart';

/// Visualization to depict the intensity of data at geographical points.

class Heatmap {
  final Set<Heatpoint> heatpoints;
  final Heatcolor? heatcolor;
  final bool showCounter;

  const Heatmap({required this.heatpoints, this.heatcolor, this.showCounter = false});
}
