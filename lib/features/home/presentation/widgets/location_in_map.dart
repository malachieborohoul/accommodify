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
    // Récupération des coordonnées de l'hébergement
    final latitude = double.parse(widget.Accommodify.latitude);
    final longitude = double.parse(widget.Accommodify.longitude);

    return GoogleMap(
      myLocationButtonEnabled: false,
      markers: {
        Marker(
          markerId: MarkerId(widget.Accommodify.address),
          position: LatLng(latitude, longitude),  // Utilisation correcte de latitude et longitude
        ),
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude), // Position initiale de la caméra
        zoom: 11,
      ),
    );
  }
}
