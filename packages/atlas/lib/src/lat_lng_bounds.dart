import 'package:atlas/atlas.dart';

/// A latitude/longitude aligned rectangle.
///
/// The rectangle conceptually includes all points (lat, lng) where
/// * lat ∈ [`southwest.latitude`, `northeast.latitude`]
/// * lng ∈ [`southwest.longitude`, `northeast.longitude`],
///   if `southwest.longitude` ≤ `northeast.longitude`,
/// * lng ∈ [-180, `northeast.longitude`] ∪ [`southwest.longitude`, 180[,
///   if `northeast.longitude` < `southwest.longitude`
class LatLngBounds {
  final LatLng northeast;
  final LatLng southwest;

  const LatLngBounds({
    required this.northeast,
    required this.southwest,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is LatLngBounds) {
      return northeast == other.northeast && southwest == other.southwest;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => northeast.hashCode ^ southwest.hashCode;
}
