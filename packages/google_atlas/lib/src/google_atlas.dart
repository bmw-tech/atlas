import 'dart:async';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';
import 'package:google_atlas/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

/// `Atlas` Provider for Google Maps
class GoogleAtlas extends Provider {
  @override
  Widget build({
    @required LatLng position,
    @required Set<Marker> markers,
    @required bool showMyLocation,
    @required bool showMyLocationButton,
    ArgumentCallback<LatLng> onTap,
  }) {
    return GoogleMapsProvider(
      position: position,
      markers: markers,
      showMyLocation: showMyLocation,
      showMyLocationButton: showMyLocationButton,
      onTap: onTap,
    );
  }
}

class GoogleMapsProvider extends StatefulWidget {
  final LatLng position;
  final Set<Marker> markers;
  final bool showMyLocation;
  final bool showMyLocationButton;
  final ArgumentCallback<LatLng> onTap;

  GoogleMapsProvider({
    @required this.position,
    @required this.markers,
    @required this.showMyLocation,
    @required this.showMyLocationButton,
    this.onTap,
  });

  State<GoogleMapsProvider> createState() => _GoogleMapsProviderState();
}

class _GoogleMapsProviderState extends State<GoogleMapsProvider> {
  LatLng get position => widget.position;
  Set<Marker> get markers => widget.markers;
  bool get showMyLocation => widget.showMyLocation;
  bool get showMyLocationButton => widget.showMyLocationButton;
  ArgumentCallback<LatLng> get onTap => widget.onTap;
  Set<Marker> _markers = Set.from([]);
  GoogleMaps.GoogleMapController _mapController;
  LatLng _position;

  @override
  void initState() {
    super.initState();
    _position = position;
  }

  @override
  Widget build(BuildContext context) {
    _onPositionUpdate();

    return FutureBuilder<Set<GoogleMaps.Marker>>(
      future: _toGoogleMarkers(markers),
      initialData: Set<GoogleMaps.Marker>(),
      builder: (
        BuildContext context,
        AsyncSnapshot<Set<GoogleMaps.Marker>> snapshot,
      ) {
        return GoogleMaps.GoogleMap(
          myLocationEnabled: showMyLocation,
          myLocationButtonEnabled: showMyLocationButton,
          mapType: GoogleMaps.MapType.normal,
          initialCameraPosition: _toGoogleCameraPosition(position),
          markers: snapshot.hasError ? Set<GoogleMaps.Marker>() : snapshot.data,
          onTap: _toGoogleOnTap(onTap),
          onMapCreated: _onMapCreated,
        );
      },
    );
  }

  /// Converts an `Atlas.LatLng` to a `GoogleMaps.CameraPosition`
  GoogleMaps.CameraPosition _toGoogleCameraPosition(
    LatLng position,
  ) {
    return GoogleMaps.CameraPosition(
      target: GoogleMaps.LatLng(
        position.latitude,
        position.longitude,
      ),
      zoom: 15,
    );
  }

  /// Converts an `Atlas.Markers` set to a `GoogleMaps.CameraUpdate`
  GoogleMaps.CameraUpdate _toGoogleCameraUpdate(
    LatLng position,
    Set<Marker> markers,
  ) {
    if (markers.isEmpty || _markers.containsAll(markers)) {
      return GoogleMaps.CameraUpdate.newLatLng(
        GoogleMaps.LatLng(
          position.latitude,
          position.longitude,
        ),
      );
    }
    _markers = markers;

    GoogleMaps.LatLngBounds latLngBounds =
        LatLngBoundsUtils.mapMarkersToLatLngBounds(markers);

    return GoogleMaps.CameraUpdate.newLatLngBounds(
      LatLngBoundsUtils.newLatLngBoundsFromPosition(latLngBounds, position),
      20,
    );
  }

  /// Converts an `Atlas.Marker` to a `GoogleMaps.Marker`
  Future<Set<GoogleMaps.Marker>> _toGoogleMarkers(Set<Marker> markers) async {
    Set<GoogleMaps.Marker> googleMarkers = Set();

    for (Marker marker in markers) {
      googleMarkers.add(
        GoogleMaps.Marker(
          markerId: GoogleMaps.MarkerId(marker.id),
          position: GoogleMaps.LatLng(
            marker.position.latitude,
            marker.position.longitude,
          ),
          onTap: marker.onTap,
          icon: marker.icon == null
              ? null
              : await _toBitmapDescriptor(marker.icon),
        ),
      );
    }
    return googleMarkers;
  }

  /// Converts an `Atlas.MapIcon` to an `GoogleMaps.BitmapDescriptor`
  Future<GoogleMaps.BitmapDescriptor> _toBitmapDescriptor(
    MarkerIcon markerIcon,
  ) async {
    final ImageConfiguration imageConfiguration = ImageConfiguration(
      devicePixelRatio: window.devicePixelRatio,
    );
    GoogleMaps.BitmapDescriptor bitmapDescriptor;
    try {
      bitmapDescriptor = await GoogleMaps.BitmapDescriptor.fromAssetImage(
        imageConfiguration,
        markerIcon.assetName,
      );
    } catch (_) {}
    return bitmapDescriptor;
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
  void _onMapCreated(GoogleMaps.GoogleMapController controller) async {
    _mapController = controller;
    // Need to wait one tick before calling move camera
    // https://github.com/flutter/flutter/issues/37185
    await Future<void>.delayed(Duration(seconds: 0));
    await _mapController.moveCamera(
      GoogleMaps.CameraUpdate.zoomTo(12),
    );
    await _mapController.moveCamera(
      _toGoogleCameraUpdate(position, markers),
    );
  }

  /// If widget position has changed, then update the current position
  /// and move the camera.
  void _onPositionUpdate() {
    if (_position != position) {
      _mapController?.moveCamera(
        _toGoogleCameraUpdate(position, markers),
      );
      _position = position;
    }
  }
}
