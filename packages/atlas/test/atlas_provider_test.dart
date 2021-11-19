import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:atlas/atlas.dart';

class MockAtlasProvider extends Mock implements Provider {}

main() {
  group('AtlasProvider', () {
    test('should return null provider when it is not set', () {
      expect(AtlasProvider.instance, isNull);
    });

    test('should return correct provider when it is set', () {
      final mockProvider = MockAtlasProvider();
      AtlasProvider.instance = mockProvider;
      expect(AtlasProvider.instance, mockProvider);
    });
  });
}
