import 'package:flutter_test/flutter_test.dart';
import 'package:google_atlas/src/utils/lat_lng_bounds_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;
import 'package:atlas/atlas.dart';

void main() {
  group('LatLngBoundsUtils', () {

    group('formLatLngBoundsFromMarkers', () {
      test('should return null if markers is null', () {
        expect(LatLngBoundsUtils.formLatLngBoundsFromMarkers(null), null);
      });

      test('should return null if markers is empty', () {
        expect(
            LatLngBoundsUtils.formLatLngBoundsFromMarkers(Set.from([])), null);
      });

      test('should return correct bounding box if markers is not empty', () {
        final String id1 = 'id_1';
        final String id2 = 'id_2';
        final double lat1 = 10.50;
        final double lng1 = -20.30;
        final double lat2 = 30.12;
        final double lng2 = -40.34;
        final Set<Marker> markers = [
          Marker(
            id: id1,
            position: LatLng(
              latitude: lat1,
              longitude: lng1,
            ),
          ),
          Marker(
            id: id2,
            position: LatLng(
              latitude: lat2,
              longitude: lng2,
            ),
          ),
        ].toSet();
        GoogleMaps.LatLngBounds results =
            LatLngBoundsUtils.formLatLngBoundsFromMarkers(markers);
        expect(results.northeast.latitude, moreOrLessEquals(lat2));
        expect(results.northeast.longitude, moreOrLessEquals(lng1));
        expect(results.southwest.latitude, moreOrLessEquals(lat1));
        expect(results.southwest.longitude, moreOrLessEquals(lng2));
      });

      test('should return correct bounding box if markers is not empty', () {
        final String id1 = 'id_1';
        final String id2 = 'id_2';
        final double lat1 = 10.50;
        final double lng1 = -20.30;
        final double lat2 = 30.12;
        final double lng2 = 40.34;
        final Set<Marker> markers = [
          Marker(
            id: id1,
            position: LatLng(
              latitude: lat1,
              longitude: lng1,
            ),
          ),
          Marker(
            id: id2,
            position: LatLng(
              latitude: lat2,
              longitude: lng2,
            ),
          ),
        ].toSet();
        GoogleMaps.LatLngBounds results =
            LatLngBoundsUtils.formLatLngBoundsFromMarkers(markers);
        expect(results.northeast.latitude, moreOrLessEquals(lat2));
        expect(results.northeast.longitude, moreOrLessEquals(lng2));
        expect(results.southwest.latitude, moreOrLessEquals(lat1));
        expect(results.southwest.longitude, moreOrLessEquals(lng1));
      });

      test('should return correct bounding box if markers is not empty', () {
        final String id1 = 'id_1';
        final String id2 = 'id_2';
        final double lat1 = 10.50;
        final double lng1 = -20.30;
        final double lat2 = -30.12;
        final double lng2 = 40.34;
        final Set<Marker> markers = [
          Marker(
            id: id1,
            position: LatLng(
              latitude: lat1,
              longitude: lng1,
            ),
          ),
          Marker(
            id: id2,
            position: LatLng(
              latitude: lat2,
              longitude: lng2,
            ),
          ),
        ].toSet();
        GoogleMaps.LatLngBounds results =
            LatLngBoundsUtils.formLatLngBoundsFromMarkers(markers);
        expect(results.northeast.latitude, moreOrLessEquals(lat1));
        expect(results.northeast.longitude, moreOrLessEquals(lng2));
        expect(results.southwest.latitude, moreOrLessEquals(lat2));
        expect(results.southwest.longitude, moreOrLessEquals(lng1));
      });

      test('should return correct bounding box if markers is not empty', () {
        final String id1 = 'id_1';
        final String id2 = 'id_2';
        final double lat1 = 10.50;
        final double lng1 = -20.30;
        final double lat2 = -30.12;
        final double lng2 = -40.34;
        final Set<Marker> markers = [
          Marker(
            id: id1,
            position: LatLng(
              latitude: lat1,
              longitude: lng1,
            ),
          ),
          Marker(
            id: id2,
            position: LatLng(
              latitude: lat2,
              longitude: lng2,
            ),
          ),
        ].toSet();
        GoogleMaps.LatLngBounds results =
            LatLngBoundsUtils.formLatLngBoundsFromMarkers(markers);
        expect(results.northeast.latitude, moreOrLessEquals(lat1));
        expect(results.northeast.longitude, moreOrLessEquals(lng1));
        expect(results.southwest.latitude, moreOrLessEquals(lat2));
        expect(results.southwest.longitude, moreOrLessEquals(lng2));
      });

      test('should return correct bounding box if markers is not empty', () {
        final String id1 = 'id_1';
        final String id2 = 'id_2';
        final double lat1 = 10.50;
        final double lng1 = -120.30;
        final double lat2 = -30.12;
        final double lng2 = 140.34;
        final Set<Marker> markers = [
          Marker(
            id: id1,
            position: LatLng(
              latitude: lat1,
              longitude: lng1,
            ),
          ),
          Marker(
            id: id2,
            position: LatLng(
              latitude: lat2,
              longitude: lng2,
            ),
          ),
        ].toSet();
        GoogleMaps.LatLngBounds results =
            LatLngBoundsUtils.formLatLngBoundsFromMarkers(markers);
        expect(results.northeast.latitude, moreOrLessEquals(lat1));
        expect(results.northeast.longitude, moreOrLessEquals(lng1));
        expect(results.southwest.latitude, moreOrLessEquals(lat2));
        expect(results.southwest.longitude, moreOrLessEquals(lng2));
      });
    });

    group('newLatLngBoundsFromPosition', () {
      test('should return null if origBounds is null', () {
        final LatLng position = LatLng(
          latitude: 0.0,
          longitude: 0.0,
        );
        expect(LatLngBoundsUtils.newLatLngBoundsFromPosition(null, position),
            null);
      });

      test('should return original bounds if positions is null', () {
        final double lat1 = 10.50;
        final double lng1 = -20.30;
        final double lat2 = 30.12;
        final double lng2 = -40.34;
        final GoogleMaps.LatLngBounds origBounds = GoogleMaps.LatLngBounds(
          southwest: GoogleMaps.LatLng(lat1, lng1),
          northeast: GoogleMaps.LatLng(lat2, lng2),
        );
        expect(LatLngBoundsUtils.newLatLngBoundsFromPosition(origBounds, null),
            origBounds);
      });

      test(
          'should return correct new bounds if positions is to the north of northeast line',
          () {
        final double lat0 = 45.0;
        final double lng0 = -50.0;
        final double lat1 = 20.0;
        final double lng1 = 30.0;
        final double lat2 = -40.0;
        final double lng2 = -60.0;
        final LatLng position = LatLng(
          latitude: lat0,
          longitude: lng0,
        );
        final GoogleMaps.LatLngBounds origBounds = GoogleMaps.LatLngBounds(
          southwest: GoogleMaps.LatLng(lat2, lng2),
          northeast: GoogleMaps.LatLng(lat1, lng1),
        );
        GoogleMaps.LatLngBounds results =
            LatLngBoundsUtils.newLatLngBoundsFromPosition(origBounds, position);
        expect(results.northeast.latitude, moreOrLessEquals(90.0));
        expect(results.northeast.longitude, moreOrLessEquals(lng1));
        expect(results.southwest.latitude, moreOrLessEquals(lat2));
        expect(
            results.southwest.longitude, moreOrLessEquals(lng0 * 2.0 - lng1));
      });

      test(
          'should return correct new bounds if positions is to the south of southwest line',
          () {
        final double lat0 = -45.0;
        final double lng0 = 0.0;
        final double lat1 = 20.0;
        final double lng1 = 30.0;
        final double lat2 = -40.0;
        final double lng2 = -60.0;
        final LatLng position = LatLng(
          latitude: lat0,
          longitude: lng0,
        );
        final GoogleMaps.LatLngBounds origBounds = GoogleMaps.LatLngBounds(
          southwest: GoogleMaps.LatLng(lat2, lng2),
          northeast: GoogleMaps.LatLng(lat1, lng1),
        );
        GoogleMaps.LatLngBounds results =
            LatLngBoundsUtils.newLatLngBoundsFromPosition(origBounds, position);
        expect(results.northeast.latitude, moreOrLessEquals(lat1));
        expect(
            results.northeast.longitude, moreOrLessEquals(lng0 * 2.0 - lng2));
        expect(results.southwest.latitude, moreOrLessEquals(-90.0));
        expect(results.southwest.longitude, moreOrLessEquals(lng2));
      });

      test(
          'should return correct new bounds if positions is to the east of northeast line',
          () {
        final double lat0 = 0.0;
        final double lng0 = 50.0;
        final double lat1 = 20.0;
        final double lng1 = 30.0;
        final double lat2 = -40.0;
        final double lng2 = -60.0;
        final LatLng position = LatLng(
          latitude: lat0,
          longitude: lng0,
        );
        final GoogleMaps.LatLngBounds origBounds = GoogleMaps.LatLngBounds(
          southwest: GoogleMaps.LatLng(lat2, lng2),
          northeast: GoogleMaps.LatLng(lat1, lng1),
        );
        GoogleMaps.LatLngBounds results =
            LatLngBoundsUtils.newLatLngBoundsFromPosition(origBounds, position);
        expect(results.northeast.latitude, moreOrLessEquals(lat0 * 2.0 - lat2));
        expect(results.northeast.longitude, moreOrLessEquals(lng2));
        expect(results.southwest.latitude, moreOrLessEquals(lat2));
        expect(
            results.southwest.longitude, moreOrLessEquals(lng0 * 2.0 - lng2));
      });

      test(
          'should return correct new bounds if positions is to the west of southwest line',
          () {
        final double lat0 = 0.0;
        final double lng0 = -80.0;
        final double lat1 = 20.0;
        final double lng1 = 30.0;
        final double lat2 = -40.0;
        final double lng2 = -60.0;
        final LatLng position = LatLng(
          latitude: lat0,
          longitude: lng0,
        );
        final GoogleMaps.LatLngBounds origBounds = GoogleMaps.LatLngBounds(
          southwest: GoogleMaps.LatLng(lat2, lng2),
          northeast: GoogleMaps.LatLng(lat1, lng1),
        );
        GoogleMaps.LatLngBounds results =
            LatLngBoundsUtils.newLatLngBoundsFromPosition(origBounds, position);
        expect(results.northeast.latitude, moreOrLessEquals(lat0 * 2.0 - lat2));
        expect(results.northeast.longitude, moreOrLessEquals(lng1));
        expect(results.southwest.latitude, moreOrLessEquals(lat2));
        expect(
            results.southwest.longitude, moreOrLessEquals(lng0 * 2.0 - lng2));
      });

      test(
          'should return correct new bounds if positions is inside the orignal bound',
          () {
        final double lat0 = -5.0;
        final double lng0 = 0.0;
        final double lat1 = 20.0;
        final double lng1 = 30.0;
        final double lat2 = -40.0;
        final double lng2 = -60.0;
        final LatLng position = LatLng(
          latitude: lat0,
          longitude: lng0,
        );
        final GoogleMaps.LatLngBounds origBounds = GoogleMaps.LatLngBounds(
          southwest: GoogleMaps.LatLng(lat2, lng2),
          northeast: GoogleMaps.LatLng(lat1, lng1),
        );
        GoogleMaps.LatLngBounds results =
            LatLngBoundsUtils.newLatLngBoundsFromPosition(origBounds, position);
        expect(results.northeast.latitude, moreOrLessEquals(lat0 * 2.0 - lat2));
        expect(
            results.northeast.longitude, moreOrLessEquals(lng0 * 2.0 - lng2));
        expect(results.southwest.latitude, moreOrLessEquals(lat2));
        expect(results.southwest.longitude, moreOrLessEquals(lng2));
      });

      test(
          'should return correct new bounds if positions is inside the orignal bound',
          () {
        final double lat0 = -15.0;
        final double lng0 = -30.0;
        final double lat1 = 20.0;
        final double lng1 = 30.0;
        final double lat2 = -40.0;
        final double lng2 = -60.0;
        final LatLng position = LatLng(
          latitude: lat0,
          longitude: lng0,
        );
        final GoogleMaps.LatLngBounds origBounds = GoogleMaps.LatLngBounds(
          southwest: GoogleMaps.LatLng(lat2, lng2),
          northeast: GoogleMaps.LatLng(lat1, lng1),
        );
        GoogleMaps.LatLngBounds results =
            LatLngBoundsUtils.newLatLngBoundsFromPosition(origBounds, position);
        expect(results.northeast.latitude, moreOrLessEquals(lat1));
        expect(results.northeast.longitude, moreOrLessEquals(lng1));
        expect(results.southwest.latitude, moreOrLessEquals(lat0 * 2.0 - lat1));
        expect(
            results.southwest.longitude, moreOrLessEquals(lng0 * 2.0 - lng1));
      });
    });
  });
}
