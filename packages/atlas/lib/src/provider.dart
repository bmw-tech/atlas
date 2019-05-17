import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';

/// The `Provider` defines the interface to which all `AtlasProviders` must conform.
/// In order to implement a custom `AtlasProvider` you must simply implement `Provider`
/// and set your `AtlasProvider.instance` to the instance of your custom `Provider`.
abstract class Provider {
  Widget build({
    final CameraPosition initialCameraPosition,
    final Set<Marker> markers,
  });
}
