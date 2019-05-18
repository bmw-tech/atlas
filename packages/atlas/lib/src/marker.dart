import 'package:meta/meta.dart';
import 'package:atlas/atlas.dart';

/// Marks a geographical location on the map.
class Marker {
  /// Uniquely identifies a `Marker`.
  final String id;

  /// The location where the `Marker` is drawn is represented as `LatLng`.
  final LatLng position;

  /// A `void Function` which is called whenever a `Marker` is tapped.
  final void Function() onTap;

  const Marker({@required this.id, @required this.position, this.onTap})
      : assert(id != null),
        assert(position != null);
}
