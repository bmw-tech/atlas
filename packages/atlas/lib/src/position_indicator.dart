import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

enum PositionIndicatorStyle {
  pedestrian,
  navigator,
}

extension PositionIndicatorMarker on PositionIndicatorStyle {
  String styleToString() {
    switch (this) {
      case PositionIndicatorStyle.pedestrian:
        return "pedestrian";
      case PositionIndicatorStyle.navigator:
        return "navigator";
    }
  }
}

class PositionIndicator {
  ///Set the type of indicator, it can be navigator or pedestrian
  final PositionIndicatorStyle style;

  ///Set whether the indicator will be displayed as disable or enable
  final bool isActive;

  ///Responsible for defining, in degrees, where the indicator is pointing.
  ///Min 0 and Max 360
  final double bearingInDegrees;

  ///Coordinates of the indicator
  final LatLng latLng;

  final String? assetIndicator3D;
  final String? assetIndicatorTexture;
  final Color? indicatorColor;

  PositionIndicator({
    required this.style,
    required this.latLng,
    required this.isActive,
    required this.bearingInDegrees,
    this.assetIndicator3D,
    this.assetIndicatorTexture,
    this.indicatorColor,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is PositionIndicator) {
      return other.isActive == isActive &&
          other.latLng == latLng &&
          other.bearingInDegrees == bearingInDegrees &&
          other.style == style &&
          other.assetIndicator3D == assetIndicator3D &&
          other.assetIndicatorTexture == assetIndicatorTexture &&
          other.indicatorColor == indicatorColor;
    } else {
      return true;
    }
  }

  @override
  int get hashCode => style.hashCode ^ latLng.hashCode ^ bearingInDegrees.hashCode ^ isActive.hashCode;

  PositionIndicator copyWith({
    PositionIndicatorStyle? style,
    double? bearingInDegrees,
    LatLng? latLng,
    bool? isActive,
  }) =>
      PositionIndicator(
        style: style ?? this.style,
        latLng: latLng ?? this.latLng,
        isActive: isActive ?? this.isActive,
        bearingInDegrees: bearingInDegrees ?? this.bearingInDegrees,
      );
}
