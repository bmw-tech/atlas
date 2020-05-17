import 'package:equatable/equatable.dart';

import '../models/models.dart';

class MapState extends Equatable {
  final List<DemoCameraPosition> cameraPositions;
  final List<DemoMarker> markers;
  final List<DemoCircle> circles;
  final List<DemoPolygon> polygons;
  final List<DemoPolyLine> polyLines;
  final DemoCameraPosition currentCameraPosition;
  final Set<String> selectedMarkerIds;
  final Set<String> selectedCircleIds;
  final Set<String> selectedPolygonIds;
  final Set<String> selectedPolyLineIds;
  final bool showTrafficMode;
  final bool showMyLocation;
  final bool followMeMode;
  final bool notifyTapOnMap;
  final bool notifyLongPressedOnMap;
  final bool notifyTapOnMarker;
  final bool notifyCameraPositionChange;
  final bool notifyLocationChange;

  MapState({
    this.cameraPositions,
    this.markers,
    this.circles,
    this.polygons,
    this.polyLines,
    this.currentCameraPosition,
    this.selectedMarkerIds,
    this.selectedCircleIds,
    this.selectedPolygonIds,
    this.selectedPolyLineIds,
    this.showTrafficMode,
    this.showMyLocation,
    this.followMeMode,
    this.notifyTapOnMap,
    this.notifyLongPressedOnMap,
    this.notifyTapOnMarker,
    this.notifyCameraPositionChange,
    this.notifyLocationChange,
  });

  factory MapState.initial(InitialMapData initialMapData) {
    return MapState(
      cameraPositions: initialMapData.cameraPositions,
      markers: initialMapData.markers,
      circles: initialMapData.circles,
      polygons: initialMapData.polygons,
      polyLines: initialMapData.polyLines,
      currentCameraPosition: initialMapData.cameraPositions[0],
      selectedMarkerIds: Set<String>(),
      selectedCircleIds: Set<String>(),
      selectedPolygonIds: Set<String>(),
      selectedPolyLineIds: Set<String>(),
      showTrafficMode: false,
      showMyLocation: false,
      followMeMode: false,
      notifyTapOnMap: false,
      notifyLongPressedOnMap: false,
      notifyTapOnMarker: false,
      notifyCameraPositionChange: false,
      notifyLocationChange: false,
    );
  }

  MapState copyWith({
    List<DemoCameraPosition> cameraPositions,
    List<DemoMarker> markers,
    List<DemoCircle> circles,
    List<DemoPolygon> polygons,
    List<DemoPolyLine> polyLines,
    DemoCameraPosition currentCameraPosition,
    Set<String> selectedMarkerIds,
    Set<String> selectedCircleIds,
    Set<String> selectedPolygonIds,
    Set<String> selectedPolyLineIds,
    bool showTrafficMode,
    bool showMyLocation,
    bool showAccuracyRange,
    bool showDirectionalIndicator,
    bool followMeMode,
    bool notifyTapOnMap,
    bool notifyLongPressedOnMap,
    bool notifyTapOnMarker,
    bool notifyCameraPositionChange,
    bool notifyLocationChange,
  }) {
    return MapState(
      cameraPositions: cameraPositions ?? this.cameraPositions,
      markers: markers ?? this.markers,
      circles: circles ?? this.circles,
      polygons: polygons ?? this.polygons,
      polyLines: polyLines ?? this.polyLines,
      currentCameraPosition:
          currentCameraPosition ?? this.currentCameraPosition,
      selectedMarkerIds: selectedMarkerIds ?? this.selectedMarkerIds,
      selectedCircleIds: selectedCircleIds ?? this.selectedCircleIds,
      selectedPolygonIds: selectedPolygonIds ?? this.selectedPolygonIds,
      selectedPolyLineIds: selectedPolyLineIds ?? this.selectedPolyLineIds,
      showTrafficMode: showTrafficMode ?? this.showTrafficMode,
      showMyLocation: showMyLocation ?? this.showMyLocation,
      followMeMode: followMeMode ?? this.followMeMode,
      notifyTapOnMap: notifyTapOnMap ?? this.notifyTapOnMap,
      notifyLongPressedOnMap:
          notifyLongPressedOnMap ?? this.notifyLongPressedOnMap,
      notifyTapOnMarker: notifyTapOnMarker ?? this.notifyTapOnMarker,
      notifyCameraPositionChange:
          notifyCameraPositionChange ?? this.notifyCameraPositionChange,
      notifyLocationChange: notifyLocationChange ?? this.notifyLocationChange,
    );
  }

  @override
  List<Object> get props => [
        cameraPositions,
        markers,
        circles,
        polygons,
        polyLines,
        currentCameraPosition,
        selectedMarkerIds,
        selectedCircleIds,
        selectedPolygonIds,
        selectedPolyLineIds,
        showTrafficMode,
        showMyLocation,
        followMeMode,
        notifyTapOnMap,
        notifyLongPressedOnMap,
        notifyTapOnMarker,
        notifyCameraPositionChange,
        notifyLocationChange,
      ];
}
