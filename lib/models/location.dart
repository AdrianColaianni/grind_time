import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
class LocationService extends ChangeNotifier {
  Location location = Location();
  late LocationData locationData;

  LocationService() {
    update();
    location.onLocationChanged.listen((LocationData currentLocation) {
        locationData = currentLocation;
        notifyListeners();
    });
  }

  double get longitude =>
      (locationData.longitude is double) ? locationData.longitude as double : 0;

  double get latitude =>
      (locationData.latitude is double) ? locationData.latitude as double : 0;

  update() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    // Allows location in background
    location.enableBackgroundMode(enable: true);

    locationData = await location.getLocation();
    notifyListeners();
  }

}
