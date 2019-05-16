import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';

abstract class Provider {
  Widget build({
    final CameraPosition initialCameraPosition,
  });
}
