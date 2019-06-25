import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

/// `Atlas` Provider for Google Maps
class GoogleAtlas extends Provider {
  @override
  Widget build({
    @required CameraPosition cameraPosition,
    @required Set<Marker> markers,
    @required bool showMyLocation,
    @required bool showMyLocationButton,
    ArgumentCallback<LatLng> onTap,
  }) {
    return GoogleMapsProvider(
      cameraPosition: cameraPosition,
      markers: markers,
      showMyLocation: showMyLocation,
      showMyLocationButton: showMyLocationButton,
      onTap: onTap,
    );
  }
}

class GoogleMapsProvider extends StatefulWidget {
  final CameraPosition cameraPosition;
  final Set<Marker> markers;
  final bool showMyLocation;
  final bool showMyLocationButton;
  final ArgumentCallback<LatLng> onTap;

  GoogleMapsProvider({
    @required this.cameraPosition,
    @required this.markers,
    @required this.showMyLocation,
    @required this.showMyLocationButton,
    this.onTap,
  });

  State<GoogleMapsProvider> createState() => _GoogleMapsProviderState();
}

class _GoogleMapsProviderState extends State<GoogleMapsProvider> {
  CameraPosition get cameraPosition => widget.cameraPosition;
  CameraPosition currentPosition;
  Set<Marker> get markers => widget.markers;
  bool get showMyLocation => widget.showMyLocation;
  bool get showMyLocationButton => widget.showMyLocationButton;
  ArgumentCallback<LatLng> get onTap => widget.onTap;
  GoogleMaps.GoogleMapController mapController;

  void initState() {
    super.initState();
    currentPosition = CameraPosition(
      target: LatLng(latitude: 0.0, longitude: 0.0),
      zoom: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    _onPositionUpdate();

    return GoogleMaps.GoogleMap(
      key: Key("GoogleMap"),
      myLocationEnabled: showMyLocation,
      myLocationButtonEnabled: showMyLocationButton,
      mapType: GoogleMaps.MapType.normal,
      initialCameraPosition: _toGoogleCameraPosition(cameraPosition),
      markers: this.markers.map((m) => _toGoogleMarker(m)).toSet(),
      onTap: _toGoogleOnTap(onTap),
      onMapCreated: _onMapCreated,
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

  /// Callback method where GoogleMaps passes the map controller
  void _onMapCreated(GoogleMaps.GoogleMapController controller) {
    mapController = controller;
  }

  /// If widget position has changed, then update the current position
  /// and move the camera.
  void _onPositionUpdate() {
    if (mapController != null && currentPosition != widget.cameraPosition) {
      currentPosition = widget.cameraPosition;
      mapController.moveCamera(
        GoogleMaps.CameraUpdate.newCameraPosition(
          _toGoogleCameraPosition(currentPosition),
        ),
      );
    }
  }
}
