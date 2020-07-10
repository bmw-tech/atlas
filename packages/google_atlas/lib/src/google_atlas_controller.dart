import 'dart:async';

import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';
import 'package:google_atlas/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

class GoogleAtlasController implements AtlasController {
  final GoogleMaps.GoogleMapController _controller;

  GoogleAtlasController({@required GoogleMaps.GoogleMapController controller})
      : assert(controller != null),
        _controller = controller;

  @override
  Future<void> moveCamera(CameraPosition cameraPosition) {
    return _controller.moveCamera(
      GoogleMaps.CameraUpdate.newCameraPosition(
        CameraUtils.toGoogleCameraPosition(cameraPosition),
      ),
    );
  }

  @override
  Future<void> updateBounds(LatLngBounds bounds, double padding) {
    return _controller.moveCamera(
      GoogleMaps.CameraUpdate.newLatLngBounds(
        LatLngUtils.toGoogleLatLngBounds(bounds),
        padding,
      ),
    );
  }

  @override
  Future<LatLng> getLatLng(ScreenCoordinates screenCoordinates) async {
    var googleLatLng = await _controller
        .getLatLng(LatLngUtils.toGoogleScreenCoordinate(screenCoordinates));
    return LatLngUtils.fromGoogleLatLng(googleLatLng);
  }

  @override
  Future<ScreenCoordinates> getScreenCoordinate(LatLng latLng) async {
    var googleScreenCoordinate = await _controller
        .getScreenCoordinate(LatLngUtils.toGoogleLatLng(latLng));
    return LatLngUtils.fromGoogleScreenCoordinate(googleScreenCoordinate);
  }

  // TODO: implement updateBoundsWithPaddingToAllSides
  @override
  Future<void> updateBoundsWithPaddingToAllSides(LatLngBounds bounds,
      double north, double east, double south, double west) {
    return _controller.moveCamera(null);
  }

  @override
  void changeUserLocationIcon(String asset) {}

  @override
  CameraPosition getCameraPosition() {
    return null;
  }
}
