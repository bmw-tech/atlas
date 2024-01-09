import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

/// A `Polyline` made up of multiple points on the map
class Polyline extends Equatable {
  /// Uniquely identifies a `Polyline`.
  final String id;

  /// A `List` of `LatLng` points that make up the polyline's shape.
  final List<LatLng> points;

  /// A `void Function` which is called whenever a `Polyline` is tapped.
  final void Function()? onTap;

  /// The `Color` of the line
  final Color? color;

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

  /// Types of Congestion Levels
  final CongestionLevel? congestionLevel;

  const Polyline({
    required this.id,
    required this.points,
    this.onTap,
    this.color = Colors.black,
    this.width = 10,
    this.outlineColor = Colors.black,
    this.isDottedLine = false,
    this.outlineWidth = 0,
    this.intervals = const <double>[],
    this.zIndex = 0.0,
    this.congestionLevel,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is Polyline) {
      return id == other.id &&
          listEquals(other.points, points) &&
          onTap == other.onTap &&
          color == other.color &&
          width == other.width &&
          outlineColor == other.outlineColor &&
          isDottedLine == other.isDottedLine &&
          outlineWidth == other.outlineWidth &&
          intervals == other.intervals &&
          zIndex == other.zIndex &&
          congestionLevel == other.congestionLevel;
    } else {
      return false;
    }
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
      zIndex.hashCode ^
      congestionLevel.hashCode;

  @override
  List<Object?> get props => [
        id,
        points,
        onTap,
        color,
        width,
        outlineColor,
        isDottedLine,
        outlineWidth,
        intervals,
        zIndex,
        congestionLevel,
      ];

  @override
  bool get stringify => true;
}
