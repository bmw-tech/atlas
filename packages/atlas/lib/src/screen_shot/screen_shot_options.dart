import 'package:atlas/atlas.dart';

class ScreenShotOptions {
  final MapType mapType;
  final bool showUserLocation;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  final Set<Callout> callouts;
  final Set<Circle> circles;
  final Heatmap? heatmap;
  final bool traffic;

  ScreenShotOptions({
    this.mapType = MapType.normal,
    this.showUserLocation = false,
    this.markers = const {},
    this.polylines = const {},
    this.callouts = const {},
    this.circles = const {},
    this.heatmap,
    this.traffic = false,
  });
}
