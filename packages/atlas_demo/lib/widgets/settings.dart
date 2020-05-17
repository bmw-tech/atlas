import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_permissions/location_permissions.dart';

import '../blocs/blocs.dart';

const SECTION_HEADER_INSET =
    EdgeInsets.only(left: 14.0, top: 14.0, bottom: 8.0);
const FIELD_INSET = EdgeInsets.only(left: 32.0, right: 8.0);
const SUB_FIELD_INSET = EdgeInsets.only(left: 48.0, right: 8.0);

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: BlocBuilder<MapBloc, MapState>(builder: (_, state) {
        final settingsBloc = // ignore: close_sinks
            BlocProvider.of<MapBloc>(context); // ignore: close_sinks
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: SECTION_HEADER_INSET,
              child: Text(
                "Maps Settings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Divider(),
            SwitchListTile.adaptive(
              title: const Text('Show Traffic Mode'),
              contentPadding: FIELD_INSET,
              value: state.showTrafficMode,
              onChanged: (bool value) =>
                  settingsBloc.add(ToggleShowTrafficMode()),
            ),
            SwitchListTile.adaptive(
              title: const Text('Show My Location'),
              contentPadding: FIELD_INSET,
              value: state.showMyLocation,
              onChanged: (bool value) async {
                if (!value || await _getLocationPermission()) {
                  settingsBloc.add(ToggleShowMyLocation());
                }
              },
            ),
            SwitchListTile.adaptive(
              title: const Text('Follow Me Mode'),
              contentPadding: SUB_FIELD_INSET,
              value: state.followMeMode,
              onChanged: (bool value) => state.showMyLocation
                  ? settingsBloc.add(ToggleFollowMeMode())
                  : null,
            ),
            Divider(thickness: 3.0),
            Padding(
              padding: SECTION_HEADER_INSET,
              child: Text(
                "Notification",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Divider(),
            SwitchListTile.adaptive(
              title: const Text('Tap on Map'),
              contentPadding: FIELD_INSET,
              value: state.notifyTapOnMap,
              onChanged: (bool value) =>
                  settingsBloc.add(ToggleNotifyTapOnMap()),
            ),
            SwitchListTile.adaptive(
              title: const Text('Long Pressed on Map'),
              contentPadding: FIELD_INSET,
              value: state.notifyLongPressedOnMap,
              onChanged: (bool value) =>
                  settingsBloc.add(ToggleNotifyLongPressedOnMap()),
            ),
            SwitchListTile.adaptive(
              title: const Text('Tap On Marker'),
              contentPadding: FIELD_INSET,
              value: state.notifyTapOnMarker,
              onChanged: (bool value) =>
                  settingsBloc.add(ToggleNotifyTapOnMarker()),
            ),
            SwitchListTile.adaptive(
              title: const Text('Camera Position Change'),
              contentPadding: FIELD_INSET,
              value: state.notifyCameraPositionChange,
              onChanged: (bool value) =>
                  settingsBloc.add(ToggleNotifyCameraPositionChange()),
            ),
            SwitchListTile.adaptive(
              title: const Text('Device Location Change'),
              contentPadding: FIELD_INSET,
              value: state.notifyLocationChange,
              onChanged: (bool value) =>
                  settingsBloc.add(ToggleNotifyLocationChange()),
            ),
          ],
        );
      }),
    );
  }

  Future<bool> _getLocationPermission() async {
    const status = PermissionStatus.granted;
    const level = LocationPermissionLevel.locationWhenInUse;
    var locPerms = LocationPermissions();
    return await locPerms.checkPermissionStatus(level: level) == status ||
        await locPerms.requestPermissions(permissionLevel: level) == status;
  }
}
