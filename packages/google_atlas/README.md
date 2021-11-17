# google_atlas

[![Build Status](https://github.com/bmw-tech/atlas/actions/workflows/main.yml/badge.svg)](https://circleci.com/gh/bmw-tech/atlas/tree/master)
[![codecov](https://codecov.io/gh/bmw-tech/atlas/branch/master/graph/badge.svg)](https://codecov.io/gh/bmw-tech/atlas)

Google Maps Atlas Provider that is built to work with [atlas](https://pub.dev/packages/atlas).

## Quick Start

### Setup

```dart
import 'package:flutter/material.dart';
import 'package:atlas/atlas.dart';
import 'package:google_atlas/google_atlas.dart';

void main() {
  AtlasProvider.instance = GoogleAtlas();
  runApp(MyApp());
}
```


##### Additional setup for Android:
- Specify your Google Maps API key in the application manifest `android/app/src/main/AndroidManifest.xml`:
```
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>
```


##### Additional setup for iOS:
- Specify your Google Maps API key in the application delegate `ios/Runner/AppDelegate.swift`:
```swift
import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
  	GMSServices.provideAPIKey("YOUR KEY HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```
- Enable `io.flutter.embedded_views_preview` in `ios/Runner/Info.plist`:
```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    ...
    <key>io.flutter.embedded_views_preview</key>
    <true/>
    ...
</dict>
</plist>
```


### Usage

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atlas Sample Demo',
      home: AtlasSample(),
    );
  }
}

class AtlasSample extends StatelessWidget {
  final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(
      latitude: 37.42796133580664,
      longitude: -122.085749655962,
    ),
    zoom: 12,
  );
  final Set<Marker> _markers = Set<Marker>.from([
    Marker(
      id: 'marker-1',
      position: LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      ),
      onTap: () {
        print('tapped marker-1');
      },
    )
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Atlas(
        initialCameraPosition: initialCameraPosition,
        markers: _markers,
      ),
    );
  }
}
```

## Maintainers

This project is maintained by BMW Group.

Thank you to the original authors:

- [@tchabot22](https://github.com/tchabot22)
- [@felangel](https://github.com/felangel)
- [@jorgecoca](https://github.com/jorgecoca)
- [@noahmateen](https://github.com/noahmateen)

## License

```
MIT License

Copyright (c) 2019 BMW Technology Corporation

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
