import 'package:atlas/atlas.dart';
import 'package:flutter/widgets.dart';

/// Cluster customization
class ClusterOptions {
  /// Whether to cluster the markers into groups
  final bool enabled;

  /// Called when a cluster is tapped.
  /// The Markers of the pressed cluster are passed as an argument.
  final ValueChanged<Set<Marker>>? onTap;

  /// Icon used for the clustered markers
  final MarkerIcon icon;

  /// Text color of the cluster counter
  final Color textColor;

  ClusterOptions({
    this.enabled = true,
    this.onTap,
    required this.icon,
    required this.textColor,
  });
}
