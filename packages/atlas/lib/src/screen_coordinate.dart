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
  })  : assert(x != null),
        assert(y != null);
}
