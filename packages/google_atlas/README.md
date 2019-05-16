# google_atlas

[![CircleCI](https://circleci.com/gh/bmw-tech/atlas/tree/master.svg?style=svg)](https://circleci.com/gh/bmw-tech/atlas/tree/master)
[![codecov](https://codecov.io/gh/bmw-tech/atlas/branch/master/graph/badge.svg)](https://codecov.io/gh/bmw-tech/atlas)

Google Maps Atlas Provider that is built to work with [atlas](../atlas/README.md).

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
  final CameraPosition _initialCameraPosition = CameraPosition(
    target: CoordinatePair(
      latitude: 37.42796133580664,
      longitude: -122.085749655962,
    ),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Atlas(
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}
```

## Maintainers

Project Lead(s):

- @tchabot22

Main Maintainer(s):

- @felangel

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
