import 'package:meta/meta.dart';

/// Optional Marker icon.
class MapIcon {
  /// The [assetName] argument must not be null. It should name the main asset
  /// from the set of images to choose from.
  final String assetName;

  const MapIcon({
    @required this.assetName,
  }) : assert(assetName != null);
}
