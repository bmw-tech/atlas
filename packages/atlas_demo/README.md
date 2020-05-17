# atlas_demo

[![CircleCI](https://circleci.com/gh/bmw-tech/atlas/tree/master.svg?style=shield)](https://circleci.com/gh/bmw-tech/atlas/tree/master)
[![codecov](https://codecov.io/gh/bmw-tech/atlas/branch/master/graph/badge.svg)](https://codecov.io/gh/bmw-tech/atlas)

Atlas Demo that is built to work with [atlas](https://pub.dev/packages/atlas).

## Quick Start

### Usage

```dart
import 'package:flutter/material.dart';
import 'package:atlas/atlas.dart';
import 'package:google_atlas/google_atlas.dart';

void main() {
  AtlasProvider.instance = GoogleAtlas();
  runApp(AtlasDemo('My Atlas Demo', InitialMapData(
    cameraPositions: DemoCameraPosition(
      name: 'Initial Position',
      type: CameraPositionType.Center,
      center: DemoGeoCoordinates(41.875492, -87.645631),
      zoom: 12,
    ),
  ));
}
```
- Please refer to the file 'initial_map_data_sample.dart'

## Maintainers

Project Lead(s):

- [@ksantiya](https://github.com/ksantiya)

Main Maintainer(s):

- [@sunoh5](https://github.com/sunoh5)
- [@noleplay81](https://github.com/noleplay81)
- [@dydkask](https://github.com/dydkask)

## License

```
MIT License

Copyright (c) 2020 BMW Technology Corporation

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
