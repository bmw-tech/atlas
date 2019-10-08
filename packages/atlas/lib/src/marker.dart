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

  const Marker({
    @required this.id,
    @required this.position,
    this.onTap,
    this.icon,
    this.zIndex = 0.0,
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
      id.hashCode ^ position.hashCode ^ icon.hashCode ^ zIndex.hashCode;
}
