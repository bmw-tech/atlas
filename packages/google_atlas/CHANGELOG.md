# google_atlas

## v0.7.0 (2021-11-17)

- Atlas updated to support `v0.17.3`

## v0.6.1 (2020-9-30)

- Update to use `atlas v0.12.1`

## v0.6.0 (2020-9-23)

- `onPoiTap` callback added to Atlas Map

## v0.5.0 (2020-9-01)

- Added support for `getVisibleArea` function

## v0.4.0 (2020-8-26)

- Added support for `MapLanguage`

## v0.3.7 (2020-7-22)

- Updated `getCameraPosition` method to return Future promise

## v0.3.6 (2020-7-13)

- Added implementation for `getCameraPosition` method (empty implementation since google-atlas does not support this feature)

## v0.3.5 (2020-5-12)

- Added support for `changeUserLocationIcon` function (May not work on all MapProviders)

## v0.3.4 (2020-4-16)

- Added support for `onCameraPositionChanged` callback

## v0.3.3 (2020-4-8)

- Use `MarkerIcon` width value

## v0.3.2 (2020-4-2)

- Fix icon asset size issue

## v0.3.1 (2019-3-16)

- Added support for mapTypes

## v0.3.0 (2019-10-17)

- Google Maps Provider supports onLongPress (atlas `v0.2.0`)

## v0.2.1 (2019-9-19)

- Fix `myLocationButton` bug in iOS

## v0.2.0 (2019-8-22)

- Update to use `atlas v0.0.8`

## v0.1.2 (2019-8-20)

- Only update camera position on position changes

## v0.1.1 (2019-8-16)

- Update default zoom level

## v0.1.0 (2019-8-8)

- Optional Marker Icon

## v0.0.9 (2019-8-5)

- Additional Map Bounding Improvements

## v0.0.8 (2019-7-30)

- Remove `CameraPosition`
- Map Bounding Improvements

## v0.0.7 (2019-6-25)

- Set camera bounds based on markers

## v0.0.6 (2019-6-25)

- Changed GoogleAtlas to StatefulWidget in order to track position and provide map position updates when camera position changes
- FakeMapController added to assist with testing GoogleAtlas map more accurately
- Transitioned GoogleAtlas unit tests to widget tests to better evaluate functionality

## v0.0.5 (2019-6-19)

- `showMyLocationButton` added to GoogleAtlas
- `initialCameraPosition` renamed to `cameraPosition`

## v0.0.4 (2019-5-22)

- Google Maps Provider supports showMyLocation (atlas `v0.0.4`)

## v0.0.3 (2019-5-20)

- Google Maps Provider supports onTap (atlas `v0.0.3`)

## v0.0.2 (2019-5-20)

- Google Maps Provider supports Markers (atlas `v0.0.2`)

## v0.0.1 (2019-5-16)

- Google Maps Provider which conforms to the initial Api Definition (atlas `v0.0.1`)

## v0.0.0 (2019-5-16)

- Project was created
