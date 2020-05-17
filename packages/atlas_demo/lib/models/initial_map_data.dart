import 'package:meta/meta.dart';

import 'models.dart';

class InitialMapData {
  final List<DemoCameraPosition> cameraPositions;
  final List<DemoMarker> markers;
  final List<DemoCircle> circles;
  final List<DemoPolygon> polygons;
  final List<DemoPolyLine> polyLines;

  InitialMapData({
    @required this.cameraPositions,
    this.markers,
    this.circles,
    this.polygons,
    this.polyLines,
  });
}
