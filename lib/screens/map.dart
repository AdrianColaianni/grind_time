import 'package:flutter/material.dart';
import 'package:grind_time/models/location.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    //
    return Consumer<LocationService>(builder: (context, location, child) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Latitude: ${location.latitude}'),
            Text('Longitude: ${location.longitude}')
          ],
        ),
      );
    });
    //
    // return const Center(child: Text('Howdy do!'));
  }
}
