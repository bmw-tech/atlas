import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum MenuItem {
  settings,
  mapMode,
  cameraPosition,
  markers,
  drawings,
}

abstract class DemoEvent extends Equatable {
  const DemoEvent();

  @override
  List<Object> get props => [];
}

// Demo Events
class ToggleMainMenu extends DemoEvent {}

class ToggleDrawingsMenu extends DemoEvent {}

class CloseDrawingsMenu extends DemoEvent {}

class ShowNotification extends DemoEvent {
  final String message;

  const ShowNotification({@required this.message});

  @override
  List<Object> get props => [message];
}

class ClearNotification extends DemoEvent {}
