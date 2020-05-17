import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atlas/atlas.dart';

import '../blocs/blocs.dart';
import '../models/models.dart';

class Map extends StatefulWidget {
  final DemoCameraPosition initialCameraPosition;
  final ArgumentCallback<DemoCameraPosition> onCameraPositionChanged;
  final ArgumentCallback<DemoGeoCoordinates> onTap;
  final ArgumentCallback<DemoGeoCoordinates> onLongPress;
  final ArgumentCallback<DemoGeoCoordinates> onLocationChanged;
  final ArgumentCallback<String> onMarkerTap;

  const Map({
    @required this.initialCameraPosition,
    this.onCameraPositionChanged,
    this.onTap,
    this.onLongPress,
    this.onLocationChanged,
    this.onMarkerTap,
  }) : assert(initialCameraPosition != null);

  @override
  State createState() => _MapState(this.initialCameraPosition);
}

class _MapState extends State<Map> {
  AtlasController atlasController;
  DemoCameraPosition initialCameraPosition;

  _MapState(DemoCameraPosition initialCameraPosition) {
    this.initialCameraPosition = initialCameraPosition;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapBloc, MapState>(
      listenWhen: (previous, current) {
        return atlasController != null &&
            current.currentCameraPosition != previous.currentCameraPosition;
      },
      listener: (context, state) {
        if (state.currentCameraPosition.type == CameraPositionType.Center) {
          atlasController
              .moveCamera(_toCameraPosition(state.currentCameraPosition));
        } else {
          atlasController.updateBounds(
              _toLatLngBounds(state.currentCameraPosition), 0);
        }
      },
      builder: (context, state) {
        return Atlas(
          initialCameraPosition: _toCameraPosition(initialCameraPosition),
          showTraffic: state.showTrafficMode,
          showMyLocation: state.showMyLocation,
          followMyLocation: state.followMeMode,
          markers: _toMarkerSet(context, state.markers, state.selectedMarkerIds,
              state.notifyTapOnMarker),
          circles: _toCircleSet(state.circles, state.selectedCircleIds),
          polygons: _toPolygonSet(state.polygons, state.selectedPolygonIds),
          polylines: _toPolyLineSet(state.polyLines, state.selectedPolyLineIds),
          onTap: (coordinates) => state.notifyTapOnMap
              ? widget.onTap(_toDemoGeoCoordinates(coordinates))
              : null,
          onLongPress: (coordinates) => state.notifyLongPressedOnMap
              ? widget.onLongPress(_toDemoGeoCoordinates(coordinates))
              : null,
          onCameraPositionChanged: (position) => state
                  .notifyCameraPositionChange
              ? widget.onCameraPositionChanged(_toDemoCameraPosition(position))
              : null,
          onLocationChanged: (coordinates) => state.notifyLocationChange
              ? widget.onLocationChanged(_toDemoGeoCoordinates(coordinates))
              : null,
          onMapCreated: (controller) {
            atlasController = controller;
          },
        );
      },
    );
  }

  // Conversion Functions

  LatLng _toLatLng(DemoGeoCoordinates source) => (source == null)
      ? null
      : LatLng(latitude: source.latitude, longitude: source.longitude);

  List<LatLng> _toLatLngList(List<DemoGeoCoordinates> source) =>
      (source == null)
          ? null
          : source
              .map((demoGeoCoordinate) => _toLatLng(demoGeoCoordinate))
              .toList();

  DemoGeoCoordinates _toDemoGeoCoordinates(LatLng source) => (source == null)
      ? null
      : DemoGeoCoordinates(source.latitude, source.longitude);

  CameraPosition _toCameraPosition(DemoCameraPosition source) =>
      (source == null || source.type != CameraPositionType.Center)
          ? null
          : CameraPosition(
              target: _toLatLng(source.center), zoom: source.zoom.toDouble());

  LatLngBounds _toLatLngBounds(DemoCameraPosition source) =>
      (source == null || source.type != CameraPositionType.Bound)
          ? null
          : LatLngBounds(
              northeast: LatLng(
                  latitude: source.topLeft.latitude,
                  longitude: source.bottomRight.longitude),
              southwest: LatLng(
                  latitude: source.bottomRight.latitude,
                  longitude: source.topLeft.longitude),
            );

  DemoCameraPosition _toDemoCameraPosition(CameraPosition source) =>
      (source == null)
          ? null
          : DemoCameraPosition(
              name: 'Generated',
              type: CameraPositionType.Center,
              center: _toDemoGeoCoordinates(source.target),
              zoom: source.zoom.round(),
            );

  Set<Marker> _toMarkerSet(
    BuildContext context,
    List<DemoMarker> source,
    Set<String> selectedIds,
    bool notifyTapOnMarker,
  ) =>
      (source == null)
          ? null
          : source
              .map((demoMarker) => !selectedIds.contains(demoMarker.id)
                  ? null
                  : Marker(
                      id: demoMarker.id,
                      icon: (demoMarker.icon == null)
                          ? null
                          : MarkerIcon(
                              assetName: demoMarker.icon,
                              width: demoMarker.width,
                            ),
                      position: _toLatLng(demoMarker.position),
                      anchor: Anchor(
                          x: demoMarker.anchor?.x ?? 0.5,
                          y: demoMarker.anchor?.y ?? 0.5),
                      onTap: () => notifyTapOnMarker
                          ? widget.onMarkerTap(demoMarker.name)
                          : null,
                    ))
              .where((value) => value != null)
              .toSet();

  Set<Circle> _toCircleSet(
    List<DemoCircle> source,
    Set<String> selectedIds,
  ) =>
      (source == null)
          ? null
          : source
              .map((demoCircle) => !selectedIds.contains(demoCircle.id)
                  ? null
                  : Circle(
                      id: demoCircle.id,
                      center: _toLatLng(demoCircle.center),
                      radiusInMeters: demoCircle.radius,
                      strokeColor: demoCircle.strokeColor ?? Colors.blue,
                      fillColor: demoCircle.fillColor ?? Colors.blue,
                    ))
              .where((value) => value != null)
              .toSet();

  Set<Polygon> _toPolygonSet(
    List<DemoPolygon> source,
    Set<String> selectedIds,
  ) =>
      (source == null)
          ? null
          : source
              .map((demoPolygon) => !selectedIds.contains(demoPolygon.id)
                  ? null
                  : Polygon(
                      id: demoPolygon.id,
                      points: _toLatLngList(demoPolygon.points),
                      strokeColor: demoPolygon.strokeColor ?? Colors.blue,
                      strokeWidth: demoPolygon.strokeWidth,
                      fillColor: demoPolygon.fillColor ?? Colors.blue,
                    ))
              .where((value) => value != null)
              .toSet();

  Set<Polyline> _toPolyLineSet(
    List<DemoPolyLine> source,
    Set<String> selectedIds,
  ) =>
      (source == null)
          ? null
          : source
              .map((demoPolyLine) => !selectedIds.contains(demoPolyLine.id)
                  ? null
                  : Polyline(
                      id: demoPolyLine.id,
                      points: _toLatLngList(demoPolyLine.points),
                      color: demoPolyLine.strokeColor ?? Colors.blue,
                      width: demoPolyLine.strokeWidth,
                    ))
              .where((value) => value != null)
              .toSet();
}
