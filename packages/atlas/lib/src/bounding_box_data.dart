import 'package:atlas/atlas.dart';
import 'package:flutter/widgets.dart';

/// Represents all information need to create the boundingBox
class BoundingBoxData {
  /// A latitude/longitude aligned rectangle `LatLngBounds`
  final LatLngBounds bounds;

  /// Optional 2D rectangle based on a Origin and Size `Rectangle2D`
  final Rectangle2D? rectangle2d;

  /// Optional padding that should be applied to the bounding box
  final EdgeInsets? padding;

  BoundingBoxData({
    required this.bounds,
    this.rectangle2d,
    this.padding,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is BoundingBoxData) {
      return bounds == other.bounds &&
          rectangle2d == other.rectangle2d &&
          padding == other.padding;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => bounds.hashCode ^ rectangle2d.hashCode ^ padding.hashCode;
}
