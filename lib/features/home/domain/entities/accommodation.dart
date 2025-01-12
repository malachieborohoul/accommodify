import 'package:Accommodify/features/home/domain/entities/chambre.dart';

class Accommodation {
  final int id;
  final String title;
  final String address;
  final String description;
  final Chambre chambre;
  final  latitude;
  final String longitude;
  final List<String> imageUrls;

  Accommodation(
      {
        required this.id,
        required this.title,
      required this.address,
      required this.description,
      required this.chambre,
     
      required this.latitude,
      required this.longitude,
      required this.imageUrls});

}