import 'package:meta/meta.dart';
import 'package:atlas/atlas.dart';

/// Marks a geographical location on the map.
class Marker {
  /// Uniquely identifies a `Marker`.
  final String id;

  /// The location where the `Marker` is drawn is represented as `LatLng`.
  final LatLng position;

  /// Optional MapIcon used to replace default icon
  final MapIcon icon;

  /// A `void Function` which is called whenever a `Marker` is tapped.
  final void Function() onTap;

  const Marker({
    @required this.id,
    @required this.position,
    this.onTap,
    this.icon,
  })  : assert(id != null),
        assert(position != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Marker typedOther = other;
    return id == typedOther.id && position == typedOther.position;
  }

  @override
  int get hashCode => id.hashCode ^ position.hashCode;
}
