import 'package:flutter/foundation.dart';

/// A pair of x and y coordinates.
/// The `x` and `y` coordinates are stored as screen pixels (not display pixels)
/// relative to the top of the map, not top left of the whole screen.
class ScreenCoordinate {
  /// The x coordinate in screen pixels.
  final int x;

  /// The y coordinate in screen pixels.
  final int y;

  const ScreenCoordinate({
    @required this.x,
    @required this.y,
  });

  @override
  bool operator ==(Object o) {
    return o is ScreenCoordinate && o.x == x && o.y == y;
  }

  @override
  int get hashcode => runtimeType.hashCode ^ x.hashCode ^ y.hashCode;
}
