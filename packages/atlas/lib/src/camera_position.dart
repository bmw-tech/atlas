import 'package:meta/meta.dart';
import 'package:atlas/atlas.dart';

class CameraPosition {
  final CoordinatePair target;
  final double zoom;

  const CameraPosition({@required this.target, this.zoom = 0.0})
      : assert(target != null);
}
