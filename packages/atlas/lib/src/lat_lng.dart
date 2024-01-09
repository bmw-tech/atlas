/// A pair of latitude and longitude coordinates.
/// The `latitude` and `longitude` are stored as degrees.
import 'package:equatable/equatable.dart';

class LatLng extends Equatable {
  /// The latitude in degrees between -90.0 and 90.0, both inclusive.
  final double latitude;

  /// The longitude in degrees between -180.0 (inclusive) and 180.0 (exclusive).
  final double longitude;

  const LatLng({
    required double latitude,
    required double longitude,
  })  : latitude = (latitude < -90.0 ? -90.0 : (90.0 < latitude ? 90.0 : latitude)),
        longitude = (longitude + 180.0) % 360.0 - 180.0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is LatLng) {
      return latitude == other.latitude && longitude == other.longitude;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];

  @override
  bool get stringify => true;
}
