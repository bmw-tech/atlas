import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../models/models.dart';
import 'widgets.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class Demo extends StatelessWidget {
  final String title;
  final DemoCameraPosition initialCameraPosition;

  const Demo(this.title, this.initialCameraPosition)
      : assert(title != null),
        assert(initialCameraPosition != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(this.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<DemoBloc, DemoState>(
                condition: (previousState, state) {
              return (previousState.notificationMessage !=
                      state.notificationMessage) &&
                  (state.notificationMessage.isNotEmpty);
            }, listener: (context, state) async {
              if (state.notificationMessage != null) {
                _scaffoldKey.currentState.removeCurrentSnackBar();
                ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
                    controller =
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text(state.notificationMessage),
                        action: SnackBarAction(
                          label: 'close',
                          onPressed: () => BlocProvider.of<DemoBloc>(context)
                              .add(ClearNotification()),
                        )));
                await controller.closed.then((SnackBarClosedReason reason) {
                  BlocProvider.of<DemoBloc>(context).add(ClearNotification());
                });
              }
            }), // BlocListener - Notification listener
          ],
          child: Map(
            initialCameraPosition: initialCameraPosition,
            onCameraPositionChanged: (position) =>
                _onCameraPositionChanged(context, position),
            onTap: (coordinates) => _onTap(context, coordinates),
            onLongPress: (coordinates) => _onLongPress(context, coordinates),
            onLocationChanged: (coordinates) =>
                _onLocationChanged(context, coordinates),
            onMarkerTap: (markerName) => _onMarkerTap(context, markerName),
          ),
        ),
        floatingActionButton: BlocBuilder<DemoBloc, DemoState>(
            builder: _buildMainMenu) // BlocBuilder
        ); // Scaffold
  }

  // Build Floating Menu

  Widget _buildMainMenu(BuildContext context, DemoState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Visibility(
          key: Key('floatingMenu'),
          visible: BlocProvider.of<DemoBloc>(context).state.mainMenuOpen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                  key: Key('btnMapMode'),
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: FloatingActionButton(
                    heroTag: "btnMapMode",
                    child: Icon(Icons.map),
                    backgroundColor: Colors.grey,
                    onPressed: () {
                      BlocProvider.of<DemoBloc>(context).add(ShowNotification(
                          message:
                              'Only one map mode is supporred by this provider.'));
                    },
                  )),
              Padding(
                  key: Key('btnSetCameraPosition'),
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: FloatingActionButton(
                    heroTag: "btnSetCameraPosition",
                    child: Icon(Icons.crop_free),
                    onPressed: () {
                      BlocProvider.of<DemoBloc>(context)
                          .add(CloseDrawingsMenu());
                      _showCameraPositionDialog(context);
                    },
                  )),
              Padding(
                  key: Key('btnMarkers'),
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: FloatingActionButton(
                    heroTag: "btnMarkers",
                    child: Icon(Icons.pin_drop),
                    onPressed: () {
                      BlocProvider.of<DemoBloc>(context)
                          .add(CloseDrawingsMenu());
                      _showSelectionDialog(
                        context,
                        "Manage Markers",
                        (MapState state) => state.markers,
                        (MapState state) => state.selectedMarkerIds,
                        (selected) => BlocProvider.of<MapBloc>(context).add(
                            selected
                                ? SelectAllMarkers()
                                : DeselectAllMarkers()),
                        (item, selected) => BlocProvider.of<MapBloc>(context)
                            .add(selected
                                ? SelectMarker(item)
                                : DeselectMarker(item)),
                        (item) {},
                      );
                    },
                  )),
              Padding(
                key: Key('btnDrawings'),
                padding: const EdgeInsets.only(bottom: 10.0),
                child: _buildDrawingsMenu(context, state),
              ),
            ],
          ),
        ),
        Padding(
            key: Key('btnMenuToggle'),
            padding: const EdgeInsets.only(bottom: 10.0),
            child: FloatingActionButton(
              backgroundColor: Colors.grey,
              child: Icon(BlocProvider.of<DemoBloc>(context).state.mainMenuOpen
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_up),
              onPressed: () {
                BlocProvider.of<DemoBloc>(context).add(ToggleMainMenu());
              },
            )),
      ],
    );
  }

  Widget _buildDrawingsMenu(BuildContext context, DemoState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Visibility(
            key: Key('floatingMenu'),
            visible: BlocProvider.of<DemoBloc>(context).state.drawingsMenuOpen,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                      key: Key('btnRemoveAll'),
                      padding: const EdgeInsets.only(left: 10.0),
                      child: FloatingActionButton(
                        heroTag: "btnCircles",
                        backgroundColor: Colors.red,
                        child: Icon(Icons.delete_forever),
                        onPressed: () {
                          BlocProvider.of<DemoBloc>(context)
                              .add(CloseDrawingsMenu());
                          BlocProvider.of<MapBloc>(context)
                              .add(RemoveAllDrawings());
                        },
                      )),
                  Padding(
                      key: Key('btnCircles'),
                      padding: const EdgeInsets.only(left: 10.0),
                      child: FloatingActionButton(
                        heroTag: "btnCircles",
                        backgroundColor: Colors.green,
                        child: Icon(Icons.radio_button_unchecked),
                        onPressed: () {
                          BlocProvider.of<DemoBloc>(context)
                              .add(CloseDrawingsMenu());
                          _showSelectionDialog(
                            context,
                            "Manage Circles",
                            (MapState state) => state.circles,
                            (MapState state) => state.selectedCircleIds,
                            (selected) => BlocProvider.of<MapBloc>(context).add(
                                selected
                                    ? SelectAllCircles()
                                    : DeselectAllCircles()),
                            (item, selected) =>
                                BlocProvider.of<MapBloc>(context).add(selected
                                    ? SelectCircle(item)
                                    : DeselectCircle(item)),
                            (item) {},
                          );
                        },
                      )),
                  Padding(
                      key: Key('btnPolygons'),
                      padding: const EdgeInsets.only(left: 10.0),
                      child: FloatingActionButton(
                        heroTag: "btnPolygons",
                        backgroundColor: Colors.green,
                        child: Icon(Icons.panorama_horizontal),
                        onPressed: () {
                          BlocProvider.of<DemoBloc>(context)
                              .add(CloseDrawingsMenu());
                          _showSelectionDialog(
                            context,
                            "Manage Polygons",
                            (MapState state) => state.polygons,
                            (MapState state) => state.selectedPolygonIds,
                            (selected) => BlocProvider.of<MapBloc>(context).add(
                                selected
                                    ? SelectAllPolygons()
                                    : DeselectAllPolygons()),
                            (item, selected) =>
                                BlocProvider.of<MapBloc>(context).add(selected
                                    ? SelectPolygon(item)
                                    : DeselectPolygon(item)),
                            (item) {},
                          );
                        },
                      )),
                  Padding(
                      key: Key('btnPolyLines'),
                      padding: const EdgeInsets.only(left: 10.0),
                      child: FloatingActionButton(
                        heroTag: "btnPolyLines",
                        backgroundColor: Colors.green,
                        child: Icon(Icons.show_chart),
                        onPressed: () {
                          BlocProvider.of<DemoBloc>(context)
                              .add(CloseDrawingsMenu());
                          _showSelectionDialog(
                            context,
                            "Manage PolyLines",
                            (MapState state) => state.polyLines,
                            (MapState state) => state.selectedPolyLineIds,
                            (selected) => BlocProvider.of<MapBloc>(context).add(
                                selected
                                    ? SelectAllPolyLines()
                                    : DeselectAllPolyLines()),
                            (item, selected) =>
                                BlocProvider.of<MapBloc>(context).add(selected
                                    ? SelectPolyLine(item)
                                    : DeselectPolyLine(item)),
                            (item) {},
                          );
                        },
                      )),
                ])),
        Padding(
            key: Key('btnDrawings'),
            padding: const EdgeInsets.only(left: 10.0),
            child: FloatingActionButton(
              child: Icon(Icons.brush),
              heroTag: "btnDrawings",
              onPressed: () {
                BlocProvider.of<DemoBloc>(context).add(ToggleDrawingsMenu());
              },
            )),
      ],
    );
  }

  // Build Dialog Boxes

  void _showCameraPositionDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Change Camera Position'),
              content: Container(
                width: 280,
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: BlocBuilder<MapBloc, MapState>(
                    builder: (context, state) {
                      return Column(
                        children: state.cameraPositions
                            .map((cameraPosition) => ListTile(
                                  title: Text(cameraPosition.name),
                                  leading: Radio(
                                    value: cameraPosition,
                                    groupValue: state.currentCameraPosition,
                                    onChanged: (item) {
                                      BlocProvider.of<MapBloc>(context).add(
                                          SetCameraPosition(cameraPosition));
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  trailing: Icon(
                                    (cameraPosition.type ==
                                            CameraPositionType.Center)
                                        ? Icons.my_location
                                        : Icons.crop_free,
                                    size: 16,
                                    color: (cameraPosition.type ==
                                            CameraPositionType.Center)
                                        ? Colors.greenAccent
                                        : Colors.blueAccent,
                                  ),
                                  onTap: () {
                                    BlocProvider.of<MapBloc>(context)
                                        .add(SetCameraPosition(cameraPosition));
                                    Navigator.of(context).pop();
                                  },
                                ))
                            .toList(),
                      );
                    },
                  ),
                ),
              ),
              actions: <Widget>[
                OutlineButton(
                  child: Text('Done'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  void _showSelectionDialog(
    BuildContext context,
    String title,
    Function getItemList,
    Function getSelectedIds,
    Function onSelectAll,
    Function onSelectChanged,
    Function onEdit,
  ) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Container(
                  width: 280,
                  height: 300,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: BlocBuilder<MapBloc, MapState>(
                        builder: (context, state) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          columnSpacing: 2.0,
                          onSelectAll: (selected) => onSelectAll(selected),
                          columns: [
                            DataColumn(label: Text("Name")),
                            DataColumn(label: Text("")),
                          ],
                          rows: getItemList(state)
                              .map<DataRow>((item) => DataRow(
                                    selected:
                                        getSelectedIds(state).contains(item.id),
                                    onSelectChanged: (selected) =>
                                        onSelectChanged(item, selected),
                                    cells: [
                                      DataCell(Container(
                                        width: 180, //SET width
                                        child: Text(item.name),
                                      )),
                                      DataCell(Container(
                                        width: 20, //SET width
                                        child: IconButton(
                                          icon: Icon(Icons.edit, size: 16),
                                          onPressed: () => onEdit(item),
                                        ),
                                      )),
                                    ],
                                  ))
                              .toList(),
                        ),
                      );
                    }),
                  )),
              actions: <Widget>[
                OutlineButton(
                  child: Text('Done'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  // Notification Functions

  void _onCameraPositionChanged(
      BuildContext context, DemoCameraPosition position) {
    String newPosition = 'Center: ${position.center.toFormattedString()}\n'
        'Zoom Level: ${position.zoom}\n';
    BlocProvider.of<DemoBloc>(context).add(ShowNotification(
        message: 'Camera Position changed to \n${newPosition}'));
  }

  void _onTap(BuildContext context, DemoGeoCoordinates coordinates) {
    BlocProvider.of<DemoBloc>(context).add(ShowNotification(
        message: 'Tapped at ${coordinates.toFormattedString()}'));
  }

  void _onLongPress(BuildContext context, DemoGeoCoordinates coordinates) {
    BlocProvider.of<DemoBloc>(context).add(ShowNotification(
        message: 'Long Pressed at ${coordinates.toFormattedString()}'));
  }

  void _onLocationChanged(
      BuildContext context, DemoGeoCoordinates coordinates) {
    BlocProvider.of<DemoBloc>(context).add(ShowNotification(
        message: 'Location changed to ${coordinates.toFormattedString()}'));
  }

  void _onMarkerTap(BuildContext context, String name) {
    BlocProvider.of<DemoBloc>(context)
        .add(ShowNotification(message: 'Tapped on marker ${name}'));
  }
}
