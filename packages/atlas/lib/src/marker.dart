import 'package:flutter/foundation.dart';
import 'package:atlas/atlas.dart';

/// Marks a geographical location on the map.
class Marker {
  /// Uniquely identifies a `Marker`.
  final String id;

  /// The location where the `Marker` is drawn is represented as `LatLng`.
  final LatLng position;

  /// Optional MarkerIcon used to replace default icon
  final MarkerIcon icon;

  /// A `void Function` which is called whenever a `Marker` is tapped.
  final void Function() onTap;

  /// The z-index of the marker, used to determine relative drawing order of
  /// map overlays.
  ///
  /// Lower values means drawn earlier, and thus appearing to be closer to the surface of the Earth.
  final double zIndex;

  final Anchor anchor;

  const Marker({
    @required this.id,
    @required this.position,
    this.onTap,
    this.icon,
    this.zIndex = 0.0,
    this.anchor,
  })  : assert(id != null),
        assert(position != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Marker typedOther = other;
    return id == typedOther.id &&
        position == typedOther.position &&
        icon == typedOther.icon &&
        zIndex == typedOther.zIndex;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      position.hashCode ^
      icon.hashCode ^
      zIndex.hashCode ^
      anchor.hashCode;
}

/// {@template anchor}
/// Specifies the anchor to be at a particular point in the marker image.
///
/// The anchor specifies the point in the icon image that is anchored
/// to the marker's position on the Earth's surface.
///
/// The anchor point is specified in the continuous space [0.0, 1.0] x [0.0, 1.0],
/// where (0, 0) is the top-left corner of the image, and (1, 1) is the bottom-right corner.
/// The anchoring point in a W x H image is the nearest discrete grid point in a
/// (W + 1) x (H + 1) grid, obtained by scaling the then rounding.
/// For example, in a 4 x 2 image, the anchor point (0.7, 0.6) resolves
/// to the grid point at (3, 1).
/// {@endtemplate}
class Anchor {
  /// u-coordinate of the anchor, as a ratio of the image width (in the range [0, 1])
  final double u;

  /// v-coordinate of the anchor, as a ratio of the image height (in the range [0, 1])
  final double v;

  /// {@macro anchor}
  const Anchor({this.u = 0.5, this.v = 0.5});
}
