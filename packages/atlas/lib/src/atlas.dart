import 'package:flutter/widgets.dart';
import 'package:atlas/atlas.dart';

class Atlas extends StatelessWidget {
  final CameraPosition _initialCameraPosition;

  Atlas({
    Key key,
    @required CameraPosition initialCameraPosition,
  })  : assert(initialCameraPosition != null),
        _initialCameraPosition = initialCameraPosition,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AtlasProvider.instance.build(
      initialCameraPosition: _initialCameraPosition,
    );
  }
}
