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
  Set<MapType> get supportedMapTypes => {
        MapType.normal,
        MapType.satellite,
        MapType.terrain,
      };

  @override
  Widget build({
    @required CameraPosition initialCameraPosition,
    @required Set<Marker> markers,
    @required Set<Circle> circles,
    @required Set<Polygon> polygons,
    @required Set<Polyline> polylines,
    @required bool showMyLocation,
    @required bool showMyLocationButton,
    @required MapType mapType,
    @required bool showTraffic,
    ArgumentCallback<LatLng> onTap,
    ArgumentCallback<LatLng> onLongPress,
    ArgumentCallback<LatLng> onLocationChanged,
    ArgumentCallback<AtlasController> onMapCreated,
    ArgumentCallback<CameraPosition> onCameraPositionChanged,
  }) {
    return GoogleMapsProvider(
      initialCameraPosition: initialCameraPosition,
      markers: markers,
      showMyLocation: showMyLocation,
      showMyLocationButton: showMyLocationButton,
      mapType: mapType,
      showTraffic: showTraffic,
      onTap: onTap,
      onLongPress: onLongPress,
      onMapCreated: onMapCreated,
    );
  }
}

class GoogleMapsProvider extends StatefulWidget {
  final CameraPosition initialCameraPosition;
  final Set<Marker> markers;
  final bool showMyLocation;
  final bool showMyLocationButton;
  final MapType mapType;
  final bool showTraffic;
  final ArgumentCallback<LatLng> onTap;
  final ArgumentCallback<LatLng> onLongPress;
  final ArgumentCallback<AtlasController> onMapCreated;

  GoogleMapsProvider({
    @required this.initialCameraPosition,
    @required this.markers,
    @required this.showMyLocation,
    @required this.showMyLocationButton,
    @required this.mapType,
    @required this.showTraffic,
    this.onTap,
    this.onLongPress,
    this.onMapCreated,
  });

  State<GoogleMapsProvider> createState() => _GoogleMapsProviderState();
}

class _GoogleMapsProviderState extends State<GoogleMapsProvider> {
  CameraPosition get initialCameraPosition => widget.initialCameraPosition;
  Set<Marker> get markers => widget.markers;
  bool get showMyLocation => widget.showMyLocation;
  bool get showMyLocationButton => widget.showMyLocationButton;
  MapType get mapType => widget.mapType;
  bool get showTraffic => widget.showTraffic;
  ArgumentCallback<LatLng> get onTap => widget.onTap;
  ArgumentCallback<LatLng> get onLongPress => widget.onLongPress;
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
          mapType: _toGoogleMapType(mapType),
          trafficEnabled: showTraffic,
          initialCameraPosition:
              CameraUtils.toGoogleCameraPosition(initialCameraPosition),
          markers: snapshot.hasError ? Set<GoogleMaps.Marker>() : snapshot.data,
          onTap: _toGoogleOnTap(onTap),
          onLongPress: _toGoogleOnLongPress(onLongPress),
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

  /// Converts a `GoogleMaps.onLongPress` to an `Atlas.onLongPress` callback.
  void Function(GoogleMaps.LatLng) _toGoogleOnLongPress(
    ArgumentCallback<LatLng> onLongPress,
  ) {
    return (GoogleMaps.LatLng position) {
      onLongPress?.call(LatLngUtils.fromGoogleLatLng(position));
    };
  }

  /// Converts an `Atlas.MapType` enum to a `GoogleMaps.MapType` enum.
  GoogleMaps.MapType _toGoogleMapType(MapType atlasMapType) {
    switch (atlasMapType) {
      case MapType.normal:
        return GoogleMaps.MapType.normal;
        break;
      case MapType.satellite:
        return GoogleMaps.MapType.satellite;
        break;
      case MapType.hybrid:
        return GoogleMaps.MapType.hybrid;
        break;
      case MapType.terrain:
        return GoogleMaps.MapType.terrain;
        break;
      default:
        return GoogleMaps.MapType.normal;
    }
  }

  /// Callback method where GoogleMaps passes the map controller
  void _onMapCreated(GoogleMaps.GoogleMapController controller) async {
    onMapCreated?.call(
      GoogleAtlasController(controller: controller),
    );
  }
}
