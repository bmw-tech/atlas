import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';
import 'package:google_atlas/google_atlas.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

import 'fake_maps_controller.dart';

main() {
  final FakePlatformViewsController fakePlatformViewsController =
      FakePlatformViewsController();

  setUpAll(() {
    SystemChannels.platform_views.setMockMethodCallHandler(
        fakePlatformViewsController.fakePlatformViewsMethodHandler);
  });

  group('GoogleAtlas Widget Test', () {
    GoogleAtlas googleAtlas;
    CameraPosition cameraPosition;

    setUp(() {
      googleAtlas = GoogleAtlas();
      AtlasProvider.instance = googleAtlas;
      cameraPosition = CameraPosition(
        target: LatLng(
          latitude: 41.8781,
          longitude: -87.6298,
        ),
        zoom: 14.4746,
      );
      fakePlatformViewsController.reset();
    });

    testWidgets(
        'should return correct GoogleMap with initial camera position and no markers',
        (WidgetTester tester) async {
      GoogleMaps.CameraPosition expectedCameraPosition =
          GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(41.8781, -87.6298),
        zoom: 14.4746,
      );

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          cameraPosition: cameraPosition,
        ),
      ));

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition, expectedCameraPosition);
      expect(platformGoogleMap.markersToAdd.length, 0);
      expect(platformGoogleMap.mapType, GoogleMaps.MapType.normal);
    });

    testWidgets(
        'should return correct GoogleMap when build is called with markers',
        (WidgetTester tester) async {
      final GoogleMaps.Marker expectedMarker = GoogleMaps.Marker(
        markerId: GoogleMaps.MarkerId('marker-1'),
        onTap: () {},
        position: GoogleMaps.LatLng(41.8781, -87.6298),
      );

      final Set<Marker> mockMarker = Set<Marker>.from([
        Marker(
          id: 'marker-1',
          position: LatLng(
            latitude: 41.8781,
            longitude: -87.6298,
          ),
          onTap: () {
            print('tapped marker-1');
          },
        )
      ]);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
            cameraPosition: cameraPosition, markers: mockMarker),
      ));

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.markersToAdd.length, 1);

      final GoogleMaps.Marker actualMarker =
          platformGoogleMap.markersToAdd.first;
      expect(platformGoogleMap.markerIdsToRemove.isEmpty, true);
      expect(actualMarker, equals(expectedMarker));
    });

    /* Track Google Maps Flutter Plugin Issue on better interactive testing.  
       Had to test this way due to existing limitations.
    */
    testWidgets(
        'should return correct GoogleMap when build is called without onTap',
        (WidgetTester tester) async {
      try {
        await tester.pumpWidget(MaterialApp(
          title: 'Atlas Test Sample with Google Provider',
          home: AtlasTestSample(
            cameraPosition: cameraPosition,
          ),
        ));

        await tester.pumpAndSettle();
        final googleMap =
            find.byType(GoogleMaps.GoogleMap).evaluate().first.widget;
        (googleMap as GoogleMaps.GoogleMap).onTap(GoogleMaps.LatLng(0, 0));
      } catch (_) {
        fail('should not throw');
      }
    });

    /* Track Google Maps Flutter Plugin Issue on better interactive testing.  
       Had to test this way due to existing limitations.
    */
    testWidgets(
        'should return correct GoogleMap when build is called with onTap',
        (WidgetTester tester) async {
      int onTapCallCount = 0;
      LatLng onTapPosition;
      final ArgumentCallback<LatLng> mockOnTap = (LatLng position) {
        onTapCallCount++;
        onTapPosition = position;
      };

      try {
        await tester.pumpWidget(MaterialApp(
          title: 'Atlas Test Sample with Google Provider',
          home:
              AtlasTestSample(cameraPosition: cameraPosition, onTap: mockOnTap),
        ));

        await tester.pumpAndSettle();

        final googleMap =
            find.byType(GoogleMaps.GoogleMap).evaluate().first.widget;
        (googleMap as GoogleMaps.GoogleMap).onTap(GoogleMaps.LatLng(0, 0));

        expect(onTapCallCount, 1);
        expect(onTapPosition.latitude, 0.0);
        expect(onTapPosition.longitude, 0.0);
      } catch (_) {
        fail("should not throw");
      }
    });

    testWidgets(
        'should return correct GoogleMap when build is called with showMyLocation = false',
        (WidgetTester tester) async {
      GoogleMaps.CameraPosition expectedCameraPosition =
          GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(41.8781, -87.6298),
        zoom: 14.4746,
      );

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          cameraPosition: cameraPosition,
          showMyLocation: false,
        ),
      ));

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition, expectedCameraPosition);
      expect(platformGoogleMap.myLocationEnabled, false);
    });

    testWidgets(
        'should return correct GoogleMap when called with showMyLocation = true',
        (WidgetTester tester) async {
      GoogleMaps.CameraPosition expectedCameraPosition =
          GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(41.8781, -87.6298),
        zoom: 14.4746,
      );

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          cameraPosition: cameraPosition,
          showMyLocation: true,
        ),
      ));

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition, expectedCameraPosition);
      expect(platformGoogleMap.myLocationEnabled, true);
    });

    testWidgets(
        'should return correct GoogleMap and myLocationEnabled false when called without showMyLocation',
        (WidgetTester tester) async {
      GoogleMaps.CameraPosition expectedCameraPosition =
          GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(41.8781, -87.6298),
        zoom: 14.4746,
      );

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          cameraPosition: cameraPosition,
        ),
      ));

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition, expectedCameraPosition);
      expect(platformGoogleMap.myLocationEnabled, false);
    });

    testWidgets(
        'should return correct GoogleMap when called with showMyLocationButton = false',
        (WidgetTester tester) async {
      GoogleMaps.CameraPosition expectedCameraPosition =
          GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(41.8781, -87.6298),
        zoom: 14.4746,
      );

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          cameraPosition: cameraPosition,
          showMyLocationButton: false,
        ),
      ));

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition, expectedCameraPosition);
      expect(platformGoogleMap.myLocationButtonEnabled, false);
    });

    testWidgets(
        'should return correct GoogleMap when called with showMyLocationButton = true',
        (WidgetTester tester) async {
      GoogleMaps.CameraPosition expectedCameraPosition =
          GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(41.8781, -87.6298),
        zoom: 14.4746,
      );

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          cameraPosition: cameraPosition,
          showMyLocationButton: true,
        ),
      ));

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition, expectedCameraPosition);
      expect(platformGoogleMap.myLocationButtonEnabled, true);
    });

    testWidgets(
        'should return correct GoogleMap and myLocationButtonEnabled false when called without showMyLocationButton',
        (WidgetTester tester) async {
      GoogleMaps.CameraPosition expectedCameraPosition =
          GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(41.8781, -87.6298),
        zoom: 14.4746,
      );

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          cameraPosition: cameraPosition,
        ),
      ));

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition, expectedCameraPosition);
      expect(platformGoogleMap.myLocationButtonEnabled, false);
    });

    testWidgets('should change current position when camera position changes',
        (WidgetTester tester) async {
      GoogleMaps.CameraPosition expectedCameraPosition =
          GoogleMaps.CameraPosition(
        target: GoogleMaps.LatLng(41.8661, -90.1070),
        zoom: 12.0,
      );

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          cameraPosition: cameraPosition,
        ),
      ));

      await tester.tap(find.byKey(Key('TestButton')));
      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition, expectedCameraPosition);
    });
  });
}

class AtlasTestSample extends StatefulWidget {
  final CameraPosition cameraPosition;
  final Set<Marker> markers;
  final bool showMyLocation;
  final bool showMyLocationButton;
  final ArgumentCallback<LatLng> onTap;

  AtlasTestSample({
    @required this.cameraPosition,
    this.markers,
    this.showMyLocation,
    this.showMyLocationButton,
    this.onTap,
  });

  State<AtlasTestSample> createState() => _AtlasTestSampleState(
        cameraPosition: this.cameraPosition,
        markers: this.markers,
        showMyLocation: this.showMyLocation,
        showMyLocationButton: this.showMyLocationButton,
        onTap: this.onTap,
      );
}

class _AtlasTestSampleState extends State<AtlasTestSample> {
  CameraPosition cameraPosition;
  final Set<Marker> markers;
  final bool showMyLocation;
  final bool showMyLocationButton;
  final ArgumentCallback<LatLng> onTap;

  _AtlasTestSampleState({
    @required this.cameraPosition,
    this.markers,
    this.showMyLocation,
    this.showMyLocationButton,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Atlas(
            key: Key('TestAtlas'),
            cameraPosition: cameraPosition,
            markers: this.markers ?? Set(),
            showMyLocation: this.showMyLocation ?? false,
            showMyLocationButton: this.showMyLocationButton ?? false,
            onTap: this.onTap ?? null,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: 175,
                right: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                      key: Key("TestButton"),
                      child: Icon(Icons.location_on),
                      onPressed: () {
                        setState(() {
                          cameraPosition = CameraPosition(
                            target: LatLng(
                              latitude: 41.8661,
                              longitude: -90.1070,
                            ),
                            zoom: 12.0,
                          );
                        });
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
