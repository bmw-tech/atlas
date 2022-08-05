import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:atlas/atlas.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
     CameraPosition? initialCameraPosition,
     Set<Marker>? markers,
     Set<Circle>? circles,
     Set<Polygon>? polygons,
     Set<Polyline>? polylines,
     Set<Callout>? callouts,
     ArgumentCallback<LatLng>? onTap,
     ArgumentCallback<Poi>? onPoiTap,
     ArgumentCallback<LatLng>? onLongPress,
     ArgumentCallback<AtlasController>? onMapCreated,
     ArgumentCallback<CameraPosition>? onCameraPositionChanged,
     ArgumentCallback<LatLng>? onLocationChanged,
     VoidCallback? onPan,
     bool? showMyLocation,
     bool? showMyLocationButton,
     bool? followMyLocation,
     MapType? mapType,
     bool? showTraffic,
     MapLanguage? mapLanguage,
     DeviceLocation? deviceLocation,
     String? deviceLocationIconAsset,
     String? country,
     Set<Cluster>? clusters,
  }) {
    return GoogleMapsProvider(
      initialCameraPosition: initialCameraPosition!,
      onTap: onTap,
      onLongPress: onLongPress,
      markers: markers!,
      polygons: polygons!,
      polylines: polylines,
      circles: circles,
      callouts: callouts,
      showMyLocation: showMyLocation!,
      showMyLocationButton: showMyLocationButton!,
      onCameraPositionChanged: onCameraPositionChanged,
      onMapCreated: onMapCreated,
      mapType: mapType!,
      showTraffic: showTraffic!,
      mapLanguage: mapLanguage,
      onPan: onPan,
      deviceLocation: deviceLocation,
      deviceLocationIconAsset: deviceLocationIconAsset,
      country: country,
    );
  }

  /// This method enables/disables the decoding of an asset image
  /// into a byte array. Only for testing purposes.
  @visibleForTesting
  static void setGetBytesFromAssetEnabled(bool enabled) {
    _getBytesFromAssetEnabled = enabled;
  }
}

class GoogleMapsProvider extends StatefulWidget {
  final CameraPosition initialCameraPosition;
  final ArgumentCallback<LatLng>? onTap;
  final ArgumentCallback<Poi>? onPoiTap;
  final ArgumentCallback<LatLng>? onLongPress;
  final ArgumentCallback<CameraPosition>? onCameraPositionChanged;
  final VoidCallback? onPan;
  final Set<Marker> markers;
  final Set<Polyline>? polylines;
  final Set<Polygon> polygons;
  final Set<Circle>? circles;
  final Set<Callout>? callouts;
  final bool showMyLocation;
  final bool showMyLocationButton;
  final MapType mapType;
  final bool showTraffic;
  final MapLanguage? mapLanguage;
  final DeviceLocation? deviceLocation;
  final String? deviceLocationIconAsset;
  final String? country;

  final ArgumentCallback<AtlasController>? onMapCreated;

  GoogleMapsProvider({
    required this.initialCameraPosition,
    required this.markers,
    required this.polygons,
    required this.showMyLocation,
    required this.showMyLocationButton,
    required this.mapType,
    required this.showTraffic,
    this.circles,
    this.polylines,
    this.callouts,
    this.onCameraPositionChanged,
    this.onMapCreated,
    this.onLongPress,
    this.onPoiTap,
    this.onTap,
    this.onPan,
    this.mapLanguage,
    this.deviceLocation,
    this.deviceLocationIconAsset,
    this.country,
  });

  State<GoogleMapsProvider> createState() => _GoogleMapsProviderState();
}

bool _getBytesFromAssetEnabled = true;

class _GoogleMapsProviderState extends State<GoogleMapsProvider> {
  CameraPosition get initialCameraPosition => widget.initialCameraPosition;
  ArgumentCallback<LatLng>? get onTap => widget.onTap;
  ArgumentCallback<AtlasController>? get onMapCreated => widget.onMapCreated;
  ArgumentCallback<LatLng>? get onLongPress => widget.onLongPress;
  ArgumentCallback<CameraPosition>? get onCameraPositionChanged =>
      widget.onCameraPositionChanged;

  Set<Marker> get markers => widget.markers;

  bool get showMyLocation => widget.showMyLocation;
  bool get showMyLocationButton => widget.showMyLocationButton;
  MapType get mapType => widget.mapType;
  bool get showTraffic => widget.showTraffic;

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
          markers: snapshot.hasError ? Set<GoogleMaps.Marker>() : snapshot.data ?? Set<GoogleMaps.Marker>(),
          onTap: _toGoogleOnTap(onTap ?? (LatLng) {}),
          onLongPress: _toGoogleOnLongPress(onLongPress ?? (LatLng) {}),
          onMapCreated: _onMapCreated,
          onCameraMove: _onCameraMove,
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
              ? GoogleMaps.BitmapDescriptor.defaultMarker
              : await _toBitmapDescriptor(marker.icon!),
        ),
      );
    }
    return googleMarkers;
  }

  /// Converts an `Atlas.MapIcon` to an `GoogleMaps.BitmapDescriptor`
  Future<GoogleMaps.BitmapDescriptor> _toBitmapDescriptor(
    MarkerIcon markerIcon,
  ) async {
    GoogleMaps.BitmapDescriptor? bitmapDescriptor;
    try {
      bitmapDescriptor = GoogleMaps.BitmapDescriptor.fromBytes(
        await _getBytesFromAsset(
          markerIcon.assetName!,
          _getIconWidth(markerIcon.width),
        ),
      );
    } catch (_) {}
    return bitmapDescriptor ?? GoogleMaps.BitmapDescriptor.defaultMarker;
  }

  /// Returns the icon width in pixels according the device screen.
  int _getIconWidth(int width) {
    return (width > 0)
        ? (width * ui.window.devicePixelRatio).round()
        : _getDefaultIconWidth();
  }

  /// Returns the default icon width in pixels according the device screen.
  int _getDefaultIconWidth() {
    final dpr = ui.window.devicePixelRatio;
    final size = dpr * 80;
    return size.round();
  }

  /// Reads the [asset] file and returns an `Uint8List` byte array.
  Future<Uint8List> _getBytesFromAsset(String path, int width) async {
    if (_getBytesFromAssetEnabled) {
      final data = await rootBundle.load(path);
      final codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(),
        targetWidth: width,
      );
      final fi = await codec.getNextFrame();
      return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
          !.buffer
          .asUint8List();
    } else {
      return Uint8List(0);
    }
  }

  /// Converts a `GoogleMaps.onTap` to an `Atlas.onTap` callback.
  void Function(GoogleMaps.LatLng) _toGoogleOnTap(
    ArgumentCallback<LatLng> onTap,
  ) {
    return (GoogleMaps.LatLng position) {
      onTap.call(LatLngUtils.fromGoogleLatLng(position));
    };
  }

  /// Converts a `GoogleMaps.onLongPress` to an `Atlas.onLongPress` callback.
  void Function(GoogleMaps.LatLng) _toGoogleOnLongPress(
    ArgumentCallback<LatLng> onLongPress,
  ) {
    return (GoogleMaps.LatLng position) {
      onLongPress.call(LatLngUtils.fromGoogleLatLng(position));
    };
  }

  /// Converts an `Atlas.MapType` enum to a `GoogleMaps.MapType` enum.
  GoogleMaps.MapType _toGoogleMapType(MapType atlasMapType) {
    switch (atlasMapType) {
      case MapType.normal:
        return GoogleMaps.MapType.normal;
      case MapType.satellite:
        return GoogleMaps.MapType.satellite;
      case MapType.hybrid:
        return GoogleMaps.MapType.hybrid;
      case MapType.terrain:
        return GoogleMaps.MapType.terrain;
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

  /// Callback method when camera moves
  void _onCameraMove(GoogleMaps.CameraPosition cameraPosition) {
    onCameraPositionChanged?.call(
      CameraUtils.toAtlasCameraPosition(cameraPosition),
    );
  }
}
