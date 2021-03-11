import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';

/// Marks a geographical location on the map.
class Callout {
  /// Uniquely identifies a `Callout`.
  final String id;

  /// The location where the `Callout` is drawn is represented as `LatLng`.
  final LatLng position;

  final AnnotationType annotationType;

  /// Optional MarkerIcon used to replace default icon
  final MarkerIcon icon;

  final List<String> texts;

  /// The z-index of the callout, used to determine relative drawing order of
  /// map overlays.
  ///
  /// Lower values means drawn earlier, and thus appearing to be closer to the surface of the Earth.
  final double zIndex;

  const Callout({
    @required this.id,
    @required this.position,
    this.annotationType,
    this.icon,
    this.zIndex = 0.0,
    this.texts,
  })  : assert(id != null),
        assert(position != null);
}
