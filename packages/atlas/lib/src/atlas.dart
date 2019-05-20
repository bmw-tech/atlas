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

  /// `onTap` gets called when the map is tapped.
  /// The `LatLng` of the location where the pressed event occurred is passed as an argument.
  final ArgumentCallback<LatLng> onTap;

  Atlas({
    Key key,
    @required this.initialCameraPosition,
    Set<Marker> markers,
    this.onTap,
  })  : assert(initialCameraPosition != null),
        markers = markers ?? Set<Marker>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AtlasProvider.instance.build(
      initialCameraPosition: initialCameraPosition,
      markers: markers,
      onTap: onTap,
    );
  }
}
