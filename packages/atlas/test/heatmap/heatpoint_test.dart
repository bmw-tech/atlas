import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Heatpoint Tests', () {
    test('Heatpoint properties are correctly assigned', () {
      final position = LatLng(latitude: 37.7749, longitude: -122.4194);
      final id = 'testId';
      final counter = 42;

      final heatpoint = Heatpoint(id: id, position: position, counter: counter);

      expect(heatpoint.id, id);
      expect(heatpoint.position, position);
      expect(heatpoint.counter, counter);
    });
  });
}
