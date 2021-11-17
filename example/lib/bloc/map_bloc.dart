import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  EventTransformer<MapEvent> debounce<MapEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
  }

  MapBloc() : super(MapState.initial()) {
    on<MapCameraPositionChanged>((_, __) {},
        transformer: debounce(const Duration(milliseconds: 200)));
  }

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is MapCameraPositionChanged) {
      yield* _mapMapCameraPositionChangedToState(event);
    } else if (event is MapShowSearchAreaButtonChanged) {
      yield* _mapShowSearchAreaButtonChanged(event);
    }
  }

  Stream<MapState> _mapMapCameraPositionChangedToState(
      MapCameraPositionChanged event) async* {
    yield state.copyWith(newDefaultCameraPosition: event.cameraPosition);
    if ((event.cameraPosition.target.longitude !=
                state.defaultCameraPosition.target.longitude &&
            event.cameraPosition.target.latitude !=
                state.defaultCameraPosition.target.latitude) ||
        event.cameraPosition.zoom != state.defaultCameraPosition.zoom) {
      yield state.copyWith(showSearchAreaButton: true);
    }
  }

  Stream<MapState> _mapShowSearchAreaButtonChanged(
      MapShowSearchAreaButtonChanged event) async* {
    yield state.copyWith(showSearchAreaButton: event.showSearchAreaButton);
  }
}
