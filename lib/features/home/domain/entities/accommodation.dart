import 'package:Accommodify/features/home/domain/entities/chambre.dart';

class Accommodation {
  final int id;
  final String title;
  final String address;
  final String description;
  final List<Chambre> chambres;
  final String latitude;
  final String longitude;
  final String type;
  final String phone;
  final List<String> imageUrls;

  Accommodation( 
      {
        required this.id,
        required this.title,
      required this.address,
      required this.description,
      required this.chambres,
      required this.type,
     
      required this.latitude,
      required this.longitude,
      required this.phone,
      required this.imageUrls});

}