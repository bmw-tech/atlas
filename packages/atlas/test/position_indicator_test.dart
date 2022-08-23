import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("Position Indicator", () {
    test("Test field by field", () {
      final positionIndLatLng = LatLng(
        latitude: 38.7439498,
        longitude: -9.1490721,
      );
      final bearingInDegrees = 120.0;
      final style = PositionIndicatorStyle.pedestrian;
      final isActive = true;
      final indicator = PositionIndicator(
        style: PositionIndicatorStyle.pedestrian,
        latLng: positionIndLatLng,
        isActive: isActive,
        bearingInDegrees: bearingInDegrees,
      );

      expect(indicator.bearingInDegrees, bearingInDegrees);
      expect(indicator.latLng, positionIndLatLng);
      expect(indicator.style, style);
      expect(indicator.isActive, isActive);
    });

    test("Style to String", () {
      expect(PositionIndicatorStyle.navigator.styleToString(), "navigator");
      expect(PositionIndicatorStyle.pedestrian.styleToString(), "pedestrian");
    });

    test("copyWith", () {
      final positionIndLatLng = LatLng(
        latitude: 38.7439498,
        longitude: -9.1490721,
      );
      final bearingInDegrees = 20.0;
      final indicator = PositionIndicator(
        style: PositionIndicatorStyle.pedestrian,
        latLng: positionIndLatLng,
        isActive: true,
        bearingInDegrees: bearingInDegrees,
      );

      final sameIndicator = indicator.copyWith();

      expect(sameIndicator, indicator);
    });
  });
}
