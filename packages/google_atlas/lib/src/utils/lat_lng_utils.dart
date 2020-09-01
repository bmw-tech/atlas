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

  /// Converts an `Atlas.ScreenCoordinates` to a `GoogleMaps.ScreenCoordinate`.
  static GoogleMaps.ScreenCoordinate toGoogleScreenCoordinate(
      ScreenCoordinates atlasCoordinates) {
    return GoogleMaps.ScreenCoordinate(
      x: atlasCoordinates.x,
      y: atlasCoordinates.y,
    );
  }

  /// Converts a `GoogleMaps.ScreenCoordinate` to an `Atlas.ScreenCoordinates`.
  static ScreenCoordinates fromGoogleScreenCoordinate(
      GoogleMaps.ScreenCoordinate googleCoordinate) {
    return ScreenCoordinates(
      x: googleCoordinate.x,
      y: googleCoordinate.y,
    );
  }

  static LatLngBounds fromGoogleLatLngBounds(
      GoogleMaps.LatLngBounds googleLatLngBounds) {
    return LatLngBounds(
      northeast: LatLngUtils.fromGoogleLatLng(
        googleLatLngBounds.northeast,
      ),
      southwest: LatLngUtils.fromGoogleLatLng(
        googleLatLngBounds.southwest,
      ),
    );
  }
}
