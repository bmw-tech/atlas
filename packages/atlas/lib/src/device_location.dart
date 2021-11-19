import 'package:atlas/atlas.dart';

class DeviceLocation {
  final LatLng target;
  final double? accuracy;
  final double altitude;

  const DeviceLocation({
    required this.target,
    this.accuracy = 0.0,
    this.altitude = 0.0,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is DeviceLocation) {
      return target == other.target &&
          accuracy == other.accuracy &&
          altitude == other.altitude;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => target.hashCode ^ accuracy.hashCode ^ altitude.hashCode;
}
