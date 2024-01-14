import 'package:atlas/atlas.dart';

/// The `CameraPosition` represents the position of the map "camera",
/// the view point from which the world is shown in the map view.
/// Aggregates the camera's `target` geographical location and the its `zoom` level.
class CameraPosition {
  /// The camera's `target` position as `LatLng`.
  final LatLng target;

  /// The camera's zoom level as a `double`.
  final double zoom;

  /// Optional is the `CameraPosition` generated from a user interaction with the map
  final bool? isUserUpdate;

  final double? bearing;

  const CameraPosition({
    required this.target,
    this.zoom = 0.0,
    this.isUserUpdate,
    this.bearing,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is CameraPosition) {
      return target == other.target &&
          zoom == other.zoom &&
          isUserUpdate == other.isUserUpdate &&
          bearing == other.isUserUpdate;
    } else {
      return false;
    }
  }

  @override
  int get hashCode =>
      target.hashCode ^ zoom.hashCode ^ bearing.hashCode ^ bearing.hashCode;
}
