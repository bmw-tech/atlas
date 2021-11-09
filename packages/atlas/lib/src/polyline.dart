import 'package:flutter/foundation.dart';
import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

/// A `Polyline` made up of multiple points on the map
class Polyline {
  /// Uniquely identifies a `Polyline`.
  final String id;

  /// A `List` of `LatLng` points that make up the polyline's shape.
  final List<LatLng> points;

  /// A `void Function` which is called whenever a `Polyline` is tapped.
  final void Function() onTap;

  /// The `Color` of the line
  final Color color;

  /// Width of the polyline, used to define the width of the line segment to be drawn.
  ///
  /// The width is constant and independent of the camera's zoom level.
  /// The default value is 10.
  final int width;

  /// The 'Outline Color' of the line.
  /// The default color is black.
  final Color outlineColor;

  /// Width of the outline of the polyline.
  ///
  /// The width is constant and independent of the camera's zoom level.
  /// The default value is 0.
  final int outlineWidth;

  ///The style of the line.
  ///
  ///When false, is solid lines.
  ///When true, is dotted lines.
  ///The default value is false.
  final bool isDottedLine;

  /// The distance between the Polylines.
  final List<double> intervals;

  /// Order that the polyline is drawn
  final double zIndex;

  const Polyline({
    @required this.id,
    @required this.points,
    this.onTap,
    this.color = Colors.black,
    this.width = 10,
    this.outlineColor = Colors.black,
    this.isDottedLine = false,
    this.outlineWidth = 0,
    this.intervals = const <double>[],
    this.zIndex = 0.0,
  })  : assert(id != null),
        assert(points != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Polyline typedOther = other;
    return id == typedOther.id &&
        points == typedOther.points &&
        onTap == typedOther.onTap &&
        color == typedOther.color &&
        width == typedOther.width &&
        outlineColor == typedOther.outlineColor &&
        isDottedLine == typedOther.isDottedLine &&
        outlineWidth == typedOther.outlineWidth &&
        intervals == typedOther.intervals &&
        zIndex == typedOther.zIndex;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      points.hashCode ^
      onTap.hashCode ^
      color.hashCode ^
      width.hashCode ^
      outlineColor.hashCode ^
      isDottedLine.hashCode ^
      outlineWidth.hashCode ^
      intervals.hashCode ^
      zIndex.hashCode;
}
