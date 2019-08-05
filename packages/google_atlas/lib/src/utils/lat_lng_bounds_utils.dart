import 'package:atlas/atlas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

class LatLngBoundsUtils {
  static const double _MAX_LATITUDE = 90.0;
  static const double _MIN_LATITUDE = -90.0;
  static const double _MAX_LONGITUDE = 180.0;
  static const double _MIN_LONGITUDE = -180.0;

  /// return a [GoogleMaps.LatLngBounds] based on a set of markers's latitude and longitude
  /// null is returned when [makers] is null or set is empty.
  static GoogleMaps.LatLngBounds mapMarkersToLatLngBounds(Set<Marker> markers) {
    var maxNorth = _MIN_LATITUDE;
    var maxEast = _MIN_LONGITUDE;
    var minSouth = _MAX_LATITUDE;
    var minWest = _MAX_LONGITUDE;

    if (markers == null || markers.isEmpty) {
      return null;
    }

    markers.forEach((marker) {
      if (marker.position.latitude > maxNorth) {
        maxNorth = marker.position.latitude;
      }
      if (marker.position.latitude < minSouth) {
        minSouth = marker.position.latitude;
      }
      if (marker.position.longitude > maxEast) {
        maxEast = marker.position.longitude;
      }
      if (marker.position.longitude < minWest) {
        minWest = marker.position.longitude;
      }
    });

    //take the shorter half around the globe
    if ((maxEast - minWest) > _MAX_LONGITUDE) {
      final temp = maxEast;
      maxEast = minWest;
      minWest = temp;
    }

    return GoogleMaps.LatLngBounds(
      northeast: GoogleMaps.LatLng(maxNorth, maxEast),
      southwest: GoogleMaps.LatLng(minSouth, minWest),
    );
  }

  /// return a new [GoogleMaps.LatLngBounds] based on an original bounding box and
  /// a position.  The newly generated bounding box is centered on the position
  /// and contains the orignal bounding box.
  static GoogleMaps.LatLngBounds newLatLngBoundsFromPosition(
    GoogleMaps.LatLngBounds originalBounds,
    LatLng position,
  ) {
    if (originalBounds == null) {
      return null;
    }
    if (position == null) {
      return originalBounds;
    }
    var maxNorth = originalBounds.northeast.latitude;
    var maxEast = originalBounds.northeast.longitude;
    var minSouth = originalBounds.southwest.latitude;
    var minWest = originalBounds.southwest.longitude;

    if (position.latitude < minSouth) {
      minSouth = position.latitude * 2.0 - maxNorth;
    } else if (position.latitude > maxNorth) {
      maxNorth = position.latitude * 2.0 - minSouth;
    } else {
      if (maxNorth - position.latitude > position.latitude - minSouth) {
        minSouth = position.latitude * 2.0 - maxNorth;
      } else {
        maxNorth = position.latitude * 2.0 - minSouth;
      }
    }

    if (position.longitude < minWest) {
      minWest = position.longitude * 2.0 - minWest;
    } else if (position.longitude > maxEast) {
      maxEast = position.longitude * 2.0 - minWest;
    } else {
      if (maxEast - position.longitude > position.longitude - minWest) {
        minWest = position.longitude * 2.0 - maxEast;
      } else {
        maxEast = position.longitude * 2.0 - minWest;
      }
    }

    minSouth = _normalizeLatitude(minSouth);
    maxNorth = _normalizeLatitude(maxNorth);
    minWest = _normalizeLongitude(minWest);
    maxEast = _normalizeLongitude(maxEast);

    // take the shorter half around the globe
    if ((maxEast - minWest) > _MAX_LONGITUDE) {
      final temp = maxEast;
      maxEast = minWest;
      minWest = temp;
    }

    return GoogleMaps.LatLngBounds(
      northeast: GoogleMaps.LatLng(maxNorth, maxEast),
      southwest: GoogleMaps.LatLng(minSouth, minWest),
    );
  }

  static double _normalizeLatitude(double value) {
    return (value < _MIN_LATITUDE
        ? _MIN_LATITUDE
        : (_MAX_LATITUDE < value ? _MAX_LATITUDE : value));
  }

  static double _normalizeLongitude(double value) {
    return (value + _MAX_LONGITUDE) % (_MAX_LONGITUDE - _MIN_LONGITUDE) +
        _MIN_LONGITUDE;
  }
}
