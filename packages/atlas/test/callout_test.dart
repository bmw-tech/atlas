import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';

main() {
  group('Marker MarkerAnnotation', () {
    test('should override == properly', () {
      final markerIcon = MarkerIcon(
        assetName: 'my-asset',
      );

      expect(
          Annotation(
            title: 'MarkerAnnotation-title',
            subTitle: 'MarkerAnnotation-subTitle',
            icon: markerIcon,
          ),
          Annotation(
              title: 'MarkerAnnotation-title',
              subTitle: 'MarkerAnnotation-subTitle',
              icon: markerIcon,
              annotationType: AnnotationType.normal));
    });

    test('should override hashCode properly', () {
      final markerIcon = MarkerIcon(
        assetName: 'my-asset',
      );

      final annotation = Annotation(
        title: 'MarkerAnnotation-title',
        subTitle: 'MarkerAnnotation-subTitle',
        icon: markerIcon,
        annotationType: AnnotationType.normal,
      );
      expect(
        annotation.hashCode,
        annotation.title.hashCode ^
            annotation.subTitle.hashCode ^
            annotation.icon.hashCode ^
            annotation.annotationType.hashCode,
      );
    });
  });
}
