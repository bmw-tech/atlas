import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';
import 'package:google_atlas/src/utils/utils.dart';

main() {
  group('CameraUtils', () {
    group('toGoogleCameraPosition', () {
      test('returns correct cameraPosition', () {
        final result = CameraUtils.toGoogleCameraPosition(
          CameraPosition(
            target: LatLng(latitude: 10.1, longitude: -80.8),
            zoom: 12,
          ),
        );
        expect(result.target.latitude, 10.1);
        expect(result.target.longitude, -80.8);
        expect(result.zoom, 12);
      });
    });
  });
}
