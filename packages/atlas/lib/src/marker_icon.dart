import 'package:meta/meta.dart';

/// Optional Marker icon.
class MarkerIcon {
  /// The [assetName] argument must not be null. It should name the main asset
  /// from the set of images to choose from. File should be of type png
  final String assetName;

  const MarkerIcon({
    @required this.assetName,
  }) : assert(assetName != null);
}
