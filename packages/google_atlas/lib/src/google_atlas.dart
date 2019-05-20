import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

class GoogleAtlas extends Provider {
  @override
  Widget build({
    @required CameraPosition initialCameraPosition,
    @required Set<Marker> markers,
  }) {
    return GoogleMaps.GoogleMap(
      mapType: GoogleMaps.MapType.normal,
      initialCameraPosition: _toGoogleCameraPosition(initialCameraPosition),
      markers: markers.map((m) => _toGoogleMapsMarker(m)).toSet(),
    );
  }

  GoogleMaps.CameraPosition _toGoogleCameraPosition(
    CameraPosition cameraPosition,
  ) {
    return GoogleMaps.CameraPosition(
      target: GoogleMaps.LatLng(
        cameraPosition.target.latitude,
        cameraPosition.target.longitude,
      ),
      zoom: cameraPosition.zoom,
    );
  }

  GoogleMaps.Marker _toGoogleMapsMarker(Marker marker) {
    return GoogleMaps.Marker(
      markerId: GoogleMaps.MarkerId(marker.id),
      position: GoogleMaps.LatLng(
        marker.position.latitude,
        marker.position.longitude,
      ),
      onTap: marker.onTap,
    );
  }
}
