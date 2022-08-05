import 'dart:async';
import 'dart:typed_data';

import 'package:atlas/atlas.dart';
import 'package:flutter/foundation.dart';
import 'package:google_atlas/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

class GoogleAtlasController implements AtlasController {
  final GoogleMaps.GoogleMapController _controller;

  GoogleAtlasController({required GoogleMaps.GoogleMapController controller})
      : _controller = controller;

  @override
  Future<void> moveCamera(CameraPosition cameraPosition,
      {MoveCameraAnimation? animation}) {
    return _controller.moveCamera(
      GoogleMaps.CameraUpdate.newCameraPosition(
        CameraUtils.toGoogleCameraPosition(cameraPosition),
      ),
    );
  }

  @override
  Future<void> updateBounds(BoundingBoxData boundingBoxData) {
    return _controller.moveCamera(
      GoogleMaps.CameraUpdate.newLatLngBounds(
        LatLngUtils.toGoogleLatLngBounds(boundingBoxData.bounds),
        0,
      ),
    );
  }

  @override
  LatLngBounds getBounds(Rectangle2D rectangle2d) {
    // TODO: implement getBounds
    throw UnimplementedError();
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

  @override
  Future<CameraPosition> getCameraPosition() async {
    // TODO: implement getCameraPosition
    throw UnimplementedError();
  }

  @override
  Future<LatLngBounds> getVisibleArea() async {
    return LatLngUtils.fromGoogleLatLngBounds(
      await _controller.getVisibleRegion(),
    );
  }

  @override
  Future<Uint8List> getScreenShot({int? x, int? y, int? width, int? height}) {
    // TODO: implement getScreenShot
    throw UnimplementedError();
  }

  @override
  Future<void> updateMapLogoBottomPadding(int bottomPadding) {
    // TODO: implement updateMapLogoBottomPadding
    throw UnimplementedError();
  }
}
