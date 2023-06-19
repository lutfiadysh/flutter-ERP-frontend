import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 242;
    return SizedBox(
      height: height <= 450 ? 450 : height,
      child: !kIsWeb
          ? TargetPlatform.macOS == defaultTargetPlatform ||
                  TargetPlatform.windows == defaultTargetPlatform
              ? const Center(child: Text('Map is not supported in desktop'))
              : GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(21.1920639, 72.7852803),
                    zoom: 14.4746,
                  ),
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                )
          : GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(21.1920639, 72.7852803),
                zoom: 14.4746,
              ),
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
    );
  }
}
