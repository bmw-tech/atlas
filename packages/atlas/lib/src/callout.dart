import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';

/// Marks a geographical location on the map.
class Callout {
  /// Uniquely identifies a `Callout`.
  final String id;

  /// The location where the `Callout` is drawn is represented as `LatLng`.
  final LatLng position;

  /// Optional MarkerIcon used to replace default icon
  final MarkerIcon icon;

  final Annotation annotation;

  /// The z-index of the callout, used to determine relative drawing order of
  /// map overlays.
  ///
  /// Lower values means drawn earlier, and thus appearing to be closer to the surface of the Earth.
  final double zIndex;
}

/// Text labels for a [Marker] info window.
class Annotation {
  final String title;

  final String subTitle;

  final MarkerIcon icon;

  /// A `void Function` which is called whenever a `Marker info` is tapped.
  final VoidCallback onTap;

  final AnnotationType annotationType;

  const Annotation({
    this.title,
    this.subTitle,
    this.icon,
    this.onTap,
    this.annotationType = AnnotationType.destination,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Annotation typedOther = other;
    return title == typedOther.title &&
        subTitle == typedOther.subTitle &&
        icon == typedOther.icon &&
        annotationType == typedOther.annotationType;
  }

  int get hashCode =>
      title.hashCode ^
      subTitle.hashCode ^
      icon.hashCode ^
      annotationType.hashCode;
}
