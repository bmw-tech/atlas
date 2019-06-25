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
  CameraPosition _cameraPosition = CameraPosition(
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
      body: Stack(
        children: [
          Atlas(
            cameraPosition: _cameraPosition,
            markers: _markers,
            showMyLocation: true,
            showMyLocationButton: false,
            onTap: (LatLng position) {
              print('map tapped: ${position.latitude}, ${position.longitude}');
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
                      setState(() {
                        _cameraPosition = CameraPosition(
                          target: LatLng(
                            latitude: 41.8661,
                            longitude: -90.1070,
                          ),
                          zoom: 12.0,
                        );
                      });
                    }
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
