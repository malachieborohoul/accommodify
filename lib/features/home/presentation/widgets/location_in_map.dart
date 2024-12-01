import 'package:Accommodify/features/home/domain/entities/accommodation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationInMap extends StatefulWidget {
  final Accommodation Accommodify;
  const LocationInMap({
    super.key,
    required this.Accommodify,
  });

  @override
  State<LocationInMap> createState() => _LocationInMapState();
}

class _LocationInMapState extends State<LocationInMap> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      
      myLocationButtonEnabled: false,
      markers: {
        Marker(
          markerId: MarkerId(
            widget.Accommodify.address,
          ),
          position: LatLng(
            widget.Accommodify.latitude,
            widget.Accommodify.latitude,
          ),
        ),
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(
          widget.Accommodify.latitude,
            widget.Accommodify.latitude,
        ),
        zoom: 11
      ),
    );
  }
}