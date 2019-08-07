import 'package:meta/meta.dart';

/// Optional Marker icon.
class MarkerIcon {
  /// The [assetName] argument must not be null. It should name the main asset
  /// from the set of images to choose from. File should be of type png
  final String assetName;

  /// The device pixel ratio where the image will be shown
  final double devicePixelRatio;

  const MarkerIcon({
    @required this.assetName,
    @required this.devicePixelRatio,
  })  : assert(assetName != null),
        assert(devicePixelRatio != null);
}
