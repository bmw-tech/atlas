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
    if (identical(this, o)) return true;
    if (o.runtimeType != runtimeType) return false;
    final ScreenCoordinate typedOther = o;
    return x == typedOther.x && y == typedOther.y;
  }

  @override
  int get hashCode => runtimeType.hashCode ^ x.hashCode ^ y.hashCode;
}
