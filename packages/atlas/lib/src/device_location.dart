import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

class DeviceLocation {
  final LatLng target;
  final double? accuracy;
  final double altitude;

  ///Responsible for defining, in degrees, where the indicator is pointing.
  ///Min 0 and Max 360
  final double? heading;

  ///Is expected a String with the asset to file .obj. This object is a 3D model.
  final String? object3DAsset;

  ///Is expected a String with the asset to file that contains the texture of the object 3D model.
  ///This file will be responsible for setting the colors, shadow and etc...
  final String? textureAsset;

  final Color? colorOutlineIndicator;

  ///Set whether the indicator will be displayed as disable or enable
  final bool isActive;

  const DeviceLocation({
    required this.target,
    this.accuracy = 0.0,
    this.altitude = 0.0,
    this.heading = 0.0,
    this.isActive = false,
    this.object3DAsset,
    this.textureAsset,
    this.colorOutlineIndicator,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is DeviceLocation) {
      return target == other.target &&
          accuracy == other.accuracy &&
          altitude == other.altitude &&
          isActive == other.isActive &&
          object3DAsset == other.object3DAsset &&
          textureAsset == other.textureAsset &&
          colorOutlineIndicator == other.colorOutlineIndicator &&
          heading == other.heading;
    } else {
      return false;
    }
  }

  @override
  int get hashCode =>
      target.hashCode ^
      accuracy.hashCode ^
      altitude.hashCode ^
      heading.hashCode ^
      isActive.hashCode ^
      object3DAsset.hashCode ^
      colorOutlineIndicator.hashCode ^
      textureAsset.hashCode;
}
