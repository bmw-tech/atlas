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
      final CameraPosition initialCameraPosition = CameraPosition(
        target: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 14.4746,
      );
      final mapKey = Key('__atlas_map__');
      when(provider.build(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
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
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when map markers are provided',
        (WidgetTester tester) async {
      final CameraPosition initialCameraPosition = CameraPosition(
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
        initialCameraPosition: initialCameraPosition,
        markers: markers,
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
        ),
      ).called(1);
    });

    testWidgets(
        'should call provider build method with correct arguments when onTap is provided',
        (WidgetTester tester) async {
      final CameraPosition initialCameraPosition = CameraPosition(
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
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>(),
        onTap: onTap,
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
          onTap: onTap,
        ),
      ).called(1);
    });
  });
}
