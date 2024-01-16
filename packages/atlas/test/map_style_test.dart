import 'package:atlas/src/map_style.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MapStyle', () {
    test('should return true when two MapStyle objects are equal', () {
      final style1 = MapStyle(light: 'light', dark: 'dark', satellite: 'satellite');
      final style2 = MapStyle(light: 'light', dark: 'dark', satellite: 'satellite');

      expect(style1, equals(style2));
    });

    test('should return false when two MapStyle objects are not equal', () {
      final style1 = MapStyle(light: 'light', dark: 'dark', satellite: 'satellite');
      final style2 = MapStyle(light: 'light', dark: 'dark', satellite: null);

      expect(style1, isNot(equals(style2)));
    });

    test('should have the same hashCode for equal MapStyle objects', () {
      final style1 = MapStyle(light: 'light', dark: 'dark', satellite: 'satellite');
      final style2 = MapStyle(light: 'light', dark: 'dark', satellite: 'satellite');

      expect(style1.hashCode, equals(style2.hashCode));
    });
  });
}
