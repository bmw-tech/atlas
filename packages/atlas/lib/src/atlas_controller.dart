import 'dart:async';

import 'package:atlas/atlas.dart';

/// `AtlasController` allows developers to manipulate `Atlas` after the map has been initialized.
abstract class AtlasController {
  /// Moves the camera to the specified `CameraPosition` with an optional animation `​​​​​MoveCameraAnimation`.
  Future<void> moveCamera(
    CameraPosition cameraPosition, {
    MoveCameraAnimation animation,
  });

  /// Get the current camera position
  Future<CameraPosition> getCameraPosition();

  /// Updates the camera bounds based on the provided `BoundingBoxData`
  Future<void> updateBounds(BoundingBoxData boundingBoxData);

  /// Return a [ScreenCoordinate] corresponding to the [LatLng] in the map view.
  Future<LatLng> getLatLng(ScreenCoordinates screenCoordinates);

  /// Returns a [LatLng] corresponding to the [ScreenCoordinate] in the map view.
  Future<ScreenCoordinates> getScreenCoordinate(LatLng latLng);

  /// Return a [BoundingBox] corresponding to the currently visible area in the map view.
  Future<LatLngBounds> getVisibleArea();

  /// Changes the Icon of the LocationMarker to the given asset. (May not work on all MapProviders)
  void changeUserLocationIcon(String asset);
}
