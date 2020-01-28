import 'package:flutter/foundation.dart';
import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

class Polyline {
  /// Uniquely identifies a `Polyline`.
  final String id;

  final List<LatLng> points;

  final Color color;

  final int width;

  const Polyline({
    @required this.id,
    @required this.points,
    this.color = Colors.black,
    this.width = 5,
  })  : assert(id != null),
        assert(points != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Polyline typedOther = other;
    return id == typedOther.id &&
        points == typedOther.points &&
        color == typedOther.color &&
        width == typedOther.width;
  }

  @override
  int get hashCode => id.hashCode ^ points.hashCode ^ color.hashCode ^ width.hashCode;
}
