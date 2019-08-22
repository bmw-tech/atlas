import 'dart:async';

import 'package:atlas/atlas.dart';

/// `AtlasController` allows developers to manipulate `Atlas` after the map has been initialized.
abstract class AtlasController {
  /// Moves the camera to the specified `CameraPosition`
  Future<void> moveCamera(CameraPosition cameraPosition);

  /// Updates the camera bounds based on the provided `LatLngBounds`
  /// and adds padding around the bounds based on the provided `padding`.
  Future<void> updateBounds(LatLngBounds bounds, double padding);
}
