// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FakePlatformGoogleMap {
  FakePlatformGoogleMap(int id, Map<dynamic, dynamic> params) {
    cameraPosition = CameraPosition.fromMap(params['initialCameraPosition']);
    channel = MethodChannel(
        'plugins.flutter.io/google_maps_$id', const StandardMethodCodec());
    channel.setMockMethodCallHandler(onMethodCall);
    updateOptions(params['options']);
    updateMarkers(params);
    updatePolylines(params);
  }

  MethodChannel channel;

  CameraPosition cameraPosition;

  bool compassEnabled;

  CameraTargetBounds cameraTargetBounds;

  MapType mapType;

  bool trafficEnabled;

  MinMaxZoomPreference minMaxZoomPreference;

  bool rotateGesturesEnabled;

  bool scrollGesturesEnabled;

  bool tiltGesturesEnabled;

  bool zoomGesturesEnabled;

  bool trackCameraPosition;

  bool myLocationEnabled;

  bool myLocationButtonEnabled;

  Set<MarkerId> markerIdsToRemove;

  Set<Marker> markersToAdd;

  Set<Marker> markersToChange;

  Set<PolylineId> polylineIdsToRemove;

  Set<Polyline> polylinesToAdd;

  Set<Polyline> polylinesToChange;

  ArgumentCallback<LatLng> onTap;

  ArgumentCallback<LatLng> onLongPress;

  int updatePositionCallCount = 0;

  Future<dynamic> onMethodCall(MethodCall call) {
    switch (call.method) {
      case 'camera#move':
        updatePosition(call.arguments['cameraUpdate']);
        return Future<void>.sync(() {});
      case 'map#onTap':
        return Future<void>.sync(() {});
      case 'map#onLongPress':
        return Future<void>.sync(() {});
      case 'map#update':
        updateOptions(call.arguments['options']);
        return Future<void>.sync(() {});
      case 'markers#update':
        updateMarkers(call.arguments);
        return Future<void>.sync(() {});
      case 'polylines#update':
        updatePolylines(call.arguments);
        return Future<void>.sync(() {});
      default:
        return Future<void>.sync(() {});
    }
  }

  void updatePosition(List<dynamic> cameraUpdate) {
    updatePositionCallCount++;
    if (cameraUpdate == null && cameraUpdate.length < 2) {
      return;
    }
    if (cameraUpdate[0] == 'newCameraPosition') {
      final Map newPositionElements = cameraUpdate[1];
      if (newPositionElements.length < 4) {
        return;
      }

      final List targetCoords = newPositionElements['target'];
      if (targetCoords.length < 2) {
        return;
      }

      final zoom = newPositionElements['zoom'];
      final newCameraPosition = CameraPosition(
        target: LatLng(
          targetCoords[0],
          targetCoords[1],
        ),
        zoom: zoom,
      );

      cameraPosition = newCameraPosition;
    }
    if (cameraUpdate[0] == 'newLatLngBounds') {
      cameraTargetBounds = CameraTargetBounds(
        LatLngBounds(
          northeast: LatLng(cameraUpdate[1][1][0], cameraUpdate[1][1][1]),
          southwest: LatLng(cameraUpdate[1][0][0], cameraUpdate[1][0][1]),
        ),
      );
    }
    if (cameraUpdate[0] == 'zoomTo') {
      cameraPosition = CameraPosition(
        target: cameraPosition.target,
        zoom: cameraUpdate[1],
      );
    }
  }

  void updateMarkers(Map<dynamic, dynamic> markerUpdates) {
    if (markerUpdates == null) {
      return;
    }
    markersToAdd = _deserializeMarkers(markerUpdates['markersToAdd']);
    markerIdsToRemove =
        _deserializeMarkerIds(markerUpdates['markerIdsToRemove']);
    markersToChange = _deserializeMarkers(markerUpdates['markersToChange']);
  }

  Set<MarkerId> _deserializeMarkerIds(List<dynamic> markerIds) {
    if (markerIds == null) {
      return Set<MarkerId>();
    }
    return markerIds.map((dynamic markerId) => MarkerId(markerId)).toSet();
  }

  Set<Marker> _deserializeMarkers(dynamic markers) {
    if (markers == null) {
      return Set<Marker>();
    }
    final List<dynamic> markersData = markers;
    final Set<Marker> result = Set<Marker>();
    for (Map<dynamic, dynamic> markerData in markersData) {
      final String markerId = markerData['markerId'];
      final bool draggable = markerData['draggable'];
      final bool visible = markerData['visible'];
      final position = markerData['position'];

      final dynamic infoWindowData = markerData['infoWindow'];
      InfoWindow infoWindow = InfoWindow.noText;
      if (infoWindowData != null) {
        final Map<dynamic, dynamic> infoWindowMap = infoWindowData;
        infoWindow = InfoWindow(
          title: infoWindowMap['title'],
          snippet: infoWindowMap['snippet'],
        );
      }

      result.add(Marker(
        markerId: MarkerId(markerId),
        draggable: draggable,
        visible: visible,
        infoWindow: infoWindow,
        position: LatLng(position[0], position[1]),
      ));
    }

    return result;
  }

  void updatePolylines(Map<dynamic, dynamic> polylineUpdates) {
    if (polylineUpdates == null) {
      return;
    }
    polylinesToAdd = _deserializePolylines(polylineUpdates['polylinesToAdd']);
    polylineIdsToRemove =
        _deserializePolylineIds(polylineUpdates['polylineIdsToRemove']);
    polylinesToChange =
        _deserializePolylines(polylineUpdates['polylinesToChange']);
  }

  Set<PolylineId> _deserializePolylineIds(List<dynamic> polylineIds) {
    if (polylineIds == null) {
      return Set<PolylineId>();
    }
    return polylineIds
        .map((dynamic polylineId) => PolylineId(polylineId))
        .toSet();
  }

  Set<Polyline> _deserializePolylines(dynamic polylines) {
    if (polylines == null) {
      return Set<Polyline>();
    }
    final List<dynamic> polylinesData = polylines;
    final Set<Polyline> result = Set<Polyline>();
    for (Map<dynamic, dynamic> polylineData in polylinesData) {
      final String polylineId = polylineData['polylineId'];
      final bool visible = polylineData['visible'];
      final bool geodesic = polylineData['geodesic'];

      result.add(Polyline(
        polylineId: PolylineId(polylineId),
        visible: visible,
        geodesic: geodesic,
      ));
    }

    return result;
  }

  void updateOptions(Map<dynamic, dynamic> options) {
    if (options.containsKey('compassEnabled')) {
      compassEnabled = options['compassEnabled'];
    }
    if (options.containsKey('trafficEnabled')) {
      trafficEnabled = options['trafficEnabled'];
    }
    if (options.containsKey('cameraTargetBounds')) {
      final List<dynamic> boundsList = options['cameraTargetBounds'];
      cameraTargetBounds = boundsList[0] == null
          ? CameraTargetBounds.unbounded
          : CameraTargetBounds(LatLngBounds.fromList(boundsList[0]));
    }
    if (options.containsKey('mapType')) {
      mapType = MapType.values[options['mapType']];
    }
    if (options.containsKey('minMaxZoomPreference')) {
      final List<dynamic> minMaxZoomList = options['minMaxZoomPreference'];
      minMaxZoomPreference =
          MinMaxZoomPreference(minMaxZoomList[0], minMaxZoomList[1]);
    }
    if (options.containsKey('rotateGesturesEnabled')) {
      rotateGesturesEnabled = options['rotateGesturesEnabled'];
    }
    if (options.containsKey('scrollGesturesEnabled')) {
      scrollGesturesEnabled = options['scrollGesturesEnabled'];
    }
    if (options.containsKey('tiltGesturesEnabled')) {
      tiltGesturesEnabled = options['tiltGesturesEnabled'];
    }
    if (options.containsKey('trackCameraPosition')) {
      trackCameraPosition = options['trackCameraPosition'];
    }
    if (options.containsKey('zoomGesturesEnabled')) {
      zoomGesturesEnabled = options['zoomGesturesEnabled'];
    }
    if (options.containsKey('myLocationEnabled')) {
      myLocationEnabled = options['myLocationEnabled'];
    }
    if (options.containsKey('myLocationButtonEnabled')) {
      myLocationButtonEnabled = options['myLocationButtonEnabled'];
    }
  }
}

class FakePlatformViewsController {
  FakePlatformGoogleMap lastCreatedView;

  Future<dynamic> fakePlatformViewsMethodHandler(MethodCall call) {
    switch (call.method) {
      case 'create':
        final Map<dynamic, dynamic> args = call.arguments;
        final Map<dynamic, dynamic> params = _decodeParams(args['params']);
        lastCreatedView = FakePlatformGoogleMap(
          args['id'],
          params,
        );
        return Future<int>.sync(() => 1);
      default:
        return Future<void>.sync(() {});
    }
  }

  void reset() {
    lastCreatedView = null;
  }
}

Map<dynamic, dynamic> _decodeParams(Uint8List paramsMessage) {
  final ByteBuffer buffer = paramsMessage.buffer;
  final ByteData messageBytes = buffer.asByteData(
    paramsMessage.offsetInBytes,
    paramsMessage.lengthInBytes,
  );
  return const StandardMessageCodec().decodeMessage(messageBytes);
}
