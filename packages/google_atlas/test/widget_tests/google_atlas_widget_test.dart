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

  group('GoogleAtlasProvider Test', () {
    Provider provider;

    setUp(() {
      provider = GoogleAtlasProviderSample();
    });

    test('provider creates and supplies maptypes', () {
      expect(provider.supportedMapTypes,
          {MapType.normal, MapType.satellite, MapType.terrain});
    });
  });

  group('GoogleAtlas Widget Test', () {
    GoogleAtlas googleAtlas;
    CameraPosition initialCameraPosition;

    setUp(() {
      googleAtlas = GoogleAtlas();
      AtlasProvider.instance = googleAtlas;
      initialCameraPosition = CameraPosition(
        target: LatLng(
          latitude: 41.8781,
          longitude: -87.6298,
        ),
        zoom: 12,
      );
      fakePlatformViewsController.reset();
    });

    testWidgets(
        'should return correct GoogleMap with initial camera position and no markers',
        (WidgetTester tester) async {
      final expectedPosition = GoogleMaps.LatLng(41.8781, -87.6298);
      final expectedZoom = 12;

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          initialCameraPosition: initialCameraPosition,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.cameraPosition.target, expectedPosition);
      expect(platformGoogleMap.cameraPosition.zoom, expectedZoom);
      expect(platformGoogleMap.markersToAdd.length, 0);
      expect(platformGoogleMap.mapType, GoogleMaps.MapType.normal);
    });

    testWidgets('should return correct GoogleMap with showTraffic set to true',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          initialCameraPosition: initialCameraPosition,
          showTraffic: true,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.trafficEnabled, true);
    });
    testWidgets(
        'should return correct GoogleMap with mapType set to normal type',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          initialCameraPosition: initialCameraPosition,
          mapType: MapType.normal,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.mapType, GoogleMaps.MapType.normal);
    });

    testWidgets(
        'should return correct GoogleMap with mapType set to satellite type',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          initialCameraPosition: initialCameraPosition,
          mapType: MapType.satellite,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.mapType, GoogleMaps.MapType.satellite);
    });

    testWidgets(
        'should return correct GoogleMap with mapType set to terrain type',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          initialCameraPosition: initialCameraPosition,
          mapType: MapType.terrain,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.mapType, GoogleMaps.MapType.terrain);
    });

    testWidgets(
        'should return correct GoogleMap with mapType set to hybrid type',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          initialCameraPosition: initialCameraPosition,
          mapType: MapType.hybrid,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.mapType, GoogleMaps.MapType.hybrid);
    });
    testWidgets(
        'should return correct GoogleMap when build is called one marker',
        (WidgetTester tester) async {
      final GoogleMaps.Marker expectedMarker = GoogleMaps.Marker(
        markerId: GoogleMaps.MarkerId('marker-1'),
        position: GoogleMaps.LatLng(41.8781, -87.6298),
      );

      final Set<Marker> mockMarker = Set<Marker>.from([
        Marker(
          id: 'marker-1',
          position: LatLng(
            latitude: 41.8781,
            longitude: -87.6298,
          ),
        )
      ]);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          initialCameraPosition: initialCameraPosition,
          markers: mockMarker,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.markersToAdd.length, 1);

      final GoogleMaps.Marker actualMarker =
          platformGoogleMap.markersToAdd.first;
      expect(platformGoogleMap.markerIdsToRemove.isEmpty, true);
      expect(actualMarker, equals(expectedMarker));
    });

    testWidgets('able to give a Marker a MapIcon', (WidgetTester tester) async {
      final GoogleMaps.Marker expectedMarker = GoogleMaps.Marker(
        markerId: GoogleMaps.MarkerId('marker-1'),
        position: GoogleMaps.LatLng(41.8781, -87.6298),
      );

      final Set<Marker> mockMarker = Set<Marker>.from([
        Marker(
            id: 'marker-1',
            position: LatLng(
              latitude: 41.8781,
              longitude: -87.6298,
            ),
            icon: MarkerIcon(
              assetName: 'assets/butterfly.png',
            ))
      ]);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          initialCameraPosition: initialCameraPosition,
          markers: mockMarker,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.markersToAdd.length, 1);

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
        position: GoogleMaps.LatLng(41.8781, -87.6298),
      );

      final GoogleMaps.Marker expectedSecondMarker = GoogleMaps.Marker(
        markerId: GoogleMaps.MarkerId('marker-2'),
        position: GoogleMaps.LatLng(44.8781, -83.6298),
      );

      final Set<Marker> mockMarker = Set<Marker>.from([
        Marker(
          id: 'marker-1',
          position: LatLng(
            latitude: 41.8781,
            longitude: -87.6298,
          ),
        ),
        Marker(
          id: 'marker-2',
          position: LatLng(
            latitude: 44.8781,
            longitude: -83.6298,
          ),
        )
      ]);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          initialCameraPosition: initialCameraPosition,
          markers: mockMarker,
        ),
      ));

      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(platformGoogleMap.markersToAdd.length, 2);

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
      final ArgumentCallback<LatLng> mockOnLongPress = (LatLng position) {
        print('hello');
      };

      try {
        await tester.pumpWidget(MaterialApp(
          title: 'Atlas Test Sample with Google Provider',
          home: AtlasTestSample(
            initialCameraPosition: initialCameraPosition,
            onLongPress: mockOnLongPress,
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
        'should return correct GoogleMap when build is called without onLongPress',
        (WidgetTester tester) async {
      final ArgumentCallback<LatLng> mockOnTap = (LatLng position) {
        print('hello');
      };

      try {
        await tester.pumpWidget(MaterialApp(
          title: 'Atlas Test Sample with Google Provider',
          home: AtlasTestSample(
            initialCameraPosition: initialCameraPosition,
            onTap: mockOnTap,
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
          home: AtlasTestSample(
            initialCameraPosition: initialCameraPosition,
            onTap: mockOnTap,
          ),
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

    /* Track Google Maps Flutter Plugin Issue on better interactive testing.
      Had to test this way due to existing limitations.
    */
    testWidgets(
        'should return correct GoogleMap when build is called with onLongPress',
        (WidgetTester tester) async {
      int onLongPressCallCount = 0;
      LatLng onLongPressPosition;
      final ArgumentCallback<LatLng> mockOnLongPress = (LatLng position) {
        onLongPressCallCount++;
        onLongPressPosition = position;
      };

      try {
        await tester.pumpWidget(MaterialApp(
          title: 'Atlas Test Sample with Google Provider',
          home: AtlasTestSample(
            initialCameraPosition: initialCameraPosition,
            onLongPress: mockOnLongPress,
          ),
        ));

        await tester.pumpAndSettle();

        final googleMap =
            find.byType(GoogleMaps.GoogleMap).evaluate().first.widget;
        (googleMap as GoogleMaps.GoogleMap)
            .onLongPress(GoogleMaps.LatLng(0, 0));

        expect(onLongPressCallCount, 1);
        expect(onLongPressPosition.latitude, 0.0);
        expect(onLongPressPosition.longitude, 0.0);
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
          initialCameraPosition: initialCameraPosition,
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
          initialCameraPosition: initialCameraPosition,
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
          initialCameraPosition: initialCameraPosition,
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
          initialCameraPosition: initialCameraPosition,
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
          initialCameraPosition: initialCameraPosition,
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
          initialCameraPosition: initialCameraPosition,
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
      final expectedPosition = GoogleMaps.LatLng(41.8661, -90.1070);

      await tester.pumpWidget(MaterialApp(
        title: 'Atlas Test Sample with Google Provider',
        home: AtlasTestSample(
          initialCameraPosition: initialCameraPosition,
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

class GoogleAtlasProviderSample extends Provider {
  @override
  Set<MapType> get supportedMapTypes => {
        MapType.normal,
        MapType.satellite,
        MapType.terrain,
      };
  @override
  Widget build({
    CameraPosition initialCameraPosition,
    Set<Marker> markers,
    Set<Circle> circles,
    Set<Polygon> polygons,
    Set<Polyline> polylines,
    ArgumentCallback<LatLng> onTap,
    ArgumentCallback<LatLng> onLongPress,
    ArgumentCallback<AtlasController> onMapCreated,
    ArgumentCallback<CameraPosition> onCameraPositionChanged,
    bool showMyLocation,
    bool showMyLocationButton,
    MapType mapType,
    bool showTraffic,
  }) {
    return AtlasTestSample(
      initialCameraPosition: initialCameraPosition,
      markers: markers,
      showMyLocation: showMyLocation,
      showMyLocationButton: showMyLocationButton,
      mapType: mapType,
      showTraffic: showTraffic,
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}

class AtlasTestSample extends StatefulWidget {
  final CameraPosition initialCameraPosition;
  final Set<Marker> markers;
  final bool showMyLocation;
  final bool showMyLocationButton;
  final MapType mapType;
  final bool showTraffic;
  final ArgumentCallback<LatLng> onTap;
  final ArgumentCallback<LatLng> onLongPress;

  AtlasTestSample({
    @required this.initialCameraPosition,
    this.markers,
    this.showMyLocation,
    this.showMyLocationButton,
    this.mapType,
    this.showTraffic,
    this.onTap,
    this.onLongPress,
  });

  State<AtlasTestSample> createState() => _AtlasTestSampleState(
        initialCameraPosition: this.initialCameraPosition,
        markers: this.markers,
        showMyLocation: this.showMyLocation,
        showMyLocationButton: this.showMyLocationButton,
        mapType: this.mapType,
        showTraffic: this.showTraffic,
        onTap: this.onTap,
        onLongPress: this.onLongPress,
      );
}

class _AtlasTestSampleState extends State<AtlasTestSample> {
  final CameraPosition initialCameraPosition;
  final Set<Marker> markers;
  final bool showMyLocation;
  final bool showMyLocationButton;
  final MapType mapType;
  final bool showTraffic;
  final ArgumentCallback<LatLng> onTap;
  final ArgumentCallback<LatLng> onLongPress;
  AtlasController _controller;

  _AtlasTestSampleState({
    @required this.initialCameraPosition,
    this.markers,
    this.showMyLocation,
    this.showMyLocationButton,
    this.mapType,
    this.showTraffic,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Atlas(
            key: Key('TestAtlas'),
            initialCameraPosition: initialCameraPosition,
            markers: this.markers ?? Set(),
            showMyLocation: this.showMyLocation ?? false,
            showMyLocationButton: this.showMyLocationButton ?? false,
            mapType: this.mapType ?? MapType.normal,
            showTraffic: this.showTraffic ?? false,
            onTap: this.onTap ?? null,
            onLongPress: this.onLongPress ?? null,
            onMapCreated: (controller) {
              _controller = controller;
            },
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
                      _controller?.moveCamera(
                        CameraPosition(
                          target: LatLng(
                            latitude: 41.8661,
                            longitude: -90.1070,
                          ),
                          zoom: 12,
                        ),
                      );
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
