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

class AtlasSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AtlasSampleState();
  }

}

class AtlasSampleState extends State<AtlasSample> {
  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(
      //latitude: 37.42796133580664,
      //longitude: -122.085749655962,
      latitude: 41.8781,
      longitude: -87.6298,
    ),
    zoom: 12,
  );
  final Set<Marker> _markers = Set<Marker>.from([
    Marker(
      id: 'marker-1',
      position: LatLng(
        //latitude: 37.42796133580664,
        //longitude: -122.085749655962,
        latitude: 41.8781,
        longitude: -87.6298
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
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
        onTap: (LatLng position) {
          print('map tapped: ${position.latitude}, ${position.longitude}');
        },
        showMyLocation: true,
        showMyLocationButton: true,
        actions: [ 
          Action(
            key: Key('userAction'),
            iconData: Icons.location_on,
            onTap: () {
              setState( () {
                _initialCameraPosition = CameraPosition(
                  target: LatLng(
                    latitude: 41.8661,
                    longitude: -88.1070,
                  ),
                  zoom: 12,
                );
              });
            },
          ),
          Action(
            key: Key('vehicleAction'),
            iconData: Icons.location_searching,
            onTap: () {
              print('vehicle action tapped');
            }
          ),
        ],
      ),
    );
  }
}
