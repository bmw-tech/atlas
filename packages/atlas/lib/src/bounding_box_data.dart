import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';

/// Represents all information need to create the boundingBox
class BoundingBoxData {
  /// A latitude/longitude aligned rectangle `LatLngBounds`
  final LatLngBounds bounds;

  /// Optional 2D rectangle based on a Origin and Size `Rectangle2D`
  final Rectangle2D rectangle2d;

  /// Optional pading that should be apply to the bounding box
  final double padding;

  BoundingBoxData({
    @required this.bounds,
    this.rectangle2d,
    this.padding,
  }) : assert(bounds != null);
}
