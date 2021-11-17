/// A pair of x and y coordinates.
/// The `x` and `y` coordinates are stored as screen pixels (not display pixels)
/// relative to the top of the map, not top left of the whole screen.
class ScreenCoordinates {
  /// The x coordinate in screen pixels.
  final int x;

  /// The y coordinate in screen pixels.
  final int y;

  const ScreenCoordinates({
    required this.x,
    required this.y,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is ScreenCoordinates) {
      return x == other.x && y == other.y;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
