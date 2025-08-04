import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermissionPage extends StatefulWidget {
  const LocationPermissionPage({super.key});

  @override
  State<LocationPermissionPage> createState() => _LocationPermissionPageState();
}

class _LocationPermissionPageState extends State<LocationPermissionPage> {
  String _locationMessage = 'Location not fetched yet';

  Future<void> _getLocation() async {
    PermissionStatus permission = await Permission.location.status;

    if (permission.isGranted) {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _locationMessage = 'Location service is disabled.';
        });
        return;
      }

      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          _locationMessage:
          'Location: ${position.latitude}, ${position.longitude}';
        });
      } catch (e) {
        setState(() {
          _locationMessage = 'Error fetching location: $e';
        });
      }
    } else if (permission.isPermanentlyDenied) {
      setState(() {
        _locationMessage =
            'Location permission is permanently denied. Please enable it in settings.';
      });
      openAppSettings();
    } else {
      setState(() {
        _locationMessage =
            'Location permission is denied. Requesting permission...';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location Permission & Fetch')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_locationMessage, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _getLocation,
                child: const Text('Get Current Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
