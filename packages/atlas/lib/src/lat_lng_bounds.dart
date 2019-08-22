import 'package:atlas/atlas.dart';
import 'package:meta/meta.dart';

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

  LatLngBounds({@required this.northeast, @required this.southwest})
      : assert(northeast != null),
        assert(southwest != null);
}
