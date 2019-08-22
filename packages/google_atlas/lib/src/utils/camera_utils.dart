import 'package:atlas/atlas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

class CameraUtils {
  /// Converts an `Atlas.LatLng` to a `GoogleMaps.CameraPosition`
  static GoogleMaps.CameraPosition toGoogleCameraPosition(
    CameraPosition position,
  ) {
    return GoogleMaps.CameraPosition(
      target: GoogleMaps.LatLng(
        position.target.latitude,
        position.target.longitude,
      ),
      zoom: position.zoom,
    );
  }
}
