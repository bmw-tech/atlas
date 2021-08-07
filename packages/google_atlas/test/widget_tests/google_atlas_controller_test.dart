import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_atlas/src/google_atlas_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;
import 'package:mockito/mockito.dart';

class MockGoogleMapController extends Mock
    implements GoogleMaps.GoogleMapController {}

main() {
  group('GoogleAtlasController', () {
    GoogleMaps.GoogleMapController? googleMapController;
    GoogleAtlasController? googleAtlasController;

    setUp(() {
      googleMapController = MockGoogleMapController();
      googleAtlasController = GoogleAtlasController(
        controller: googleMapController,
      );
    });

    test('throws AssertionError if GoogleMaps.GoogleMapsController is null',
        () {
      try {
        GoogleAtlasController(controller: null);
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    group('moveCamera', () {
      test('invokes moveCamera', () async {
        final CameraPosition cameraPosition = CameraPosition(
          target: LatLng(latitude: 10.1, longitude: -80.7),
          zoom: 15,
        );
        final googleMapsBounds = GoogleMaps.LatLngBounds(
          northeast: GoogleMaps.LatLng(0, 0),
          southwest: GoogleMaps.LatLng(0, 0),
        );

        final cameraUpdate =
            GoogleMaps.CameraUpdate.newLatLngBounds(googleMapsBounds, 0);
        await googleAtlasController?.moveCamera(cameraPosition);
        verify(googleMapController?.moveCamera(cameraUpdate)).called(1);
      });
    });

    group('updateBounds', () {
      test('invokes newLatLngBounds', () async {
        final LatLngBounds atlasBounds = LatLngBounds(
          northeast: LatLng(latitude: 1, longitude: 1),
          southwest: LatLng(latitude: 0, longitude: 3),
        );

        final BoundingBoxData boundingBox = BoundingBoxData(
          bounds: atlasBounds,
        );

        final googleMapsBounds = GoogleMaps.LatLngBounds(
          northeast: GoogleMaps.LatLng(0, 0),
          southwest: GoogleMaps.LatLng(0, 0),
        );

        final cameraUpdate =
            GoogleMaps.CameraUpdate.newLatLngBounds(googleMapsBounds, 0);

        await googleAtlasController?.updateBounds(boundingBox);
        verify(googleMapController?.moveCamera(cameraUpdate)).called(1);
      });
    });

    group('getLatLng', () {
      test('invokes getLatLng', () async {
        final ScreenCoordinates coordinates = ScreenCoordinates(
          x: 1,
          y: 2,
        );
        var googleLatLng = GoogleMaps.LatLng(1.1, 2.2);

        var screenCoordinate = GoogleMaps.ScreenCoordinate(x: 0, y: 0);
        when(googleMapController?.getLatLng(screenCoordinate))
            .thenAnswer((_) => Future.value(googleLatLng));

        await googleAtlasController?.getLatLng(coordinates);
        List<dynamic> results = verify(
          googleMapController?.getLatLng(screenCoordinate),
        ).captured;
        GoogleMaps.ScreenCoordinate resultingScreenCoordinate = results.first;
        expect(coordinates.x, resultingScreenCoordinate.x);
        expect(coordinates.y, resultingScreenCoordinate.y);
      });
    });

    group('getScreenCoordinate', () {
      test('invokes getScreenCoordinate', () async {
        final LatLng inputLatLng = LatLng(
          latitude: 1.1,
          longitude: 2.2,
        );
        var returnedGoogleScreenCoordinate = GoogleMaps.ScreenCoordinate(
          x: 1,
          y: 2,
        );

        when(googleMapController?.getScreenCoordinate(GoogleMaps.LatLng(0, 0)))
            .thenAnswer((_) => Future.value(returnedGoogleScreenCoordinate));

        await googleAtlasController?.getScreenCoordinate(inputLatLng);
        List<dynamic> results = verify(
          googleMapController?.getScreenCoordinate(
            GoogleMaps.LatLng(
              0,
              0,
            ),
          ),
        ).captured;
        GoogleMaps.LatLng resultingLatLng = results.first;
        expect(inputLatLng.latitude, resultingLatLng.latitude);
        expect(inputLatLng.longitude, resultingLatLng.longitude);
      });
    });

    // TODO: implement updateBoundsWithPaddingToAllSides tests
    group('updateBoundsWithPaddingToAllSides', () {
      test('invokes lookAtWithGeoBoxAndOrientation', () async {
        await googleAtlasController?.updateBoundsWithPaddingToAllSides(
          LatLngBounds(
            southwest: LatLng(
              latitude: 0,
              longitude: 0,
            ),
            northeast: LatLng(
              latitude: 0,
              longitude: 0,
            ),
          ),
          0,
          0,
          0,
          0,
        );

        final googleMapsBounds = GoogleMaps.LatLngBounds(
          northeast: GoogleMaps.LatLng(0, 0),
          southwest: GoogleMaps.LatLng(0, 0),
        );

        final cameraUpdate = GoogleMaps.CameraUpdate.newLatLngBounds(
          googleMapsBounds,
          0,
        );

        verify(googleMapController?.moveCamera(cameraUpdate)).called(1);
      });
    });

    group('changeUserLocationIcon', () {
      test('invokes changeUserLocationIcon', () {
        googleAtlasController?.changeUserLocationIcon('asset');
      });
    });

    group('getCameraPosition', () {
      test('call getCameraPosition and returns null', () async {
        final cameraPosition = await googleAtlasController?.getCameraPosition();
        expect(cameraPosition, null);
      });
    });

    group('getVisibleArea', () {
      test('invokes getVisibleArea', () async {
        when(googleMapController?.getVisibleRegion()).thenAnswer(
          (_) => Future.value(
            Future.value(
              GoogleMaps.LatLngBounds(
                northeast: GoogleMaps.LatLng(
                  1,
                  1,
                ),
                southwest: GoogleMaps.LatLng(
                  0,
                  0,
                ),
              ),
            ),
          ),
        );
        await googleAtlasController?.getVisibleArea();
        verify(googleMapController?.getVisibleRegion()).called(1);
      });
    });
  });
}
