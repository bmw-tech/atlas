import 'package:equatable/equatable.dart';

class DemoState extends Equatable {
  final bool mainMenuOpen;
  final bool drawingsMenuOpen;
  final String notificationMessage;

  const DemoState({
    this.mainMenuOpen,
    this.drawingsMenuOpen,
    this.notificationMessage,
  });

  factory DemoState.initial() {
    return DemoState(
      mainMenuOpen: false,
      drawingsMenuOpen: false,
      notificationMessage: '',
    );
  }

  DemoState copyWith({
    bool mainMenuOpen,
    bool drawingsMenuOpen,
    String notificationMessage,
  }) {
    return DemoState(
      mainMenuOpen: mainMenuOpen ?? this.mainMenuOpen,
      drawingsMenuOpen: drawingsMenuOpen ?? this.drawingsMenuOpen,
      notificationMessage: notificationMessage ?? this.notificationMessage,
    );
  }

  @override
  List<Object> get props => [
        mainMenuOpen,
        drawingsMenuOpen,
        notificationMessage,
      ];
}
