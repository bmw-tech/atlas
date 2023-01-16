import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

/// Collection of trips in a period of time
class TrackPlayback {
  /// Uniquely identifies a `TrackPlayback`.
  final String id;

  /// The whole journey is composed of 'polylines'
  final List<Polyline> polylines;

  /// Driving car icon
  final MarkerIcon? carIcon;

  /// Duration of track playback
  final int duration;

  /// Top view angle during travel
  final int overlookingAngle;

  /// After the trip, the displayed markers
  final List<Marker>? afterEndMarkers;

  /// Corresponding to 'polylines', control the color of corresponding polylines
  final List<Color>? colors;

  /// Corresponding to 'polylines', the speed of the corresponding polyline
  final List<int>? speeds;

  /// Callback after animation completion
  final VoidCallback? onCompleted;

  /// Callback after animation interruption
  final VoidCallback? onCanceled;

  const TrackPlayback({
    required this.id,
    required this.polylines,
    this.carIcon,
    this.duration = 5000,
    this.overlookingAngle = 0,
    this.afterEndMarkers,
    this.colors,
    this.speeds,
    this.onCompleted,
    this.onCanceled,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is TrackPlayback) {
      return id == other.id &&
          polylines == other.polylines &&
          carIcon == other.carIcon &&
          duration == other.duration &&
          overlookingAngle == other.overlookingAngle &&
          afterEndMarkers == other.afterEndMarkers &&
          colors == other.colors &&
          speeds == other.speeds &&
          onCompleted == other.onCompleted &&
          onCanceled == other.onCanceled;
    }
    return false;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      polylines.hashCode ^
      carIcon.hashCode ^
      duration.hashCode ^
      overlookingAngle.hashCode ^
      afterEndMarkers.hashCode ^
      colors.hashCode ^
      speeds.hashCode ^
      onCompleted.hashCode ^
      onCanceled.hashCode;
}
