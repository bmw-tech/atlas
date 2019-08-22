import 'dart:async';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';
import 'package:google_atlas/google_atlas.dart';
import 'package:google_atlas/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

/// `Atlas` Provider for Google Maps
class GoogleAtlas extends Provider {
  @override
  Widget build({
    @required CameraPosition initialCameraPosition,
    @required Set<Marker> markers,
    @required bool showMyLocation,
    @required bool showMyLocationButton,
    ArgumentCallback<LatLng> onTap,
    ArgumentCallback<AtlasController> onMapCreated,
  }) {
    return GoogleMapsProvider(
      initialCameraPosition: initialCameraPosition,
      markers: markers,
      showMyLocation: showMyLocation,
      showMyLocationButton: showMyLocationButton,
      onTap: onTap,
      onMapCreated: onMapCreated,
    );
  }
}

class GoogleMapsProvider extends StatefulWidget {
  final CameraPosition initialCameraPosition;
  final Set<Marker> markers;
  final bool showMyLocation;
  final bool showMyLocationButton;
  final ArgumentCallback<LatLng> onTap;
  final ArgumentCallback<AtlasController> onMapCreated;

  GoogleMapsProvider({
    @required this.initialCameraPosition,
    @required this.markers,
    @required this.showMyLocation,
    @required this.showMyLocationButton,
    this.onTap,
    this.onMapCreated,
  });

  State<GoogleMapsProvider> createState() => _GoogleMapsProviderState();
}

class _GoogleMapsProviderState extends State<GoogleMapsProvider> {
  CameraPosition get initialCameraPosition => widget.initialCameraPosition;
  Set<Marker> get markers => widget.markers;
  bool get showMyLocation => widget.showMyLocation;
  bool get showMyLocationButton => widget.showMyLocationButton;
  ArgumentCallback<LatLng> get onTap => widget.onTap;
  ArgumentCallback<AtlasController> get onMapCreated => widget.onMapCreated;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Set<GoogleMaps.Marker>>(
      future: _toGoogleMarkers(markers),
      initialData: Set<GoogleMaps.Marker>(),
      builder: (context, snapshot) {
        return GoogleMaps.GoogleMap(
          myLocationEnabled: showMyLocation,
          myLocationButtonEnabled: showMyLocationButton,
          mapType: GoogleMaps.MapType.normal,
          initialCameraPosition:
              CameraUtils.toGoogleCameraPosition(initialCameraPosition),
          markers: snapshot.hasError ? Set<GoogleMaps.Marker>() : snapshot.data,
          onTap: _toGoogleOnTap(onTap),
          onMapCreated: _onMapCreated,
        );
      },
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
      onTap?.call(LatLngUtils.fromGoogleLatLng(position));
    };
  }

  /// Callback method where GoogleMaps passes the map controller
  void _onMapCreated(GoogleMaps.GoogleMapController controller) async {
    onMapCreated?.call(
      GoogleAtlasController(controller: controller),
    );
  }
}
