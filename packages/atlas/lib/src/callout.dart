import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';

/// Marks a geographical location on the map.
class Callout {
  /// Uniquely identifies a `Callout`.
  final String? id;

  /// The location where the `Callout` is drawn is represented as `LatLng`.
  final LatLng? position;

  /// The type of annotation of the `Callout`
  final AnnotationType? annotationType;

  /// Optional MarkerIcon used to replace default icon
  final MarkerIcon? icon;

  /// List of information of the `Callout`
  final List<String>? texts;

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Callout typedOther = other is Callout
        ? other
        : Callout(id: "0", position: LatLng(latitude: 0, longitude: 0));
    return id == typedOther.id &&
        position == typedOther.position &&
        icon == typedOther.icon &&
        zIndex == typedOther.zIndex &&
        annotationType == typedOther.annotationType &&
        texts == typedOther.texts;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      position.hashCode ^
      icon.hashCode ^
      zIndex.hashCode ^
      annotationType.hashCode ^
      texts.hashCode;
}
