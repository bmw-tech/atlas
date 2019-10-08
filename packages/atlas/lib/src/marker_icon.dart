import 'package:flutter/foundation.dart';

/// Optional Marker icon.
class MarkerIcon {
  /// The [assetName] argument must not be null. It should name the main asset
  /// from the set of images to choose from. File should be of type png
  final String assetName;

  const MarkerIcon({
    @required this.assetName,
  }) : assert(assetName != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final MarkerIcon typedOther = other;
    return assetName == typedOther.assetName;
  }

  @override
  int get hashCode => runtimeType.hashCode ^ assetName.hashCode;
}
