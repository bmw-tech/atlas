import 'package:equatable/equatable.dart';
import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

// Camera Position Changed Events
class MapCameraPositionChanged extends MapEvent {
  final CameraPosition cameraPosition;

  const MapCameraPositionChanged({@required this.cameraPosition});

  @override
  List<Object> get props => [cameraPosition];
}

// Show Seach Area Button Events
class MapShowSearchAreaButtonChanged extends MapEvent {
  final bool showSearchAreaButton;

  const MapShowSearchAreaButtonChanged({@required this.showSearchAreaButton});

  @override
  List<Object> get props => [showSearchAreaButton];
}
