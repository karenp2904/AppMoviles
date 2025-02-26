
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? _locationUrl;

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location services are disabled.')));
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location permissions are denied.')));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Location permissions are permanently denied.')));
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _locationUrl = 'http://www.google.com/maps/place/${position.latitude},${position.longitude}';
    });
  }

  Future<void> _openMap() async {
    if (_locationUrl != null && await canLaunchUrl(Uri.parse(_locationUrl!))) {
      await launchUrl(Uri.parse(_locationUrl!));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open the map.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GPS to Google Maps')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getLocation,
              child: const Text('Get Current Location'),
            ),
            const SizedBox(height: 20),
            if (_locationUrl != null) ...[
              SelectableText(_locationUrl!, style: const TextStyle(color: Colors.blue)),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _openMap,
                child: const Text('Open in Google Maps'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
