# Atlas

[![Build Status](https://github.com/bmw-tech/atlas/actions/workflows/main.yml/badge.svg)](https://github.com/bmw-tech/atlas/actions)
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
  final _initialCameraPosition = LatLng(
    latitude: 37.42796133580664,
    longitude: -122.085749655962,
  );
  final _markers = Set<Marker>.from([
    Marker(
      id: 'marker-1',
      position: LatLng(
        latitude: 37.42796133580664,
        longitude: -122.085749655962,
      ),
      icon: MarkerIcon(
        assetName: 'assets/marker.png',
      ),
      anchor: Anchor(
        x: 0.5,
        y: 1.0,
      )
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
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
      ),
    );
  }
}
```

## Maintainers

This project is maintained by BMW Group.

Thank you to the original authors

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
