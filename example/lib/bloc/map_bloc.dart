import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  MapState get initialState => MapState.initial();

  @override
  Stream<MapState> transformEvents(
      Stream<MapEvent> events, Stream<MapState> Function(MapEvent event) next) {
    return (events as Observable<MapEvent>)
        .debounceTime(Duration(milliseconds: 200))
        .switchMap(next);
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
