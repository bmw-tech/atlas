import 'dart:async';

import 'package:bloc/bloc.dart';

import 'demo_event.dart';
import 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  @override
  DemoState get initialState => DemoState.initial();

  @override
  Stream<DemoState> mapEventToState(DemoEvent event) async* {
    if (event is ToggleMainMenu) {
      yield* _toggleMainMenuVisibility();
    } else if (event is ToggleDrawingsMenu) {
      yield* _toggleDrawingsVisibility();
    } else if (event is CloseDrawingsMenu) {
      yield* _closeDrawingsVisibility();
    } else if (event is ShowNotification) {
      yield* _handleNotifyUser(event);
    } else if (event is ClearNotification) {
      yield* _handleClearNotification();
    }
  }

  Stream<DemoState> _toggleMainMenuVisibility() async* {
    yield state.copyWith(
      mainMenuOpen: !state.mainMenuOpen,
      drawingsMenuOpen: false,
    );
  }

  Stream<DemoState> _toggleDrawingsVisibility() async* {
    yield state.copyWith(
      drawingsMenuOpen: !state.drawingsMenuOpen,
    );
  }

  Stream<DemoState> _closeDrawingsVisibility() async* {
    yield state.copyWith(
      drawingsMenuOpen: false,
    );
  }

  Stream<DemoState> _handleNotifyUser(event) async* {
    yield state.copyWith(
        notificationMessage: (event as ShowNotification).message);
  }

  Stream<DemoState> _handleClearNotification() async* {
    yield state.copyWith(notificationMessage: '');
  }
}
