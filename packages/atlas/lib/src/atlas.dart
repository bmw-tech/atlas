import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';

/// `Atlas` is a Flutter [Widget] which abstracts the underlying map provider
/// and exposes a developer-friendly, declarative API for working with a map.
/// The underlying map provider that will be used must be specified as the
/// `AtlasProvider.instance` before the `Atlas` widget is rendered.
class Atlas extends StatelessWidget {
  /// The `CameraPosition` which the map will initially be focused on.
  final CameraPosition initialCameraPosition;

  /// The [Set] of `markers` which will be rendered on the map.
  final Set<Marker> markers;

  /// The [Set] of `Circle` which will be rendered on the map.
  final Set<Circle> circles;

  /// `onTap` gets called when the map is tapped.
  /// The `LatLng` of the location where the pressed event occurred is passed as an argument.
  final ArgumentCallback<LatLng> onTap;

  /// `onLongPress` gets called when the map is long pressed
  /// The `LatLng` of the location where the pressed event occurred is passed as an argument.
  final ArgumentCallback<LatLng> onLongPress;

  /// `onMapCreated` gets called when the map is initialized and provides an `AtlasController`
  /// which can be used to manipulate the map.
  final ArgumentCallback<AtlasController> onMapCreated;

  /// `showMyLocation` determines whether or not the current device location
  /// should be displayed on the map. It will default to false if not specified.
  ///
  /// Enabling this feature requires adding location permissions to both native
  /// platforms of your app.
  /// * On Android add either
  /// `<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />`
  /// or `<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />`
  /// to your `AndroidManifest.xml` file. `ACCESS_COARSE_LOCATION` returns a
  /// location with an accuracy approximately equivalent to a city block, while
  /// `ACCESS_FINE_LOCATION` returns as precise a location as possible, although
  /// it consumes more battery power. You will also need to request these
  /// permissions during run-time. If they are not granted,
  /// feature will fail silently.
  ///
  /// * On iOS add a `NSLocationWhenInUseUsageDescription` key to your
  /// `Info.plist` file. This will automatically prompt the user for permissions
  /// when the map is loaded.
  final bool showMyLocation;

  /// Enables or disables the my-location button.
  ///
  /// The my-location button causes the camera to move such that the user's
  /// location is in the center of the map. If the button is enabled, it is
  /// only shown when the my-location layer is enabled.
  ///
  /// By default, the my-location button is enabled (and hence shown when the
  /// my-location layer is enabled).
  ///
  /// See also:
  ///   * [showMyLocation] parameter.
  final bool showMyLocationButton;

  final MapType currentMapType;

  Atlas({
    Key key,
    @required this.initialCameraPosition,
    Set<Marker> markers,
    Set<Circle> circles,
    bool showMyLocation,
    bool showMyLocationButton,
    MapType currentMapType,
    this.onTap,
    this.onLongPress,
    this.onMapCreated,
  })  : assert(initialCameraPosition != null),
        markers = markers ?? Set<Marker>(),
        circles = circles ?? Set<Circle>(),
        showMyLocation = showMyLocation ?? false,
        showMyLocationButton = showMyLocationButton ?? false,
        currentMapType = currentMapType ?? MapType.normal,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AtlasProvider.instance.build(
      initialCameraPosition: initialCameraPosition,
      markers: markers,
      circles: circles,
      onTap: onTap,
      onLongPress: onLongPress,
      showMyLocation: showMyLocation,
      showMyLocationButton: showMyLocationButton,
      currentMapType: currentMapType,
      onMapCreated: onMapCreated,
    );
  }
}
