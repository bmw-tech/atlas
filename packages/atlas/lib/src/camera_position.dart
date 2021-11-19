import 'package:atlas/atlas.dart';

/// The `CameraPosition` represents the position of the map "camera",
/// the view point from which the world is shown in the map view.
/// Aggregates the camera's `target` geographical location and the its `zoom` level.
class CameraPosition {
  /// The camera's `target` position as `LatLng`.
  final LatLng target;

  /// The camera's zoom level as a `double`.
  final double zoom;

  const CameraPosition({
    required this.target,
    this.zoom = 0.0,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is CameraPosition) {
      return target == other.target && zoom == other.zoom;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => target.hashCode ^ zoom.hashCode;
}
