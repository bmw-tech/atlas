# Atlas

[![CircleCI](https://circleci.com/gh/bmw-tech/atlas/tree/master.svg?style=shield)](https://circleci.com/gh/bmw-tech/atlas/tree/master)
[![codecov](https://codecov.io/gh/bmw-tech/atlas/branch/master/graph/badge.svg)](https://codecov.io/gh/bmw-tech/atlas)

An extensible map abstraction for Flutter with support for multiple map providers

| Package                                                                             | Pub                                                                                                    |
| ----------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [atlas](https://github.com/bmw-tech/atlas/tree/master/packages/atlas)               | [![pub package](https://img.shields.io/pub/v/atlas.svg)](https://pub.dev/packages/atlas)               |
| [google_atlas](https://github.com/bmw-tech/atlas/tree/master/packages/google_atlas) | [![pub package](https://img.shields.io/pub/v/google_atlas.svg)](https://pub.dev/packages/google_atlas) |

## Quick Start

### Setup

```dart
import 'package:flutter/material.dart';
import 'package:atlas/atlas.dart';
/// import your `AtlasProvider` of choice
import 'package:custom_atlas/custom_atlas.dart';

void main() {
  /// Set your `AtlasProvider` instance
  AtlasProvider.instance = CustomAtlas();
  runApp(MyApp());
}
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
  final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(
      latitude: 37.42796133580664,
      longitude: -122.085749655962,
    ),
    zoom: 14.4746,
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
      /// Use `Atlas` as your Map Widget
      body: Atlas(
        cameraPosition: _cameraPosition,
        markers: _markers,
      ),
    );
  }
}
```

## Maintainers

Project Lead(s):

- [@tchabot22](https://github.com/tchabot22)

Main Maintainer(s):

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
