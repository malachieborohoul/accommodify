import 'package:accommodation/features/home/domain/entities/accommodation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationInMap extends StatefulWidget {
  final Accommodation accommodation;
  const LocationInMap({
    super.key,
    required this.accommodation,
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
            widget.accommodation.address,
          ),
          position: LatLng(
            widget.accommodation.latitude,
            widget.accommodation.latitude,
          ),
        ),
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(
          widget.accommodation.latitude,
            widget.accommodation.latitude,
        ),
        zoom: 11
      ),
    );
  }
}