import 'package:equatable/equatable.dart';

import 'common.dart';

enum CameraPositionType { Center, Bound }

class DemoCameraPosition extends Equatable {
  final String name;
  final CameraPositionType type;
  final DemoGeoCoordinates center;
  final int zoom;
  final DemoGeoCoordinates topLeft;
  final DemoGeoCoordinates bottomRight;

  const DemoCameraPosition({
    this.name,
    this.type,
    this.center,
    this.zoom,
    this.topLeft,
    this.bottomRight,
  });

  @override
  List<Object> get props => [
        name,
        type,
        center,
        zoom,
        topLeft,
        bottomRight,
      ];
}
