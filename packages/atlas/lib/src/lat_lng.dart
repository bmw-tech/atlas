import 'package:meta/meta.dart';

/// A pair of latitude and longitude coordinates.
/// The `latitude` and `longitude` are stored as degrees.
class LatLng {
  /// The latitude in degrees between -90.0 and 90.0, both inclusive.
  final double latitude;

  /// The longitude in degrees between -180.0 (inclusive) and 180.0 (exclusive).
  final double longitude;

  const LatLng({
    @required double latitude,
    @required double longitude,
  })  : assert(latitude != null),
        assert(longitude != null),
        latitude =
            (latitude < -90.0 ? -90.0 : (90.0 < latitude ? 90.0 : latitude)),
        longitude = (longitude + 180.0) % 360.0 - 180.0;

  @override
  bool operator ==(Object o) {
    return o is LatLng && o.latitude == latitude && o.longitude == longitude;
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ latitude.hashCode ^ longitude.hashCode;
}
