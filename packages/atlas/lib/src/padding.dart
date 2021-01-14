class Padding {
  /// Default padding to be applied to all sides
  final double defaultPadding;

  /// Top Padding
  final double topPadding;

  /// Bottom Padding
  final double bottomPadding;

  /// Right Padding
  final double rightPadding;

  /// Left Padding
  final double leftPadding;

  Padding({
    this.defaultPadding,
    this.topPadding,
    this.bottomPadding,
    this.rightPadding,
    this.leftPadding,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Padding &&
          runtimeType == other.runtimeType &&
          defaultPadding == other.defaultPadding &&
          topPadding == other.topPadding &&
          bottomPadding == other.bottomPadding &&
          rightPadding == other.rightPadding &&
          leftPadding == other.leftPadding;

  @override
  int get hashCode =>
      defaultPadding.hashCode ^
      topPadding.hashCode ^
      bottomPadding.hashCode ^
      rightPadding.hashCode ^
      leftPadding.hashCode;
}
