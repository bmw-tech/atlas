/// Produces continuous, smooth results by interpolating between pairs of input and output value

sealed class HeatcolorInterpolation {
  String toProperty();
}

class LinearInterpolation extends HeatcolorInterpolation {
  @override
  String toProperty() => '["linear"]';
}

class ExponentialInterpolation extends HeatcolorInterpolation {
  final double base;
  ExponentialInterpolation(this.base);
  @override
  String toProperty() => '["exponential", $base]';
}

class CubitInterpolation extends HeatcolorInterpolation {
  final double x1;
  final double y1;
  final double x2;
  final double y2;
  CubitInterpolation(this.x1, this.y1, this.x2, this.y2);
  @override
  String toProperty() => '["cubic-bezier"], $x1, $y1, $x2, $y2]';
}
