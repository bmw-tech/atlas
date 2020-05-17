import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'common.dart';

class DemoCircle extends Equatable {
  final String id;
  final String name;
  final DemoGeoCoordinates center;
  final double radius;
  final Color strokeColor;
  final int strokeWidth;
  final int strokeAlpha;
  final Color fillColor;
  final int fillAlpha;

  const DemoCircle({
    this.id,
    this.name,
    this.center,
    this.radius,
    this.strokeColor,
    this.strokeWidth,
    this.strokeAlpha,
    this.fillColor,
    this.fillAlpha,
  });

  @override
  List<Object> get props => [
        id,
        name,
        center,
        radius,
        strokeColor,
        strokeWidth,
        strokeAlpha,
        fillColor,
        fillAlpha,
      ];
}

class DemoPolygon extends Equatable {
  final String id;
  final String name;
  final List<DemoGeoCoordinates> points;
  final Color strokeColor;
  final int strokeWidth;
  final int strokeAlpha;
  final Color fillColor;
  final int fillAlpha;

  const DemoPolygon({
    this.id,
    this.name,
    this.points,
    this.strokeColor,
    this.strokeWidth,
    this.strokeAlpha,
    this.fillColor,
    this.fillAlpha,
  });

  @override
  List<Object> get props => [
        id,
        name,
        points,
        strokeColor,
        strokeWidth,
        strokeAlpha,
        fillAlpha,
        fillColor,
      ];
}

class DemoPolyLine extends Equatable {
  final String id;
  final String name;
  final List<DemoGeoCoordinates> points;
  final Color strokeColor;
  final int strokeWidth;

  const DemoPolyLine({
    this.id,
    this.name,
    this.points,
    this.strokeColor,
    this.strokeWidth,
  });

  @override
  List<Object> get props => [
        id,
        name,
        points,
        strokeColor,
        strokeWidth,
      ];
}
