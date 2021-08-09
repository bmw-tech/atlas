import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// `Circle` with specified center/radius on the map
class Circle {
  /// Uniquely identifies a `Circle`.
  final String? id;

  /// The location where the `Circle` is centered. Is represented as `LatLng`.
  final LatLng? center;

  /// The radius of the `Circle`.
  final double? radiusInMeters;

  /// Optional FillColor used to color the area inside the `Circle`.
  final Color? fillColor;

  /// Optional StrokeColor used to color the boundary of the `Circle`.
  final Color? strokeColor;

  /// The z-index of the `Circle`, used to determine relative drawing order of
  /// map overlays.
  ///
  /// Lower values means drawn earlier, and thus appearing to be closer to the surface of the Earth.
  final double? zIndex;

  const Circle({
    @required this.id,
    @required this.center,
    @required this.radiusInMeters,
    this.fillColor = Colors.transparent,
    this.strokeColor = Colors.black,
    this.zIndex = 0.0,
  })  : assert(id != null),
        assert(center != null),
        assert(radiusInMeters != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Circle typedOther = other is Circle
        ? other
        : Circle(
            id: "0",
            center: LatLng(latitude: 0, longitude: 0),
            radiusInMeters: 0,
          );
    return id == typedOther.id &&
        center == typedOther.center &&
        radiusInMeters == typedOther.radiusInMeters &&
        fillColor == typedOther.fillColor &&
        strokeColor == typedOther.strokeColor &&
        zIndex == typedOther.zIndex;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      center.hashCode ^
      radiusInMeters.hashCode ^
      fillColor.hashCode ^
      strokeColor.hashCode ^
      zIndex.hashCode;
}
