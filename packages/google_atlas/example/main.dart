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
  final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(
      latitude: 37.42796133580664,
      longitude: -122.085749655962,
    ),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Atlas(
        initialCameraPosition: initialCameraPosition,
        markers: Set<Marker>.from(
          [
            Marker(
              id: 'marker-1',
              position: LatLng(
                latitude: 41.878113,
                longitude: -87.629799,
              ),
              onTap: () {
                print('tapped marker-1');
              },
            ),
            Marker(
              id: 'marker-3',
              position: LatLng(
                latitude: 40.878113,
                longitude: -100.629799,
              ),
              onTap: () {
                print('tapped marker-3');
              },
              icon: MarkerIcon(
                assetName: 'assets/mario.png',
              ),
            )
          ],
        ),
      ),
    );
  }
}
