import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

/// `Atlas` is a Flutter [Widget] which abstracts the underlying map provider
/// and exposes a developer-friendly, declarative API for working with a map.
/// The underlying map provider that will be used must be specified as the
/// `AtlasProvider.instance` before the `Atlas` widget is rendered.
class Atlas extends StatelessWidget {
  /// The `CameraPosition` which the map will initially be focused on.
  final CameraPosition initialCameraPosition;

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

  // List of actions that will be represented as buttons on the right side of the map
  final List<Action> actions;

  Atlas({
    Key key,
    @required this.initialCameraPosition,
    Set<Marker> markers,
    bool showMyLocation,
    bool showMyLocationButton,
    List<Action> actions,
    this.onTap,
  })  : assert(initialCameraPosition != null),
        markers = markers ?? Set<Marker>(),
        showMyLocation = showMyLocation ?? false,
        showMyLocationButton = showMyLocationButton ?? false,
        actions = actions ?? List<Action>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AtlasProvider.instance.build(
          initialCameraPosition: initialCameraPosition,
          markers: markers,
          onTap: onTap,
          showMyLocation: showMyLocation,
          showMyLocationButton: showMyLocationButton,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(
              top:250, 
              right: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:
                actions.map((action) => _createMapButton(action)).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _createMapButton(
    Action action,
  ) {
    return Material(
      key: action.key,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(0x1E, 0x00, 0x00, 0x00),
              offset: Offset(0.0, 0.0),
              blurRadius: 2.0,
            )
          ],
          color: Colors.white,
          shape: BoxShape.rectangle,
        ),
        child: InkWell(
          onTap: action.onTap,
          child: Padding(
            padding:EdgeInsets.all(7.0),
            child: Icon(
              action.iconData,
              size: 28.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ); 
  }
}
