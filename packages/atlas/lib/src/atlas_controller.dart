import 'dart:async';
import 'dart:typed_data';

import 'package:atlas/atlas.dart';

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
  ///
  /// [x] and [y] are the starting coordinates relative to the upper left corner [0, 0]
  /// [width] is the width to be intercepted
  /// [height] is the height to be intercepted
  Future<Uint8List> getScreenShot({
    int x,
    int y,
    int width,
    int height,
  });

    /// Updates the map's logo bottom padding
    /// [bottomPadding] is the value that the padding will become
    Future<void> updateMapLogoBottomPadding(int bottomPadding);
}
