import 'package:atlas/atlas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

class LatLngBoundsUtils {
  static GoogleMaps.LatLngBounds formLatLngBoundsFromMarkers(
      Set<Marker> markers) {
    final maxNorth = -90.0;
    final maxEast = -180;
    final minSouth = 90.0;
    final minWest = 180.0;

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
    if ((maxEast - minWest) > 180.0) {
      final temp = maxEast;
      maxEast = minWest;
      minWest = temp;
    }

    return GoogleMaps.LatLngBounds(
      northeast: GoogleMaps.LatLng(maxNorth, maxEast),
      southwest: GoogleMaps.LatLng(minSouth, minWest),
    );
  }

  static GoogleMaps.LatLngBounds newLatLngBoundsFromPosition(
      GoogleMaps.LatLngBounds originalBounds,
      LatLng position,
  ) {
    if (origBounds == null) {
      return null;
    }
    if (position == null) {
      return origBounds;
    } else {
      double maxNorth = origBounds.northeast.latitude;
      double maxEast = origBounds.northeast.longitude;
      double minSouth = origBounds.southwest.latitude;
      double minWest = origBounds.southwest.longitude;

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

      //take the shorter half around the globe
      if ((maxEast - minWest) > 180.0) {
        final double temp = maxEast;
        maxEast = minWest;
        minWest = temp;
      }

      return GoogleMaps.LatLngBounds(
        northeast: GoogleMaps.LatLng(maxNorth, maxEast),
        southwest: GoogleMaps.LatLng(minSouth, minWest),
      );
    }
  }

  static double _normalizeLatitude(double value) {
    return (value < -90.0 ? -90.0 : (90.0 < value ? 90.0 : value));
  }

  static double _normalizeLongitude(double value) {
    return (value + 180.0) % 360.0 - 180.0;
  }
}
