import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';

class DeviceLocation {
  final LatLng target;
  final double accuracy;

  const DeviceLocation({
    @required this.target,
    this.accuracy = 0.0,
  }) : assert(target != null);
}
