import 'package:atlas/atlas.dart';
import 'package:flutter/widgets.dart';

/// Various options for describing the viewpoint of a camera. All fields are
/// optional.
///
/// Anchor and center points are mutually exclusive, with preference for the
/// center point when both are set.
class Viewpoint {
  Viewpoint({
    this.center,
    this.padding,
    this.anchor,
    this.zoom,
    this.bearing,
    this.pitch,
  });

  /// Coordinate at the center of the camera.
  LatLng? center;

  /// Padding around the interior of the view that affects the frame of
  /// reference for `center`.
  EdgeInsets? padding;

  /// Point of reference for `zoom` and `angle`, assuming an origin at the
  /// top-left corner of the view.
  ScreenCoordinates? anchor;

  /// Zero-based zoom level. Constrained to the minimum and maximum zoom
  /// levels.
  double? zoom;

  /// Bearing, measured in degrees from true north. Wrapped to [0, 360).
  double? bearing;

  /// Pitch toward the horizon measured in degrees.
  double? pitch;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is Viewpoint) {
      return center == other.center &&
          padding == other.padding &&
          anchor == other.anchor &&
          zoom == other.zoom &&
          bearing == other.bearing &&
          pitch == other.pitch;
    } else {
      return false;
    }
  }

  @override
  int get hashCode =>
      center.hashCode ^ padding.hashCode ^ anchor.hashCode ^ zoom.hashCode ^ bearing.hashCode ^ pitch.hashCode;
}
