# atlas

## v0.17.2 (2021-09-17)

- Added ability to supply an `Intervals` on a `Polyline`

## v0.17.1 (2021-10-01)

- Added hashcode and == operator override methods `Anchor` object

## v0.17.0 (2021-09-01)

- Added ability to supply a `StrokeWidth` on a `Circle`

## v0.16.0 (2021-04-07)

- Added ability to supply an `assetBytes` on a `MarkerIcon`

## v0.15.0 (2021-03-19)

- Added `getBounds` method to `AtlasController`

## v0.14.2 (2021-02-10)

- Added support for `Callout` on a Map
- Added ability to supply a `height` on a `MarkerIcon`

## v0.14.1 (2021-02-10)

- Added `deviceLocation`, `deviceLocationIconAsset` and `country` to Atlas map

## v0.14.0 (2021-01-14)

- Refactor update bounds method

## v0.13.0 (2021-01-08)

- Added `​​​​​MoveCameraAnimation` to moveCamera method.

## v0.12.3 (2020-12-22)

- Added `isDottedLine` to Polyline object

## v0.12.2 (2020-11-12)

- `onPan` callback added to Atlas Map

## v0.12.1 (2020-9-30)

- Added `heading` to Marker object

## v0.12.0 (2020-9-04)

- `onPoiTap` callback added to Atlas Map

## v0.11.0 (2020-9-01)

- Added `getVisibleArea` function to Atlas Controller

## v0.10.0 (2020-8-19)

- Added `mapLanguage` property to provide map languages support

## v0.9.0 (2020-7-22)

- Updated `getCameraPosition` function to be Future

## v0.8.0 (2020-7-13)

- Added `getCameraPosition` function to Atlas Controller

## v0.7.0 (2020-5-12)

- Added `changeUserLocationIcon` function

## v0.6.1 (2020-5-9)

- Added 'outlineWidth' to 'Polyline'
- Added 'outlineColor' to 'Polyline'

## v0.6.0 (2020-4-7)

- `onCameraPositionChanged` callback added to Atlas Map
- `onLocationChanged` callback added to Atlas Map
- `Annotation` class added to support annotations on `Marker` objects
- Added `updateBoundsWithPaddingToAllSides` for more granular padding options

## v0.5.3 (2020-4-3)

- Added custom width support for `MarkerIcon`

## v0.5.1 (2020-02-27)

- Added night as `MapType` enum

## v0.5.0 (2020-02-13)

- Added support for `MapType`
- Added `showTraffic` boolean
- Added `getScreenCoordinate` to translate from `LatLng`
- Added `getLatLng` to translate from `ScreenCoordinates`

## v0.4.0 (2020-01-22)

- Added support for `Polyline` on a Map
- Added support for `Polygon` on a Map
- Added ability to supply an `Anchor` on a `Marker`

## v0.3.0 (2019-11-15)

- Added support for `Circle` on a Map

## v0.2.0 (2019-10-16)

- `onLongPress` callback added to Atlas Map

## v0.1.0 (2019-10-08)

- Add `zIndex` to `Marker`
- Remove dependency on `meta`
- Add `==` and `hashCode` overrides to `MarkerIcon`

## v0.0.8 (2019-8-22)

- Refactor to include `AtlasController`

## v0.0.7 (2019-8-7)

- Optional Map Marker Icon

## v0.0.6 (2019-7-30)

- Remove `CameraPosition` (replaced with `LatLng` position)

## v0.0.5 (2019-6-19)

- `showLocationButton` added to Atlas Map
- `initialCameraPosition` renamed to `cameraPosition`

## v0.0.4 (2019-5-22)

- `showMyLocation` added to Atlas Map

## v0.0.3 (2019-5-20)

- `onTap` callback added to Atlas Map

## v0.0.2 (2019-5-17)

Map Marker Integration and Documentation Updates

- Marker Definition and Integration
- Added Documentation to Atlas APIs
- Renamed `CoordinatePair` to `LatLng`

## v0.0.1 (2019-5-16)

- Initial Api Definition and Implementation

## v0.0.0 (2019-5-15)

- Project was created
