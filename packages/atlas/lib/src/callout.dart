import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';

class Callout {
  final String id;
  final LatLng position;
  final AnnotationType annotationType;
  final MarkerIcon icon;
  final List<String> texts;
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
    final Callout typedOther = other;
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
