# atlas

## v1.0.16 (2023-12-18)

- update sdk version

## v1.0.15 (2023-12-18)

- Added new codeowners

## v1.0.14 (2023-12-15)

- Added new enum CongestionLevel  

## v1.0.13 (2023-11-21)

- Added support for map styles

## v1.0.12 (2023-11-14)

- Added new function `updateMapCompassProperties`

## v1.0.11 (2023-09-29)

- Add `isUserUpdate`` to `CameraPosition`

## v1.0.10 (2023-07-29)

- Added new function `getLatLngBounds`
- Added min and max zoom variables
- Added onPolylineTap

## v1.0.9 (2023-01-16)

- Add ability to supply `TrackPlayback` on atlas

## v1.0.8 (2022-12-09)

- Added ability to set political views
- Add support to dispose provider sdk

## v1.0.7 (2022-07-09)

- Added ability to supply an `Heading` on `DeviceLocation`
- Added ability to supply an `3Dassets` on `DeviceLocation`
- Added ability to supply an `isActive` on `DeviceLocation`

## v1.0.6 (2022-18-07)

- Add support for `updateMapLogoBottomPadding` function

## v1.0.5 (2022-03-12)

- Add ability to supply `Cluster` on atlas

## v1.0.4 (2022-03-05)

- Added support for `getScreenShot` function

## v1.0.3 (2022-03-03)

- Added ability to supply an `Anchor` on a `Callout`

## v1.0.2 (2022-01-24)

- Fix: removed onTap from the marker == comparer (functions from different instances will never be the same)

## v1.0.1 (2022-01-21)

- Added `pulsingVisible`, `pulsingTime` and `pulsingInterval` boolean properties to the Circle object

## v1.0.0 (2021-11-18)

- Atlas now supports null safety
- **BREAKING**: opt into null safety
  - upgrade Dart SDK constraints to `>=2.12.0 <3.0.0`

## v0.17.5 (2021-11-17)

- README.md updated

## v0.17.4 (2021-11-11)

- Adjusted `hashCode` and `operator ==` for the map objects

## v0.17.3 (2021-11-11)

- Added support for Polyline and Callout `onTap` function

## v0.17.2 (2021-10-13)

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
