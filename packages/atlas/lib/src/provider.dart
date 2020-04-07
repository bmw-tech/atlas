import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';

/// Callback function taking a single argument.
typedef void ArgumentCallback<T>(T argument);

/// The `Provider` defines the interface to which all `AtlasProviders` must conform.
/// In order to implement a custom `AtlasProvider` you must simply implement `Provider`
/// and set your `AtlasProvider.instance` to the instance of your custom `Provider`.
abstract class Provider {
  /// Allows the respective map provider to declare
  /// what underlying map types are supported.
  ///
  /// This info can then be used to either cycle through
  /// MapTypes with a button on the GUI, or to set the initial
  /// [Atlas.mapType] property.
  Set<MapType> supportedMapTypes;

  Widget build({
    final CameraPosition initialCameraPosition,
    final Set<Marker> markers,
    final Set<Circle> circles,
    final Set<Polygon> polygons,
    final Set<Polyline> polylines,
    final ArgumentCallback<LatLng> onTap,
    final ArgumentCallback<LatLng> onLongPress,
    final ArgumentCallback<AtlasController> onMapCreated,
    final ArgumentCallback<CameraPosition> onCameraPositionChanged,
    final bool showMyLocation,
    final bool showMyLocationButton,
    final bool followMyLocation,
    final MapType mapType,
    final bool showTraffic,
  });
}
