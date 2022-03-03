import 'package:atlas/atlas.dart';

/// Marks a geographical location on the map.
class Callout {
  /// Uniquely identifies a `Callout`.
  final String id;

  /// The location where the `Callout` is drawn is represented as `LatLng`.
  final LatLng position;

  /// The type of annotation of the `Callout`
  final AnnotationType? annotationType;

  /// Optional MarkerIcon used to replace default icon
  final MarkerIcon? icon;

  /// List of information of the `Callout`
  final List<String>? texts;

  /// A `void Function` which is called whenever a `Callout` is tapped.
  final void Function()? onTap;

  /// The z-index of the callout, used to determine relative drawing order of
  /// map overlays.
  ///
  /// Lower values means drawn earlier, and thus appearing to be closer to the surface of the Earth.
  final double zIndex;

  /// Specifies the anchor to be at a particular point in the marker image.
  final Anchor? anchor;

  const Callout({
    required this.id,
    required this.position,
    this.annotationType,
    this.icon,
    this.zIndex = 0.0,
    this.texts,
    this.onTap,
    this.anchor,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is Callout) {
      return id == other.id &&
          position == other.position &&
          icon == other.icon &&
          zIndex == other.zIndex &&
          annotationType == other.annotationType &&
          texts == other.texts &&
          anchor == other.anchor;
    } else {
      return false;
    }
  }

  @override
  int get hashCode =>
      id.hashCode ^
      position.hashCode ^
      icon.hashCode ^
      zIndex.hashCode ^
      annotationType.hashCode ^
      texts.hashCode ^
      anchor.hashCode;
}
