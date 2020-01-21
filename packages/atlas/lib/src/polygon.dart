import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

class Polygon {
  /// Uniquely identifies a `Polygon`.
  final String id;

  final List<LatLng> points;

  final int strokeWidth;

  final Color strokeColor;

  final Color fillColor;

  const Polygon({
    @required this.id,
    @required this.points,
    this.strokeWidth = 1,
    this.strokeColor = Colors.blue,
    this.fillColor = Colors.blue,
  })  : assert(id != null),
        assert(points != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Polygon typedOther = other;
    return id == typedOther.id &&
        points == typedOther.points &&
        strokeWidth == typedOther.strokeWidth &&
        strokeColor == typedOther.strokeColor &&
        fillColor == typedOther.fillColor;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      points.hashCode ^
      strokeColor.hashCode ^
      fillColor.hashCode ^
      strokeWidth.hashCode;
}
