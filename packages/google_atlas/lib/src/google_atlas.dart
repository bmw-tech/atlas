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
    @required Set<Circle> circles,
    @required bool showMyLocation,
    @required bool showMyLocationButton,
    ArgumentCallback<LatLng> onTap,
    ArgumentCallback<LatLng> onLongPress,
    ArgumentCallback<AtlasController> onMapCreated,
  }) {
    return GoogleMapsProvider(
      initialCameraPosition: initialCameraPosition,
      markers: markers,
      circles: circles,
      showMyLocation: showMyLocation,
      showMyLocationButton: showMyLocationButton,
      onTap: onTap,
      onLongPress: onLongPress,
      onMapCreated: onMapCreated,
    );
  }
}

class GoogleMapsProvider extends StatefulWidget {
  final CameraPosition initialCameraPosition;
  final Set<Marker> markers;
  final Set<Circle> circles;
  final bool showMyLocation;
  final bool showMyLocationButton;
  final ArgumentCallback<LatLng> onTap;
  final ArgumentCallback<LatLng> onLongPress;
  final ArgumentCallback<AtlasController> onMapCreated;

  GoogleMapsProvider({
    @required this.initialCameraPosition,
    @required this.markers,
    @required this.circles,
    @required this.showMyLocation,
    @required this.showMyLocationButton,
    this.onTap,
    this.onLongPress,
    this.onMapCreated,
  });

  State<GoogleMapsProvider> createState() => _GoogleMapsProviderState();
}

class _GoogleMapsProviderState extends State<GoogleMapsProvider> {
  CameraPosition get initialCameraPosition => widget.initialCameraPosition;
  Set<Marker> get markers => widget.markers;
  Set<Circle> get circles => widget.circles;
  bool get showMyLocation => widget.showMyLocation;
  bool get showMyLocationButton => widget.showMyLocationButton;
  ArgumentCallback<LatLng> get onTap => widget.onTap;
  ArgumentCallback<LatLng> get onLongPress => widget.onLongPress;
  ArgumentCallback<AtlasController> get onMapCreated => widget.onMapCreated;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getGoogleAtlasDrawings(),
      initialData: GoogleAtlasDrawings(),
      builder: (context, snapshot) {
        return GoogleMaps.GoogleMap(
          myLocationEnabled: showMyLocation,
          myLocationButtonEnabled: showMyLocationButton,
          mapType: GoogleMaps.MapType.normal,
          initialCameraPosition:
              CameraUtils.toGoogleCameraPosition(initialCameraPosition),
          markers: snapshot.hasError
              ? Set<GoogleMaps.Marker>()
              : snapshot.data.markers,
          circles: snapshot.hasError
              ? Set<GoogleMaps.Circle>()
              : snapshot.data.circles,
          onTap: _toGoogleOnTap(onTap),
          onLongPress: _toGoogleOnLongPress(onLongPress),
          onMapCreated: _onMapCreated,
        );
      },
    );
  }

  /// Converts an `Atlas.Marker` to a `GoogleMaps.Marker`
  Future<Set<GoogleMaps.Marker>> _toGoogleMarkers(Set<Marker> markers) async {
    final result = markers.map((Marker marker) async => GoogleMaps.Marker(
          markerId: GoogleMaps.MarkerId(marker.id),
          position: GoogleMaps.LatLng(
            marker.position.latitude,
            marker.position.longitude,
          ),
          onTap: marker.onTap,
          icon: marker.icon == null
              ? null
              : await _toBitmapDescriptor(marker.icon),
        ));

    return Future.wait(result).then((value) => value.toSet());
  }

  /// Converts an `Atlas.Circle` to a `GoogleMaps.Circle`
  Future<Set<GoogleMaps.Circle>> _toGoogleCircles(Set<Circle> circles) async {
    return circles
        .map((Circle circle) => GoogleMaps.Circle(
              circleId: GoogleMaps.CircleId(circle.id),
              center: GoogleMaps.LatLng(
                circle.center.latitude,
                circle.center.longitude,
              ),
              radius: circle.radiusInMeters,
              fillColor: circle.fillColor,
              strokeColor: circle.strokeColor,
              zIndex: circle.zIndex.round(),
            ))
        .toSet();
  }

  /// Converts an `Atlas.MapIcon` to an `GoogleMaps.BitmapDescriptor`
  Future<GoogleMaps.BitmapDescriptor> _toBitmapDescriptor(
    MarkerIcon markerIcon,
  ) async {
    final imageConfiguration = ImageConfiguration(
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

  /// Callback method where GoogleMaps passes the map controller
  void _onMapCreated(GoogleMaps.GoogleMapController controller) async {
    onMapCreated?.call(
      GoogleAtlasController(controller: controller),
    );
  }

  Future _getGoogleAtlasDrawings() {
    return Future.wait([_toGoogleMarkers(markers), _toGoogleCircles(circles)])
        .then(
      (response) => GoogleAtlasDrawings(
        markers: response[0],
        circles: response[1],
      ),
    );
  }
}

class GoogleAtlasDrawings {
  final Set<GoogleMaps.Marker> markers;
  final Set<GoogleMaps.Circle> circles;

  GoogleAtlasDrawings({this.markers, this.circles});
}
