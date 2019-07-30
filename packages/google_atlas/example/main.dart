import 'package:flutter/material.dart';
import 'package:atlas/atlas.dart';
import 'package:google_atlas/google_atlas.dart';

void main() {
  AtlasProvider.instance = GoogleAtlas();
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
  final LatLng position = LatLng(
    latitude: 37.42796133580664,
    longitude: -122.085749655962,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Atlas(
        position: position,
      ),
    );
  }
}
