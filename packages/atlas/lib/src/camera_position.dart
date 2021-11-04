import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';

/// The `CameraPosition` represents the position of the map "camera",
/// the view point from which the world is shown in the map view.
/// Aggregates the camera's `target` geographical location and the its `zoom` level.
class CameraPosition {
  /// The camera's `target` position as `LatLng`.
  final LatLng target;

  /// The camera's zoom level as a `double`.
  final double zoom;

  const CameraPosition({
    @required this.target,
    this.zoom = 0.0,
  }) : assert(target != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final CameraPosition typedOther = other;
    return target == typedOther.target && zoom == typedOther.zoom;
  }

  @override
  int get hashCode => target.hashCode ^ zoom.hashCode;
}
