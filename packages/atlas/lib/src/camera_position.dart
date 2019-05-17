import 'package:meta/meta.dart';
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
    @required this.target,
    this.zoom = 0.0,
  }) : assert(target != null);
}
