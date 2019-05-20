import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

/// `Atlas` Provider for Google Maps
class GoogleAtlas extends Provider {
  @override
  Widget build({
    @required CameraPosition initialCameraPosition,
    @required Set<Marker> markers,
    ArgumentCallback<LatLng> onTap,
  }) {
    return GoogleMaps.GoogleMap(
      mapType: GoogleMaps.MapType.normal,
      initialCameraPosition: _toGoogleCameraPosition(initialCameraPosition),
      markers: markers.map((m) => _toGoogleMarker(m)).toSet(),
      onTap: _toGoogleOnTap(onTap),
    );
  }

  /// Converts an `Atlas.CameraPosition` to a `GoogleMaps.CameraPosition`
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

  /// Converts an `Atlas.Marker` to a `GoogleMaps.Marker`
  GoogleMaps.Marker _toGoogleMarker(Marker marker) {
    return GoogleMaps.Marker(
      markerId: GoogleMaps.MarkerId(marker.id),
      position: GoogleMaps.LatLng(
        marker.position.latitude,
        marker.position.longitude,
      ),
      onTap: marker.onTap,
    );
  }

  /// Converts a `GoogleMaps.onTap` to an `Atlas.onTap` callback.
  void Function(GoogleMaps.LatLng) _toGoogleOnTap(
    ArgumentCallback<LatLng> onTap,
  ) {
    return (GoogleMaps.LatLng position) {
      onTap?.call(_fromGoogleLatLng(position));
    };
  }

  /// Converts a `GoogleMaps.LatLng` to an `Atlas.LatLng`.
  LatLng _fromGoogleLatLng(GoogleMaps.LatLng position) {
    return LatLng(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
