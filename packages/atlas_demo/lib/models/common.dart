import 'package:equatable/equatable.dart';

class DemoGeoCoordinates extends Equatable {
  final double latitude;
  final double longitude;

  const DemoGeoCoordinates(
    this.latitude,
    this.longitude,
  );

  String toFormattedString() => '${latitude.toStringAsFixed(8)}, '
      '${longitude.toStringAsFixed(8)}';

  @override
  List<Object> get props => [
        latitude,
        longitude,
      ];
}

class DemoAnchor extends Equatable {
  final double x;
  final double y;

  const DemoAnchor({this.x = 0.5, this.y = 0.5});

  @override
  List<Object> get props => [
        x,
        y,
      ];
}

class DemoCallOut extends Equatable {
  const DemoCallOut({
    this.title,
    this.subTitle,
    this.icon,
  });

  final String title;

  final String subTitle;

  final String icon;

  @override
  List<Object> get props => [
        title,
        subTitle,
        icon,
      ];
}
