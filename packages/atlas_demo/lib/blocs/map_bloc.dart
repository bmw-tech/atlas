import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:location_permissions/location_permissions.dart';

import '../models/models.dart';
import 'blocs.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final InitialMapData initialMapData;

  MapBloc(this.initialMapData) : assert(initialMapData != null);

  @override
  MapState get initialState => MapState.initial(initialMapData);

  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
    if (event is ToggleShowTrafficMode) {
      yield state.copyWith(showTrafficMode: !state.showTrafficMode);
    } else if (event is ToggleShowMyLocation) {
      if (state.showMyLocation) {
        yield state.copyWith(
          showMyLocation: false,
          showAccuracyRange: false,
          showDirectionalIndicator: false,
          followMeMode: false,
        );
      } else {
        if (await _getLocationPermission()) {
          yield state.copyWith(showMyLocation: true);
        }
      }
    } else if (event is ToggleFollowMeMode) {
      yield state.copyWith(followMeMode: !state.followMeMode);
    } else if (event is ToggleNotifyTapOnMap) {
      yield state.copyWith(notifyTapOnMap: !state.notifyTapOnMap);
    } else if (event is ToggleNotifyLongPressedOnMap) {
      yield state.copyWith(
          notifyLongPressedOnMap: !state.notifyLongPressedOnMap);
    } else if (event is ToggleNotifyTapOnMarker) {
      yield state.copyWith(notifyTapOnMarker: !state.notifyTapOnMarker);
    } else if (event is ToggleNotifyCameraPositionChange) {
      yield state.copyWith(
          notifyCameraPositionChange: !state.notifyCameraPositionChange);
    } else if (event is SetCameraPosition) {
      yield state.copyWith(currentCameraPosition: event.position);
    } else if (event is ToggleNotifyLocationChange) {
      yield state.copyWith(notifyLocationChange: !state.notifyLocationChange);
    } else if (event is SelectAllMarkers) {
      yield state.copyWith(
          selectedMarkerIds: state.markers.map((item) => item.id).toSet());
    } else if (event is DeselectAllMarkers) {
      yield state.copyWith(selectedMarkerIds: Set.identity());
    } else if (event is SelectMarker) {
      yield state.copyWith(
          selectedMarkerIds:
              _addSelectedId(state.selectedMarkerIds, event.marker.id));
    } else if (event is DeselectMarker) {
      yield state.copyWith(
          selectedMarkerIds:
              _removeSelectedId(state.selectedMarkerIds, event.marker.id));
    } else if (event is SelectAllCircles) {
      yield state.copyWith(
          selectedCircleIds: state.circles.map((item) => item.id).toSet());
    } else if (event is DeselectAllCircles) {
      yield state.copyWith(selectedCircleIds: Set.identity());
    } else if (event is SelectCircle) {
      yield state.copyWith(
          selectedCircleIds:
              _addSelectedId(state.selectedCircleIds, event.circle.id));
    } else if (event is DeselectCircle) {
      yield state.copyWith(
          selectedCircleIds:
              _removeSelectedId(state.selectedCircleIds, event.circle.id));
    } else if (event is SelectAllPolygons) {
      yield state.copyWith(
          selectedPolygonIds: state.polygons.map((item) => item.id).toSet());
    } else if (event is DeselectAllPolygons) {
      yield state.copyWith(selectedPolygonIds: Set.identity());
    } else if (event is SelectPolygon) {
      yield state.copyWith(
          selectedPolygonIds:
              _addSelectedId(state.selectedPolygonIds, event.polygon.id));
    } else if (event is DeselectPolygon) {
      yield state.copyWith(
          selectedPolygonIds:
              _removeSelectedId(state.selectedPolygonIds, event.polygon.id));
    } else if (event is SelectAllPolyLines) {
      yield state.copyWith(
          selectedPolyLineIds: state.polyLines.map((item) => item.id).toSet());
    } else if (event is DeselectAllPolyLines) {
      yield state.copyWith(selectedPolyLineIds: Set.identity());
    } else if (event is SelectPolyLine) {
      yield state.copyWith(
          selectedPolyLineIds:
              _addSelectedId(state.selectedPolyLineIds, event.polyLine.id));
    } else if (event is DeselectPolyLine) {
      yield state.copyWith(
          selectedPolyLineIds:
              _removeSelectedId(state.selectedPolyLineIds, event.polyLine.id));
    } else if (event is RemoveAllDrawings) {
      yield state.copyWith(
          selectedCircleIds: Set.identity(),
          selectedPolygonIds: Set.identity(),
          selectedPolyLineIds: Set.identity());
    }
  }

  Set<String> _addSelectedId(Set<String> selections, String id) {
    Set<String> result = Set.of(selections);
    result.add(id);
    return result;
  }

  Set<String> _removeSelectedId(Set<String> selections, String id) {
    Set<String> result = Set.of(selections);
    result.remove(id);
    return result;
  }

  Future<bool> _getLocationPermission() async {
    const status = PermissionStatus.granted;
    const level = LocationPermissionLevel.locationWhenInUse;
    var locPerms = LocationPermissions();
    return await locPerms.checkPermissionStatus(level: level) == status ||
        await locPerms.requestPermissions(permissionLevel: level) == status;
  }
}
