import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:atlas/atlas.dart';

class MockProvider extends Mock implements Provider {}

main() {
  group('Atlas', () {
    Provider provider;

    setUp(() {
      provider = MockProvider();
      AtlasProvider.instance = provider;
    });

    testWidgets('should throw exception if cameraPosition is null',
        (WidgetTester tester) async {
      try {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Atlas(
                cameraPosition: null,
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
      final CameraPosition cameraPosition = CameraPosition(
        target: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 14.4746,
      );
      final mapKey = Key('__atlas_map__');
      when(provider.build(
        cameraPosition: cameraPosition,
        markers: Set<Marker>(),
        showMyLocation: false,
        showMyLocationButton: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              cameraPosition: cameraPosition,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          cameraPosition: cameraPosition,
          markers: Set<Marker>(),
          showMyLocation: false,
          showMyLocationButton: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when map markers are provided',
        (WidgetTester tester) async {
      final CameraPosition cameraPosition = CameraPosition(
        target: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 14.4746,
      );
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
      final mapKey = Key('__atlas_map__');
      when(provider.build(
        cameraPosition: cameraPosition,
        markers: markers,
        showMyLocation: false,
        showMyLocationButton: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              cameraPosition: cameraPosition,
              markers: markers,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          cameraPosition: cameraPosition,
          markers: markers,
          showMyLocation: false,
          showMyLocationButton: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when onTap is provided',
        (WidgetTester tester) async {
      final CameraPosition cameraPosition = CameraPosition(
        target: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 14.4746,
      );
      final Function(LatLng) onTap = (LatLng position) {
        print('onTap ${position.latitude}, ${position.latitude}');
      };
      final mapKey = Key('__atlas_map__');
      when(provider.build(
        cameraPosition: cameraPosition,
        markers: Set<Marker>(),
        onTap: onTap,
        showMyLocation: false,
        showMyLocationButton: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              cameraPosition: cameraPosition,
              onTap: onTap,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          cameraPosition: cameraPosition,
          markers: Set<Marker>(),
          onTap: onTap,
          showMyLocation: false,
          showMyLocationButton: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when showMyLocation is enabled',
        (WidgetTester tester) async {
      final CameraPosition cameraPosition = CameraPosition(
        target: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 14.4746,
      );
      final mapKey = Key('__atlas_map__');
      when(provider.build(
        cameraPosition: cameraPosition,
        markers: Set<Marker>(),
        showMyLocation: true,
        showMyLocationButton: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              cameraPosition: cameraPosition,
              showMyLocation: true,
              showMyLocationButton: false,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          cameraPosition: cameraPosition,
          markers: Set<Marker>(),
          showMyLocation: true,
          showMyLocationButton: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when showMyLocation is not provided',
        (WidgetTester tester) async {
      final CameraPosition cameraPosition = CameraPosition(
        target: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 14.4746,
      );
      final mapKey = Key('__atlas_map__');
      when(provider.build(
        cameraPosition: cameraPosition,
        markers: Set<Marker>(),
        showMyLocation: false,
        showMyLocationButton: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              cameraPosition: cameraPosition,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          cameraPosition: cameraPosition,
          markers: Set<Marker>(),
          showMyLocation: false,
          showMyLocationButton: false,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when showMyLocationButton is enabled',
        (WidgetTester tester) async {
      final CameraPosition cameraPosition = CameraPosition(
        target: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 14.4746,
      );
      final mapKey = Key('__atlas_map__');
      when(provider.build(
        cameraPosition: cameraPosition,
        markers: Set<Marker>(),
        showMyLocation: true,
        showMyLocationButton: true,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              cameraPosition: cameraPosition,
              showMyLocation: true,
              showMyLocationButton: true,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          cameraPosition: cameraPosition,
          markers: Set<Marker>(),
          showMyLocation: true,
          showMyLocationButton: true,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when showMyLocationButton is not provided',
        (WidgetTester tester) async {
      final CameraPosition cameraPosition = CameraPosition(
        target: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 14.4746,
      );
      final mapKey = Key('__atlas_map__');
      when(provider.build(
        cameraPosition: cameraPosition,
        markers: Set<Marker>(),
        showMyLocation: false,
        showMyLocationButton: false,
      )).thenReturn(Container(key: mapKey));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Atlas(
              cameraPosition: cameraPosition,
            ),
          ),
        ),
      );
      expect(find.byKey(mapKey), findsOneWidget);
      verify(
        provider.build(
          cameraPosition: cameraPosition,
          markers: Set<Marker>(),
          showMyLocation: false,
          showMyLocationButton: false,
        ),
      ).called(1);
    });
  });
}
