import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:atlas_demo/models/models.dart';

// Initial Map Data
//

InitialMapData getInitialMapData() {
  return InitialMapData(
    cameraPositions: _getCameraPositions(),
    markers: _getMarkers(),
    circles: _getCircles(),
    polygons: _getPolygons(),
    polyLines: _getPolyLines(),
  );
}

List<DemoCameraPosition> _getCameraPositions() {
  // NOTE: At least one camera position is required!
  //
  return [
    DemoCameraPosition(
      name: 'Initial Position',
      type: CameraPositionType.Center,
      center: DemoGeoCoordinates(37.566474, 126.985022),
      zoom: 12,
    ),
    DemoCameraPosition(
      name: 'Myeongdong',
      type: CameraPositionType.Center,
      center: DemoGeoCoordinates(37.5627855, 126.985345),
      zoom: 15,
    ),
    DemoCameraPosition(
      name: 'Busan',
      type: CameraPositionType.Center,
      center: DemoGeoCoordinates(35.1703265, 129.126473),
      zoom: 8,
    ),
    DemoCameraPosition(
      name: 'Myeongdong',
      type: CameraPositionType.Bound,
      topLeft: DemoGeoCoordinates(37.565601, 126.980937),
      bottomRight: DemoGeoCoordinates(
        37.559970,
        126.989753,
      ),
    ),
    DemoCameraPosition(
      name: 'Busan',
      type: CameraPositionType.Bound,
      topLeft: DemoGeoCoordinates(35.254132, 129.051642),
      bottomRight: DemoGeoCoordinates(
        35.086521,
        129.201304,
      ),
    ),
  ];
}

List<DemoMarker> _getMarkers() {
  final uuid = Uuid();
  return [
    DemoMarker(
        id: uuid.v4(),
        name: 'Marker_1',
        icon: 'assets/pin_0.png',
        position: DemoGeoCoordinates(37.37921261, 127.01182545),
        anchor: DemoAnchor(
          x: 0.5,
          y: 1.0,
        ),
        zIndex: 32,
        callOut: null,
        width: 40),
    DemoMarker(
        id: uuid.v4(),
        name: 'Marker_2',
        icon: 'assets/pin_1.png',
        position: DemoGeoCoordinates(37.41799347, 126.75483246),
        anchor: DemoAnchor(
          x: 0.5,
          y: 1.0,
        ),
        zIndex: 87,
        callOut: null,
        width: 44),
    DemoMarker(
        id: uuid.v4(),
        name: 'Marker_3',
        icon: 'assets/pin_2.png',
        position: DemoGeoCoordinates(37.46938429, 126.87239840),
        anchor: DemoAnchor(
          x: 0.5,
          y: 1.0,
        ),
        zIndex: 251,
        callOut: null,
        width: 55),
    DemoMarker(
        id: uuid.v4(),
        name: 'Marker_4',
        icon: 'assets/pin_3.png',
        position: DemoGeoCoordinates(37.528995, 127.011263),
        anchor: DemoAnchor(
          x: 0.5,
          y: 1.0,
        ),
        zIndex: 252,
        callOut: null,
        width: 60),
    DemoMarker(
        id: uuid.v4(),
        name: 'Marker_5',
        icon: 'assets/pin_4.png',
        position: DemoGeoCoordinates(38.092991, 127.757251),
        anchor: DemoAnchor(x: 0.5, y: 1.0),
        zIndex: 252,
        callOut: null,
        width: 20),
    DemoMarker(
        id: uuid.v4(),
        name: 'Marker_6',
        icon: 'assets/pin_5.png',
        position: DemoGeoCoordinates(38.210421, 128.601892),
        anchor: DemoAnchor(x: 0.5, y: 1.0),
        zIndex: 255,
        callOut: null,
        width: 70)
  ];
}

List<DemoCircle> _getCircles() {
  final uuid = Uuid();
  return [
    DemoCircle(
      id: uuid.v4(),
      name: 'circle_1',
      center: DemoGeoCoordinates(37.55625607, 126.97616100),
      radius: 300,
      strokeColor: Color.fromARGB(0xFF, 0xFF, 0x00, 0x00),
      strokeWidth: 5,
      strokeAlpha: 0xFF,
      fillColor: Color.fromARGB(0xD0, 0x00, 0xD0, 0xFF),
      fillAlpha: 0xD0,
    ),
    DemoCircle(
      id: uuid.v4(),
      name: 'circle_2',
      center: DemoGeoCoordinates(37.556394, 126.987542),
      radius: 600,
      strokeColor: Color.fromARGB(0xF0, 0x10, 0x00, 0xFF),
      strokeWidth: 1,
      strokeAlpha: 0xF0,
      fillColor: Color.fromARGB(0xA0, 0xFF, 0xFF, 0x00),
      fillAlpha: 0xA0,
    ),
    DemoCircle(
      id: uuid.v4(),
      name: 'circle_3',
      center: DemoGeoCoordinates(37.552915, 126.972608),
      radius: 450,
      strokeColor: Color.fromARGB(0x80, 0x00, 0x00, 0x00),
      strokeWidth: 3,
      strokeAlpha: 0x80,
      fillColor: Color.fromARGB(0x5F, 0xFF, 0x00, 0x00),
      fillAlpha: 0x5F,
    ),
    DemoCircle(
      id: uuid.v4(),
      name: 'circle_4',
      center: DemoGeoCoordinates(36.372325, 127.932566),
      radius: 50000,
      strokeColor: Color.fromARGB(0x80, 0x00, 0x00, 0x50),
      strokeWidth: 3,
      strokeAlpha: 0x80,
      fillColor: Color.fromARGB(0x5F, 0xFF, 0x00, 0xAB),
      fillAlpha: 0x5F,
    ),
  ];
}

List<DemoPolygon> _getPolygons() {
  final uuid = Uuid();
  return [
    DemoPolygon(
      id: uuid.v4(),
      name: 'polygon_1',
      points: [
        DemoGeoCoordinates(37.572306, 126.972759),
        DemoGeoCoordinates(37.572468, 126.978832),
        DemoGeoCoordinates(37.566048, 126.980506),
        DemoGeoCoordinates(37.564789, 126.974219)
      ],
      strokeColor: Colors.grey,
      strokeWidth: 2,
      strokeAlpha: null,
      fillColor: Color.fromARGB(0xFB, 0xFF, 0x00, 0x00),
      fillAlpha: 0xFB,
    ),
    DemoPolygon(
      id: uuid.v4(),
      name: 'polygon_2',
      points: [
        DemoGeoCoordinates(37.583273, 126.973817),
        DemoGeoCoordinates(37.583783, 126.976478),
        DemoGeoCoordinates(37.583035, 126.979933),
        DemoGeoCoordinates(37.579557, 126.979429),
        DemoGeoCoordinates(37.576470, 126.979461),
        DemoGeoCoordinates(37.575849, 126.978828),
        DemoGeoCoordinates(37.575926, 126.974290)
      ],
      strokeColor: Colors.blue,
      strokeWidth: 2,
      strokeAlpha: null,
      fillColor: Color.fromARGB(0xFA, 0x00, 0x00, 0xFA),
      fillAlpha: 0xAA,
    ),
    DemoPolygon(
      id: uuid.v4(),
      name: 'polygon_3',
      points: [
        DemoGeoCoordinates(37.558646, 126.892064),
        DemoGeoCoordinates(37.543539, 126.910260),
        DemoGeoCoordinates(37.542246, 126.918586),
        DemoGeoCoordinates(37.544015, 126.922363),
        DemoGeoCoordinates(37.547894, 126.923050),
        DemoGeoCoordinates(37.563612, 126.903051)
      ],
      strokeColor: Colors.black,
      strokeWidth: 2,
      strokeAlpha: null,
      fillColor: Color.fromARGB(0xFA, 0xFA, 0x05, 0xFF),
      fillAlpha: 0x5F,
    ),
    DemoPolygon(
      id: uuid.v4(),
      name: 'polygon_4',
      points: [
        DemoGeoCoordinates(37.475088, 126.328562),
        DemoGeoCoordinates(37.546440, 126.519449),
        DemoGeoCoordinates(37.488710, 126.598413),
        DemoGeoCoordinates(37.208140, 126.460398)
      ],
      strokeColor: Colors.black,
      strokeWidth: 2,
      strokeAlpha: null,
      fillColor: Color.fromARGB(0xFA, 0xFA, 0x05, 0xFF),
      fillAlpha: 0x5F,
    ),
  ];
}

List<DemoPolyLine> _getPolyLines() {
  final uuid = Uuid();
  return [
    DemoPolyLine(
      id: uuid.v4(),
      name: 'polyline_1',
      points: [
        DemoGeoCoordinates(37.572349, 127.008914),
        DemoGeoCoordinates(37.540351, 127.018144),
        DemoGeoCoordinates(37.529946, 127.025322)
      ],
      strokeColor: Color.fromARGB(0xFF, 0x00, 0xFF, 0x00),
      strokeWidth: 10,
    ),
    DemoPolyLine(
      id: uuid.v4(),
      name: 'polyline_2',
      points: [
        DemoGeoCoordinates(37.56058044801028, 126.98258748403173),
        DemoGeoCoordinates(37.56056655749714, 126.98240694532106),
        DemoGeoCoordinates(37.56056933171304, 126.98222640613864),
        DemoGeoCoordinates(37.56059432576699, 126.98205697642592),
        DemoGeoCoordinates(37.5606665371013, 126.98191809814803),
        DemoGeoCoordinates(37.56074708154755, 126.98182088250437),
        DemoGeoCoordinates(37.560841513566935, 126.98174033161561),
        DemoGeoCoordinates(37.561141476347174, 126.98160977946449),
        DemoGeoCoordinates(37.56122479934444, 126.98157366928501),
        DemoGeoCoordinates(37.56126923822315, 126.98155144782962),
        DemoGeoCoordinates(37.56189138362107, 126.98130145299696),
        DemoGeoCoordinates(37.56192193542489, 126.98129034203338),
        DemoGeoCoordinates(37.56194693226923, 126.98127645370239),
        DemoGeoCoordinates(37.56195526443441, 126.98126534336784),
        DemoGeoCoordinates(37.562038586584464, 126.98118201526898),
        DemoGeoCoordinates(37.575453, 126.982956),
        DemoGeoCoordinates(37.576845, 126.986122),
        DemoGeoCoordinates(37.579234, 126.984995),
        DemoGeoCoordinates(37.584778, 126.985124)
      ],
      strokeColor: Color.fromARGB(0xFF, 0xFF, 0x00, 0x00),
      strokeWidth: 10,
    ),
    DemoPolyLine(
      id: uuid.v4(),
      name: 'polyline_3',
      points: [
        DemoGeoCoordinates(37.562038586584464, 126.98118201526898),
        DemoGeoCoordinates(37.56200247907372, 126.98114868599515),
        DemoGeoCoordinates(37.5619497063357, 126.98108758194641),
        DemoGeoCoordinates(37.561841383305186, 126.98095981887819),
        DemoGeoCoordinates(37.561738614735894, 126.98080705793066),
        DemoGeoCoordinates(37.56165806630354, 126.9806820716008),
        DemoGeoCoordinates(37.5615830724819, 126.98054041996564),
        DemoGeoCoordinates(37.56149696844234, 126.98037654844761),
        DemoGeoCoordinates(37.56145252582667, 126.9801904555529),
        DemoGeoCoordinates(37.56137197176411, 126.97975160893559),
        DemoGeoCoordinates(37.56134974983351, 126.9796238434299),
        DemoGeoCoordinates(37.56124697389046, 126.97906000883164),
        DemoGeoCoordinates(37.56106642064311, 126.97801844219232),
        DemoGeoCoordinates(37.56103031123927, 126.97787956698109),
        DemoGeoCoordinates(37.56098031331579, 126.97767125404631),
      ],
      strokeColor: Color.fromARGB(0xFF, 0xFF, 0xA5, 0x00),
      strokeWidth: 10,
    ),
    DemoPolyLine(
      id: uuid.v4(),
      name: 'polyline_4',
      points: [
        DemoGeoCoordinates(37.55342270469387, 126.96908336159359),
        DemoGeoCoordinates(37.55342825965337, 126.96908613896116),
        DemoGeoCoordinates(37.55347547688374, 126.96911391287249),
        DemoGeoCoordinates(37.55347547688374, 126.96911391287249),
        DemoGeoCoordinates(37.55359213003718, 126.9691166870979),
        DemoGeoCoordinates(37.5537782196614, 126.96912501440875),
        DemoGeoCoordinates(37.55379210698543, 126.96912779154064),
        DemoGeoCoordinates(37.55380043949936, 126.969136123879),
        DemoGeoCoordinates(37.55418373772929, 126.96966384272596),
        DemoGeoCoordinates(37.54951487281365, 126.97171101046426),
        DemoGeoCoordinates(37.5494176610468, 126.97166379529365),
        DemoGeoCoordinates(37.54935100128349, 126.97161657925899),
        DemoGeoCoordinates(37.54917601769313, 126.97139715975666),
        DemoGeoCoordinates(37.54816222371209, 126.97011674954047),
      ],
      strokeColor: Color.fromARGB(0xFF, 0xFF, 0x00, 0x00),
      strokeWidth: 20,
    ),
    DemoPolyLine(
      id: uuid.v4(),
      name: 'polyline_5',
      points: [
        DemoGeoCoordinates(37.537272, 127.024793),
        DemoGeoCoordinates(35.184237, 129.046277),
      ],
      strokeColor: Color.fromARGB(0xFF, 0xFF, 0x00, 0x00),
      strokeWidth: 35,
    ),
  ];
}
