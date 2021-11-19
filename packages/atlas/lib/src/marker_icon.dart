import 'dart:typed_data';

/// Optional Marker icon.
class MarkerIcon {
  /// The [assetName] argument must not be null if [assetBytes] is null. It should name the main asset
  /// from the set of images to choose from. File should be of type png
  final String? assetName;

  /// The [assetBytes] argument must not be null if [assetName] is null.
  /// File should be of type png
  final Uint8List? assetBytes;

  /// The [width] argument is optional. It is the desired width in pixels.
  final int width;

  /// The [height] argument is optional. It is the desired height in pixels.
  final int height;

  const MarkerIcon({
    this.assetName,
    this.assetBytes,
    this.width = 0,
    this.height = 0,
  }) : assert(assetName != null || assetBytes != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is MarkerIcon) {
      return assetName == other.assetName &&
          width == other.width &&
          height == other.height &&
          assetBytes == other.assetBytes;
    } else {
      return false;
    }
  }

  @override
  int get hashCode =>
      assetName.hashCode ^
      width.hashCode ^
      height.hashCode ^
      assetBytes.hashCode;
}
