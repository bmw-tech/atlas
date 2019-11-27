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
  State<AtlasSample> createState() => _AtlasSampleState();
}

class _AtlasSampleState extends State<AtlasSample> {
  final _initialCameraPosition = CameraPosition(
    target: LatLng(
      latitude: 37.42796133580664,
      longitude: -122.085749655962,
    ),
    zoom: 12,
  );
  AtlasController _controller;
  final _markers = <Marker>{
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
      id: 'marker-2',
      position: LatLng(
        latitude: 42.878113,
        longitude: -87.629799,
      ),
      onTap: () {
        print('tapped marker-2');
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
  };
  final _circles = <Circle>{
    Circle(
      id: 'circle-1',
      center: LatLng(
        latitude: 38.7439498,
        longitude: -9.1490721,
      ),
      radiusInMeters: 10.0,
    ),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Atlas(
            initialCameraPosition: _initialCameraPosition,
            markers: _markers,
            circles: _circles,
            showMyLocation: true,
            showMyLocationButton: false,
            onTap: (LatLng position) {
              print(
                'map tapped: ${position.latitude}, ${position.longitude}',
              );
            },
            onLongPress: (LatLng position) {
              print('long press ${position.latitude}, ${position.longitude}');
              setState(() {
                _markers.add(
                  Marker(
                    id: 'marker-4',
                    position: position,
                    onTap: () {
                      print('tapped marker-4');
                    },
                  ),
                );
              });
            },
            onMapCreated: (controller) {
              _controller = controller;
            },
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: 175,
                right: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.location_on),
                    onPressed: () {
                      _controller?.moveCamera(
                        CameraPosition(
                          target: LatLng(
                            latitude: 41.8661,
                            longitude: -90.1070,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
