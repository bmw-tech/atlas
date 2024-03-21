import 'package:atlas/src/lat_lng.dart';

/// The points where to build the heatmaps

class Heatpoint {
  final String id;
  final LatLng position;
  final int counter;

  const Heatpoint({required this.id, required this.position, required this.counter});
}
