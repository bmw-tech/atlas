import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';

class DeviceLocation {
  final LatLng? target;
  final double? accuracy;
  final double? altitude;

  const DeviceLocation({
    @required this.target,
    this.accuracy = 0.0,
    this.altitude = 0.0,
  }) : assert(target != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final DeviceLocation typedOther = other is DeviceLocation
        ? other
        : DeviceLocation(
            target: LatLng(
              latitude: 0,
              longitude: 0,
            ),
          );
    return runtimeType == typedOther.runtimeType &&
        target == typedOther.target &&
        accuracy == typedOther.accuracy &&
        altitude == typedOther.altitude;
  }

  @override
  int get hashCode => target.hashCode ^ accuracy.hashCode ^ altitude.hashCode;
}
