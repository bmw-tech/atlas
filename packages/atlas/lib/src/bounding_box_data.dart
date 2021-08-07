import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Represents all information need to create the boundingBox
class BoundingBoxData {
  /// A latitude/longitude aligned rectangle `LatLngBounds`
  final LatLngBounds? bounds;

  /// Optional 2D rectangle based on a Origin and Size `Rectangle2D`
  final Rectangle2D? rectangle2d;

  /// Optional padding that should be applied to the bounding box
  final EdgeInsets? padding;

  BoundingBoxData({
    @required this.bounds,
    this.rectangle2d,
    this.padding,
  }) : assert(bounds != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoundingBoxData &&
          runtimeType == other.runtimeType &&
          bounds == other.bounds &&
          rectangle2d == other.rectangle2d &&
          padding == other.padding;

  @override
  int get hashCode => bounds.hashCode ^ rectangle2d.hashCode ^ padding.hashCode;
}
