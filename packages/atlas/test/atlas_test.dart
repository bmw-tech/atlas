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

    testWidgets('should call provider build method with correct arguments',
        (WidgetTester tester) async {
      final CameraPosition initialCameraPosition = CameraPosition(
        target: CoordinatePair(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 14.4746,
      );
      final mapKey = Key('__atlas_map__');
      when(provider.build(initialCameraPosition: initialCameraPosition))
          .thenReturn(Container(key: mapKey));
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
      verify(provider.build(initialCameraPosition: initialCameraPosition))
          .called(1);
    });
  });
}
