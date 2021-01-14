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
          final double expectedTopPadding = 2.0;
          final double expectedBottomPadding = 3.0;
          final double expectedLeftPadding = 4.0;
          final double expectedRightPadding = 5.0;
          final padding = Padding(
            defaultPadding: expectedDefaultPadding,
            bottomPadding: expectedBottomPadding,
            leftPadding: expectedLeftPadding,
            rightPadding: expectedRightPadding,
            topPadding: expectedTopPadding,
          );
          expect(padding.defaultPadding, expectedDefaultPadding);
          expect(padding.topPadding, expectedTopPadding);
          expect(padding.leftPadding, expectedLeftPadding);
          expect(padding.rightPadding, expectedRightPadding);
          expect(padding.bottomPadding, expectedBottomPadding);
        },
      );
    },
  );
}
