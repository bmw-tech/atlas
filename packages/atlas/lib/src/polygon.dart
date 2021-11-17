import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

/// `Polygon` made up of mulitple points on the map
class Polygon {
  /// Uniquely identifies a `Polygon`
  final String id;

  /// A `List` of `LatLng` points that make up the polygon's shape
  final List<LatLng> points;

  /// Defines the width of the stroke surrounding the polygon's shape
  final int strokeWidth;

  /// Defines the `Color` of the stroke surrounding the polygon's shape
  final Color? strokeColor;

  /// Defines the fill `Color` within the polygon's shape
  final Color fillColor;

  const Polygon({
    required this.id,
    required this.points,
    this.strokeWidth = 1,
    this.strokeColor = Colors.blue,
    this.fillColor = Colors.blue,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is Polygon) {
      return id == other.id &&
          points == other.points &&
          strokeWidth == other.strokeWidth &&
          strokeColor == other.strokeColor &&
          fillColor == other.fillColor;
    } else {
      return false;
    }
  }

  @override
  int get hashCode =>
      id.hashCode ^
      points.hashCode ^
      strokeColor.hashCode ^
      fillColor.hashCode ^
      strokeWidth.hashCode;
}
