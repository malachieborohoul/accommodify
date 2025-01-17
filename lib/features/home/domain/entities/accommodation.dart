import 'package:Accommodify/features/home/domain/entities/chambre.dart';
import 'package:Accommodify/features/home/domain/entities/img.dart';

class Accommodation {
  final int id;
  final String name;
  final String address;
  final String description;
  final List<Chambre> chambres;
  final String latitude;
  final String longitude;
  final String type;
  final String phone;
  final bool isActif;
  final List<Img> images;

  Accommodation( 
      {
        required this.id,
        required this.name,
      required this.address,
      required this.description,
      required this.chambres,
      required this.type,
     
      required this.latitude,
      required this.isActif,
      required this.longitude,
      required this.phone,
      required this.images});

}