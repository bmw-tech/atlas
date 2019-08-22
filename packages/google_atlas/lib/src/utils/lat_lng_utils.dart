import 'package:atlas/atlas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

class LatLngUtils {
  static GoogleMaps.LatLngBounds toGoogleLatLngBounds(LatLngBounds bounds) {
    return GoogleMaps.LatLngBounds(
      northeast: LatLngUtils.toGoogleLatLng(bounds.northeast),
      southwest: LatLngUtils.toGoogleLatLng(bounds.southwest),
    );
  }

  static GoogleMaps.LatLng toGoogleLatLng(LatLng latLng) {
    return GoogleMaps.LatLng(latLng.latitude, latLng.longitude);
  }

  /// Converts a `GoogleMaps.LatLng` to an `Atlas.LatLng`.
  static LatLng fromGoogleLatLng(GoogleMaps.LatLng position) {
    return LatLng(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
