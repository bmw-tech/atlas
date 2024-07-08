import 'dart:async';
import 'dart:typed_data';

import 'package:atlas/atlas.dart';
import 'package:atlas/src/screen_shot/screen_shot_options.dart';
import 'package:flutter/widgets.dart';

/// `AtlasController` allows developers to manipulate `Atlas` after the map has been initialized.
abstract class AtlasController {
  /// Moves the camera to the specified `CameraPosition` with an optional animation `​​​​​MoveCameraAnimation`.
  Future<void> moveCamera(
    CameraPosition cameraPosition, {
    MoveCameraAnimation? animation,
  });

  /// Get the current camera position
  Future<CameraPosition> getCameraPosition();

  /// Updates the camera bounds based on the provided `BoundingBoxData`
  Future<void> updateBounds(BoundingBoxData boundingBoxData);

  /// Return a [ScreenCoordinate] corresponding to the [LatLng] in the map view.
  Future<LatLng> getLatLng(ScreenCoordinates screenCoordinates);

  /// Return a [LatLngBounds] corresponding to [Rectangle2D] the in the map view
  LatLngBounds getBounds(Rectangle2D rectangle2d);

  /// Returns a [LatLng] corresponding to the [ScreenCoordinate] in the map view.
  Future<ScreenCoordinates> getScreenCoordinate(LatLng latLng);

  /// Return a [BoundingBox] corresponding to the currently visible area in the map view.
  Future<LatLngBounds> getVisibleArea();

  /// Return a [Uint8List] to the screenshot of the specified range of the current screen
  Future<Uint8List> getScreenShot({
    required Viewpoint viewpoint,
    required Size size,
    ScreenShotOptions? options,
  });

  /// Updates the map's logo bottom padding
  /// [bottomPadding] is the value that the padding will become
  Future<void> updateMapLogoBottomPadding(int bottomPadding);

  /// Updates the map's compass properties
  Future<void> updateMapCompassProperties({
    required double marginTop,
    required double marginRight,
    required double marginBot,
    required double marginLeft,
    Uint8List? image,
  });

  /// Dispose the map sdk
  Future<void> disposeSDK();

  /// Some regions may have their own unique methods,
  /// this function can be used for customized implementation
  Future<void> executeCustomMethod(Map<String, dynamic> parameters);

  /// Return a [LatLngBounds] corresponding to [Rectangle2D] the in the map view - Async method
  Future<LatLngBounds>? getLatLngBounds(Rectangle2D rectangle2d);

  /// Set the compass bearing of the map
  /// [bearing] is the value that the bearing will become
  Future<void> setBearing(double bearing);
}
