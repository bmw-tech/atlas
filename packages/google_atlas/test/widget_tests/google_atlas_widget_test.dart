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
    LatLng position;

    setUp(() {
      googleAtlas = GoogleAtlas();
      AtlasProvider.instance = googleAtlas;
      position = LatLng(
        latitude: 41.8781,
        longitude: -87.6298,
      );
      fakePlatformViewsController.reset();
    });

    testWidgets(
        'should return correct GoogleMap with initial camera position and no markers',
        (WidgetTester tester) async {
      final expectedPosition = GoogleMaps.LatLng(41.8781, -87.6298);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          position: position,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition.target, expectedPosition);
      expect(platformGoogleMap.markersToAdd.length, 0);
      expect(platformGoogleMap.mapType, GoogleMaps.MapType.normal);
    });

    testWidgets(
        'should return correct GoogleMap when build is called one marker',
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
          position: position,
          markers: mockMarker,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.markersToAdd.length, 1);
      expect(
        platformGoogleMap.cameraTargetBounds.bounds,
        GoogleMaps.LatLngBounds(
          northeast: GoogleMaps.LatLng(41.8781, -87.6298),
          southwest: GoogleMaps.LatLng(41.8781, -87.6298),
        ),
      );

      final GoogleMaps.Marker actualMarker =
          platformGoogleMap.markersToAdd.first;
      expect(platformGoogleMap.markerIdsToRemove.isEmpty, true);
      expect(actualMarker, equals(expectedMarker));
    });

    testWidgets('able to give a Marker a MapIcon', (WidgetTester tester) async {
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
            icon: MarkerIcon(
              assetName: 'assets/butterfly.png',
            ))
      ]);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          position: position,
          markers: mockMarker,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.markersToAdd.length, 1);
      expect(
        platformGoogleMap.cameraTargetBounds.bounds,
        GoogleMaps.LatLngBounds(
          northeast: GoogleMaps.LatLng(41.8781, -87.6298),
          southwest: GoogleMaps.LatLng(41.8781, -87.6298),
        ),
      );

      final GoogleMaps.Marker actualMarker =
          platformGoogleMap.markersToAdd.first;
      expect(platformGoogleMap.markerIdsToRemove.isEmpty, true);
      expect(actualMarker, equals(expectedMarker));
    });

    testWidgets(
        'should return correct GoogleMap when build is called with multiple markers',
        (WidgetTester tester) async {
      final GoogleMaps.Marker expectedFirstMarker = GoogleMaps.Marker(
        markerId: GoogleMaps.MarkerId('marker-1'),
        onTap: () {},
        position: GoogleMaps.LatLng(41.8781, -87.6298),
      );

      final GoogleMaps.Marker expectedSecondMarker = GoogleMaps.Marker(
        markerId: GoogleMaps.MarkerId('marker-2'),
        onTap: () {},
        position: GoogleMaps.LatLng(44.8781, -83.6298),
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
        ),
        Marker(
          id: 'marker-2',
          position: LatLng(
            latitude: 44.8781,
            longitude: -83.6298,
          ),
          onTap: () {
            print('tapped marker-2');
          },
        )
      ]);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          position: position,
          markers: mockMarker,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.markersToAdd.length, 2);
      expect(
        platformGoogleMap.cameraTargetBounds.bounds,
        GoogleMaps.LatLngBounds(
          northeast: GoogleMaps.LatLng(44.8781, -83.6298),
          southwest: GoogleMaps.LatLng(38.8781, -91.6298),
        ),
      );

      final GoogleMaps.Marker firstActualMarker =
          platformGoogleMap.markersToAdd.first;
      expect(firstActualMarker, equals(expectedFirstMarker));

      final GoogleMaps.Marker secondActualMarker =
          platformGoogleMap.markersToAdd.last;
      expect(secondActualMarker, equals(expectedSecondMarker));

      expect(platformGoogleMap.markerIdsToRemove.isEmpty, true);
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
            position: position,
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
          home: AtlasTestSample(position: position, onTap: mockOnTap),
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
      final expectedPosition = GoogleMaps.LatLng(41.8781, -87.6298);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          position: position,
          showMyLocation: false,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition.target, expectedPosition);
      expect(platformGoogleMap.myLocationEnabled, false);
    });

    testWidgets(
        'should return correct GoogleMap when called with showMyLocation = true',
        (WidgetTester tester) async {
      final expectedPosition = GoogleMaps.LatLng(41.8781, -87.6298);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          position: position,
          showMyLocation: true,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition.target, expectedPosition);
      expect(platformGoogleMap.myLocationEnabled, true);
    });

    testWidgets(
        'should return correct GoogleMap and myLocationEnabled false when called without showMyLocation',
        (WidgetTester tester) async {
      final expectedPosition = GoogleMaps.LatLng(41.8781, -87.6298);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          position: position,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition.target, expectedPosition);
      expect(platformGoogleMap.myLocationEnabled, false);
    });

    testWidgets(
        'should return correct GoogleMap when called with showMyLocationButton = false',
        (WidgetTester tester) async {
      final expectedPosition = GoogleMaps.LatLng(41.8781, -87.6298);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          position: position,
          showMyLocationButton: false,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition.target, expectedPosition);
      expect(platformGoogleMap.myLocationButtonEnabled, false);
    });

    testWidgets(
        'should return correct GoogleMap when called with showMyLocationButton = true',
        (WidgetTester tester) async {
      final expectedPosition = GoogleMaps.LatLng(41.8781, -87.6298);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          position: position,
          showMyLocationButton: true,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition.target, expectedPosition);
      expect(platformGoogleMap.myLocationButtonEnabled, true);
    });

    testWidgets(
        'should return correct GoogleMap and myLocationButtonEnabled false when called without showMyLocationButton',
        (WidgetTester tester) async {
      final expectedPosition = GoogleMaps.LatLng(41.8781, -87.6298);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          position: position,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition.target, expectedPosition);
      expect(platformGoogleMap.myLocationButtonEnabled, false);
    });

    testWidgets('should change current position when camera position changes',
        (WidgetTester tester) async {
      final expectedPosition = GoogleMaps.LatLng(41.8781, -87.6298);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          position: position,
        ),
      ));

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('TestButton')));
      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition.target, expectedPosition);
    });
  });
}

class AtlasTestSample extends StatefulWidget {
  final LatLng position;
  final Set<Marker> markers;
  final bool showMyLocation;
  final bool showMyLocationButton;
  final ArgumentCallback<LatLng> onTap;

  AtlasTestSample({
    @required this.position,
    this.markers,
    this.showMyLocation,
    this.showMyLocationButton,
    this.onTap,
  });

  State<AtlasTestSample> createState() => _AtlasTestSampleState(
        position: this.position,
        markers: this.markers,
        showMyLocation: this.showMyLocation,
        showMyLocationButton: this.showMyLocationButton,
        onTap: this.onTap,
      );
}

class _AtlasTestSampleState extends State<AtlasTestSample> {
  LatLng position;
  final Set<Marker> markers;
  final bool showMyLocation;
  final bool showMyLocationButton;
  final ArgumentCallback<LatLng> onTap;

  _AtlasTestSampleState({
    @required this.position,
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
            position: position,
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
                        position = LatLng(
                          latitude: 41.8661,
                          longitude: -90.1070,
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
