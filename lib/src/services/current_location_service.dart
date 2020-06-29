import 'dart:async';

import 'package:location/location.dart';

class CurrentLocationService {
  final Location currentLocation = Location();

  CurrentLocationService();

  Future<PermissionStatus> _checkPermissions() async {
    return await currentLocation.hasPermission();
  }

  Future<bool> _checkService() async {
    return await currentLocation.serviceEnabled();
  }

  Future<void> _requestService() async {
    _checkService().then((enabled) async {
      if (enabled == null || !enabled) {
        final bool serviceRequested = await currentLocation.requestService();
        if (!serviceRequested) {
          return;
        }
      }
    });
  }

  Future<void> _requestPermission() async {
    _checkPermissions().then((permission) async {
      if (permission != PermissionStatus.granted) {
        final PermissionStatus permissionRequested =
            await currentLocation.requestPermission();
        if (permissionRequested != PermissionStatus.granted) {
          return;
        }
      }
    });
  }

  Future<LocationData> getLocation() async {
    LocationData locationData;
    try {
      await _requestPermission();
      await _requestService();
      locationData = await currentLocation.getLocation();
    } catch (e) {
      locationData = null;
    }
    return locationData;
  }

  
}
