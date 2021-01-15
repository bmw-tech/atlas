/// Represents a virtual rectangle of the screen
class Rectangle2D {
  /// Represents the X-axis coordinate of the origin point
  final double originX;

  /// Represents the Y-axis point of the origin coordinate
  final double originY;

  /// Represents the width of the rectangle
  final double width;

  /// Represents the height of the rectangle
  final double height;

  Rectangle2D({
    this.originX,
    this.originY,
    this.width,
    this.height,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Rectangle2D &&
          runtimeType == other.runtimeType &&
          originX == other.originX &&
          originY == other.originY &&
          width == other.width &&
          height == other.height;

  @override
  int get hashCode =>
      originX.hashCode ^ originY.hashCode ^ width.hashCode ^ height.hashCode;
}
