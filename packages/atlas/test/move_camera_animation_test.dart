import 'package:flutter/animation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

class MockState extends Mock implements State<TestWidget> {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

class TestWidget extends StatefulWidget {
  @override
  MockState createState() => new MockState();
}

class MockStateTicker extends MockState with TickerProviderStateMixin {}

class MockLatLngTween extends Mock implements Tween<LatLng> {}

class MockDoubleTween extends Mock implements Tween<double> {}

main() {
  group('Move Camera Animation', () {
    test('should override == properly', () {
      var controller = AnimationController(vsync: MockStateTicker());
      var panSequence = TweenSequence<LatLng>(
          [TweenSequenceItem(tween: MockLatLngTween(), weight: 100.0)]);
      var zoomSequence = TweenSequence<double>(
          [TweenSequenceItem(tween: MockDoubleTween(), weight: 100.0)]);

      expect(
        MoveCameraAnimation(
          controller: controller,
          panSequence: panSequence,
          zoomSequence: zoomSequence,
        ),
        MoveCameraAnimation(
          controller: controller,
          panSequence: panSequence,
          zoomSequence: zoomSequence,
        ),
      );
    });

    test('should override hashCode properly', () {
      final moveCameraAnimation = MoveCameraAnimation(
        controller: AnimationController(vsync: MockStateTicker()),
        panSequence: TweenSequence<LatLng>(
            [TweenSequenceItem(tween: MockLatLngTween(), weight: 100.0)]),
        zoomSequence: TweenSequence<double>(
            [TweenSequenceItem(tween: MockDoubleTween(), weight: 100.0)]),
      );
      expect(
          moveCameraAnimation.hashCode,
          moveCameraAnimation.controller.hashCode ^
              moveCameraAnimation.panSequence.hashCode ^
              moveCameraAnimation.zoomSequence.hashCode);
    });
  });
}
