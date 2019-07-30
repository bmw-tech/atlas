import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';

/// Callback function taking a single argument.
typedef void ArgumentCallback<T>(T argument);

/// The `Provider` defines the interface to which all `AtlasProviders` must conform.
/// In order to implement a custom `AtlasProvider` you must simply implement `Provider`
/// and set your `AtlasProvider.instance` to the instance of your custom `Provider`.
abstract class Provider {
  Widget build({
    final LatLng position,
    final Set<Marker> markers,
    final ArgumentCallback<LatLng> onTap,
    final bool showMyLocation,
    final bool showMyLocationButton,
  });
}
