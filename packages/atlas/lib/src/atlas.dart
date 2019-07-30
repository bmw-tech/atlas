import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';

/// `Atlas` is a Flutter [Widget] which abstracts the underlying map provider
/// and exposes a developer-friendly, declarative API for working with a map.
/// The underlying map provider that will be used must be specified as the
/// `AtlasProvider.instance` before the `Atlas` widget is rendered.
class Atlas extends StatelessWidget {
  /// The `LatLng` which the map will be focused on.
  final LatLng position;

  /// The [Set] of `markers` which will be rendered on the map.
  final Set<Marker> markers;

  /// `onTap` gets called when the map is tapped.
  /// The `LatLng` of the location where the pressed event occurred is passed as an argument.
  final ArgumentCallback<LatLng> onTap;

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

  Atlas({
    Key key,
    @required this.position,
    Set<Marker> markers,
    bool showMyLocation,
    bool showMyLocationButton,
    this.onTap,
  })  : assert(position != null),
        markers = markers ?? Set<Marker>(),
        showMyLocation = showMyLocation ?? false,
        showMyLocationButton = showMyLocationButton ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AtlasProvider.instance.build(
      position: position,
      markers: markers,
      onTap: onTap,
      showMyLocation: showMyLocation,
      showMyLocationButton: showMyLocationButton,
    );
  }
}
