import 'package:flutter/material.dart';
import 'package:atlas/atlas.dart';

/// import your `AtlasProvider` of choice
// import 'package:custom_atlas/custom_atlas.dart';

void main() {
  /// Set your `AtlasProvider` instance
  // AtlasProvider.instance = CustomAtlas();
  runApp(MyApp());
}

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
    /// Use `Atlas` as your Map Widget
    return Scaffold(
      body: Atlas(
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}
