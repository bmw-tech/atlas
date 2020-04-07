import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:atlas/atlas.dart';

class MockProvider extends Mock implements Provider {}

main() {
  group('Atlas', () {
    Provider provider;
    final CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      ),
      zoom: 12,
    );
    final mapKey = Key('__atlas_map__');

    setUp(() {
      provider = MockProvider();
      AtlasProvider.instance = provider;
    });

    testWidgets('should throw exception if initialCameraPosition is null',
        (WidgetTester tester) async {
      try {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Atlas(
                initialCameraPosition: null,
              ),
            ),
          ),
        );
        fail('should throw AssertionError');
      } catch (error) {
        expect(error, isAssertionError);
      }
    });

    testWidgets(
        'should call provider build method with correct arguments when no map markers are provided',
        (WidgetTester tester) async {
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        circles: Set<Circle>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        showMyLocation: false,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          circles: Set<Circle>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          showMyLocation: false,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when map markers are provided',
        (WidgetTester tester) async {
      final Set<Marker> markers = [
        Marker(
          id: '0',
          position: LatLng(
            latitude: 37.42796133580664,
            longitude: -122.085749655962,
          ),
          onTap: () {
            print('tapped!');
          },
        ),
      ].toSet();

      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        circles: Set<Circle>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        showMyLocation: false,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
              markers: markers,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: markers,
          circles: Set<Circle>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          showMyLocation: false,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when no map circles are provided',
        (WidgetTester tester) async {
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        circles: Set<Circle>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        showMyLocation: false,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          circles: Set<Circle>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          showMyLocation: false,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when map circles are provided',
        (WidgetTester tester) async {
      final Set<Circle> circles = [
        Circle(
          id: '0',
          center: LatLng(
            latitude: 38.7439498,
            longitude: -9.1490721,
          ),
          radiusInMeters: 10.0,
        ),
      ].toSet();

      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        circles: circles,
        showMyLocation: false,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
              circles: circles,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          circles: circles,
          showMyLocation: false,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when map polygons are provided',
        (WidgetTester tester) async {
      final Set<Polygon> polygons = [
        Polygon(
          id: "polygon_1",
          points: [
            LatLng(
              latitude: 48.133,
              longitude: 11.5888,
            ),
            LatLng(
              latitude: 48.233,
              longitude: 11.5888,
            ),
            LatLng(
              latitude: 48.333,
              longitude: 11.4888,
            ),
          ],
          fillColor: Colors.red,
          strokeColor: Colors.red,
          strokeWidth: 1,
        ),
      ].toSet();

      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        polygons: polygons,
        polylines: Set<Polyline>(),
        circles: Set<Circle>(),
        showMyLocation: false,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
              polygons: polygons,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          polygons: polygons,
          polylines: Set<Polyline>(),
          circles: Set<Circle>(),
          showMyLocation: false,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });
    testWidgets(
        'should call provider build method with correct arguments when map polyline are provided',
        (WidgetTester tester) async {
      final Set<Polyline> polylines = [
        Polyline(
          id: '0',
          points: [
            LatLng(
              latitude: 38.7439498,
              longitude: -9.1490721,
            ),
            LatLng(
              latitude: 36.7439498,
              longitude: 126.1490721,
            )
          ],
        ),
      ].toSet();

      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        polygons: Set<Polygon>(),
        polylines: polylines,
        circles: Set<Circle>(),
        showMyLocation: false,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
              polylines: polylines,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          polygons: Set<Polygon>(),
          polylines: polylines,
          circles: Set<Circle>(),
          showMyLocation: false,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when onTap is provided',
        (WidgetTester tester) async {
      final Function(LatLng) onTap = (LatLng position) {
        print('onTap ${position.latitude}, ${position.latitude}');
      };
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        circles: Set<Circle>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        onTap: onTap,
        showMyLocation: false,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
              onTap: onTap,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          circles: Set<Circle>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          onTap: onTap,
          showMyLocation: false,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when onLongPress is provided',
        (WidgetTester tester) async {
      final Function(LatLng) onLongPress = (LatLng position) {
        print('onLongPress ${position.latitude}, ${position.latitude}');
      };
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        circles: Set<Circle>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        onLongPress: onLongPress,
        showMyLocation: false,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
              onLongPress: onLongPress,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          circles: Set<Circle>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          onLongPress: onLongPress,
          showMyLocation: false,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when showMyLocation is enabled',
        (WidgetTester tester) async {
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        circles: Set<Circle>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        showMyLocation: true,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
              showMyLocation: true,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          circles: Set<Circle>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          showMyLocation: true,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when showMyLocation is not provided',
        (WidgetTester tester) async {
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        circles: Set<Circle>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        showMyLocation: false,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          circles: Set<Circle>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          showMyLocation: false,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when showMyLocationButton is enabled',
        (WidgetTester tester) async {
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        circles: Set<Circle>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        showMyLocation: false,
        showMyLocationButton: true,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
              showMyLocation: false,
              showMyLocationButton: true,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          circles: Set<Circle>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          showMyLocation: false,
          showMyLocationButton: true,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when showMyLocationButton is not provided',
        (WidgetTester tester) async {
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        circles: Set<Circle>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        showMyLocation: false,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          circles: Set<Circle>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          showMyLocation: false,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when mapType is supplied',
        (WidgetTester tester) async {
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        circles: Set<Circle>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        showMyLocation: false,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          circles: Set<Circle>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          showMyLocation: false,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when showTraffic is enabled',
        (WidgetTester tester) async {
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        circles: Set<Circle>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        showMyLocation: false,
        showMyLocationButton: false,
        followMyLocation: false,
        mapType: MapType.normal,
        showTraffic: true,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
              showTraffic: true,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          circles: Set<Circle>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          showMyLocation: false,
          showMyLocationButton: false,
          followMyLocation: false,
          mapType: MapType.normal,
          showTraffic: true,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when followMyLocation is enabled',
        (WidgetTester tester) async {
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        circles: Set<Circle>(),
        polygons: Set<Polygon>(),
        polylines: Set<Polyline>(),
        showMyLocation: true,
        showMyLocationButton: true,
        followMyLocation: true,
        mapType: MapType.normal,
        showTraffic: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              initialCameraPosition: initialCameraPosition,
              showMyLocation: true,
              showMyLocationButton: true,
              followMyLocation: true,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          initialCameraPosition: initialCameraPosition,
          markers: Set<Marker>(),
          circles: Set<Circle>(),
          polygons: Set<Polygon>(),
          polylines: Set<Polyline>(),
          showMyLocation: true,
          showMyLocationButton: true,
          followMyLocation: true,
          mapType: MapType.normal,
          showTraffic: false,
        ),
      ).called(1);
    });
  });
}
