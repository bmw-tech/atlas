import 'package:equatable/equatable.dart';

import '../models/models.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

// Settings Events
//
class ToggleShowTrafficMode extends MapEvent {}

class ToggleShowMyLocation extends MapEvent {}

class ToggleFollowMeMode extends MapEvent {}

class ToggleNotifyTapOnMap extends MapEvent {}

class ToggleNotifyLongPressedOnMap extends MapEvent {}

class ToggleNotifyTapOnMarker extends MapEvent {}

class ToggleNotifyCameraPositionChange extends MapEvent {}

class ToggleNotifyLocationChange extends MapEvent {}

// Camera Position
//
class SetCameraPosition extends MapEvent {
  final DemoCameraPosition position;

  const SetCameraPosition(this.position);

  @override
  List<Object> get props => [position];
}

// Markers
//
class SelectAllMarkers extends MapEvent {}

class DeselectAllMarkers extends MapEvent {}

class SelectMarker extends MapEvent {
  final DemoMarker marker;

  const SelectMarker(this.marker);

  @override
  List<Object> get props => [marker];
}

class DeselectMarker extends MapEvent {
  final DemoMarker marker;

  const DeselectMarker(this.marker);

  @override
  List<Object> get props => [marker];
}

// Drawings
//

class RemoveAllDrawings extends MapEvent {}

// Circles
//
class SelectAllCircles extends MapEvent {}

class DeselectAllCircles extends MapEvent {}

class SelectCircle extends MapEvent {
  final DemoCircle circle;

  const SelectCircle(this.circle);

  @override
  List<Object> get props => [circle];
}

class DeselectCircle extends MapEvent {
  final DemoCircle circle;

  const DeselectCircle(this.circle);

  @override
  List<Object> get props => [circle];
}

// Polygons
//
class SelectAllPolygons extends MapEvent {}

class DeselectAllPolygons extends MapEvent {}

class SelectPolygon extends MapEvent {
  final DemoPolygon polygon;

  const SelectPolygon(this.polygon);

  @override
  List<Object> get props => [polygon];
}

class DeselectPolygon extends MapEvent {
  final DemoPolygon polygon;

  const DeselectPolygon(this.polygon);

  @override
  List<Object> get props => [polygon];
}

// PolyLines
//
class SelectAllPolyLines extends MapEvent {}

class DeselectAllPolyLines extends MapEvent {}

class SelectPolyLine extends MapEvent {
  final DemoPolyLine polyLine;

  const SelectPolyLine(this.polyLine);

  @override
  List<Object> get props => [polyLine];
}

class DeselectPolyLine extends MapEvent {
  final DemoPolyLine polyLine;

  const DeselectPolyLine(this.polyLine);

  @override
  List<Object> get props => [polyLine];
}
