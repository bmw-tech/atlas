import 'package:atlas/atlas.dart';

enum PositionIndicatorStyle {
  pedestrian,
  navigator,
}

extension PositionIndicatorMarker on PositionIndicatorStyle {
  int styleToInt() {
    switch (this) {
      case PositionIndicatorStyle.pedestrian:
        return 0;
      case PositionIndicatorStyle.navigator:
        return 1;
      default:
        return 0;
    }
  }
}

class PositionIndicator {
  //Set the type of indicator, it can be navigator or pedestrian
  final PositionIndicatorStyle style;
  //Set whether the indicator will be displayed as disable or enable
  final bool isActive;
  //Responsible for defining, in degrees, where the indicator is pointing.
  //Min 0 and Max 360
  final double orientationDegrees;
  //Coordinates of the indicator
  final LatLng coordinates;

  PositionIndicator({
    required this.style,
    required this.coordinates,
    required this.isActive,
    required this.orientationDegrees,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is PositionIndicator) {
      return other.isActive == isActive &&
          other.coordinates == coordinates &&
          other.orientationDegrees == orientationDegrees &&
          other.style == style;
    } else {
      return true;
    }
  }

  @override
  int get hashCode => style.hashCode ^ coordinates.hashCode ^ orientationDegrees.hashCode ^ isActive.hashCode;
}
