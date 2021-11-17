import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

/// Defines properties to customize the zoom and pan animation of a camera move.
class MoveCameraAnimation {
  /// The controller to be used for the animation.
  final AnimationController controller;

  /// The sequence to control the pan animation.
  final TweenSequence<LatLng> panSequence;

  /// The sequence to control the zoom animation.
  final TweenSequence<double> zoomSequence;

  MoveCameraAnimation({
    required this.controller,
    required this.panSequence,
    required this.zoomSequence,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is MoveCameraAnimation) {
      return controller == other.controller &&
          panSequence == other.panSequence &&
          zoomSequence == other.zoomSequence;
    } else {
      return false;
    }
  }

  @override
  int get hashCode =>
      controller.hashCode ^ panSequence.hashCode ^ zoomSequence.hashCode;
}
