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
        showMyLocation: false,
        showMyLocationButton: false,
        currentMapType: MapType.normal,
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
          showMyLocation: false,
          showMyLocationButton: false,
          currentMapType: MapType.normal,
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
        showMyLocation: false,
        showMyLocationButton: false,
        currentMapType: MapType.normal,
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
          showMyLocation: false,
          showMyLocationButton: false,
          currentMapType: MapType.normal,
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
        showMyLocation: false,
        showMyLocationButton: false,
        currentMapType: MapType.normal,
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
          showMyLocation: false,
          showMyLocationButton: false,
          currentMapType: MapType.normal,
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
        circles: circles,
        showMyLocation: false,
        showMyLocationButton: false,
        currentMapType: MapType.normal,
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
          circles: circles,
          showMyLocation: false,
          showMyLocationButton: false,
          currentMapType: MapType.normal,
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
        onTap: onTap,
        showMyLocation: false,
        showMyLocationButton: false,
        currentMapType: MapType.normal,
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
          onTap: onTap,
          showMyLocation: false,
          showMyLocationButton: false,
          currentMapType: MapType.normal,
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
        onLongPress: onLongPress,
        showMyLocation: false,
        showMyLocationButton: false,
        currentMapType: MapType.normal,
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
          onLongPress: onLongPress,
          showMyLocation: false,
          showMyLocationButton: false,
          currentMapType: MapType.normal,
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
        showMyLocation: true,
        showMyLocationButton: false,
        currentMapType: MapType.normal,
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
          showMyLocation: true,
          showMyLocationButton: false,
          currentMapType: MapType.normal,
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
        showMyLocation: false,
        showMyLocationButton: false,
        currentMapType: MapType.normal,
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
          showMyLocation: false,
          showMyLocationButton: false,
          currentMapType: MapType.normal,
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
        showMyLocation: false,
        showMyLocationButton: true,
        currentMapType: MapType.normal,
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
          showMyLocation: false,
          showMyLocationButton: true,
          currentMapType: MapType.normal,
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
        showMyLocation: false,
        showMyLocationButton: false,
        currentMapType: MapType.normal,
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
          showMyLocation: false,
          showMyLocationButton: false,
          currentMapType: MapType.normal,
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when currentMapType is supplied',
        (WidgetTester tester) async {
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        circles: Set<Circle>(),
        showMyLocation: false,
        showMyLocationButton: false,
        currentMapType: MapType.normal,
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
          showMyLocation: false,
          showMyLocationButton: false,
          currentMapType: MapType.normal,
        ),
      ).called(1);
    });
  });
}
