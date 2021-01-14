import 'package:atlas/atlas.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group(
    'Padding',
    () {
      test(
        'Should have correct properties',
        () {
          final double expectedDefaultPadding = 1.0;
          final double expectedTopPadding = 1.0;
          final double expectedBottomPadding = 1.0;
          final double expectedLeftPadding = 1.0;
          final double expectedRightPadding = 1.0;
          final padding = Padding(defaultPadding: expectedDefaultPadding);
          expect(padding.defaultPadding, expectedDefaultPadding);
          expect(padding.topPadding, expectedTopPadding);
          expect(padding.leftPadding, expectedBottomPadding);
          expect(padding.rightPadding, expectedLeftPadding);
          expect(padding.bottomPadding, expectedLeftPadding);
        },
      );
    },
  );
}
