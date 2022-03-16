import 'package:flutter/foundation.dart';
import 'package:atlas/atlas.dart';

/// Collection of `Marker` on the map
class Cluster {
  /// Uniquely identifies a `Cluster`.
  final String id;

  /// The z-index of the cluster, used to determine relative drawing order of
  /// map overlays.
  ///
  /// Lower values means drawn earlier, and thus appearing to be closer to the surface of the Earth.
  final double zIndex;

  /// A name or description of 'Cluster', which also be used to display additional information
  final String? description;

  /// Optional ClusterIcon used to replace default icon.
  final ClusterIcon? icon;

  /// The [position] where the `Cluster` is drawn is represented as `LatLng`.
  ///
  /// If [position] is null, position information needs to be calculated
  /// through custom rules, such as getting the average latitude and longitude through markers
  final LatLng? position;
  
  /// Specifies the anchor to be at a particular point in the cluster image.
  final Anchor? anchor;

  /// The specific markers list after the `Cluster` is expanded.
  final Set<Marker>? markers;

  /// A `void Function` which is called whenever a `Cluster` is tapped.
  final VoidCallback? onTap;

  const Cluster({
    required this.id,
    this.zIndex = 0.0,
    this.description,
    this.position,
	this.anchor,
    this.markers,
    this.icon,
    this.onTap,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is Cluster) {
      return id == other.id &&
          zIndex == other.zIndex &&
          description == other.description &&
          position == other.position &&
		  anchor == other.anchor &&
          icon == other.icon &&
          markers == other.markers;
    } else {
      return false;
    }
  }

  @override
  int get hashCode =>
      id.hashCode ^
      description.hashCode ^
      position.hashCode ^
	  anchor.hashCode ^
      markers.hashCode ^
      zIndex.hashCode ^
      icon.hashCode;
}
