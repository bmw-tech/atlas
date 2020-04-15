import 'package:equatable/equatable.dart';
import 'package:atlas/atlas.dart';

class MapState extends Equatable {
  final CameraPosition defaultCameraPosition;
  final bool showSearchAreaButton;

  const MapState({
    this.defaultCameraPosition,
    this.showSearchAreaButton,
  });

  factory MapState.initial() {
    return MapState(
      defaultCameraPosition: CameraPosition(
        target: LatLng(
          latitude: 37.42796133580664,
          longitude: -122.085749655962,
        ),
        zoom: 12,
      ),
      showSearchAreaButton: false,
    );
  }

  MapState copyWith({
    CameraPosition newDefaultCameraPosition,
    bool showSearchAreaButton,
  }) {
    return new MapState(
      defaultCameraPosition:
          newDefaultCameraPosition ?? this.defaultCameraPosition,
      showSearchAreaButton: showSearchAreaButton ?? this.showSearchAreaButton,
    );
  }

  @override
  List<Object> get props => [
        defaultCameraPosition,
        showSearchAreaButton,
      ];
}
