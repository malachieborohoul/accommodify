import 'dart:convert';
import 'package:Accommodify/features/home/data/models/chambre_model.dart';
import 'package:Accommodify/features/home/data/models/image_model.dart';
import 'package:Accommodify/features/home/domain/entities/accommodation.dart';
import 'package:Accommodify/features/home/domain/entities/img.dart';

class AccommodationModel extends Accommodation {
  AccommodationModel({
    required super.id,
    required super.name,
    required super.type,
    required super.isActif,
    required super.address,
    required List<ChambreModel> chambres,
    required super.description,
    required super.latitude,
    required super.longitude,
    required super.phone,
    required  List<ImgModel> images,
  }): super(
          chambres: chambres,
          images: images,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'phone': phone,
      'isActif': isActif,
      'chambres': chambres.map((e) => (e as ChambreModel).toMap()).toList(),
      'images': images.map((e) => (e as ImgModel).toMap()).toList(),
    };
  }

  factory AccommodationModel.fromMap(Map<String, dynamic> map) {
    if (map['chambres'] is! List) {
  print("Erreur : 'chambres' n'est pas une liste. Valeur reçue : ${map['chambres']}");
}
if (map['images'] is! List) {
  print("Erreur : 'images' n'est pas une liste. Valeur reçue : ${map['images']}");
}

    return AccommodationModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      description: map['description'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      phone: map['phone'] ?? '',
      type: map['type'] ?? '',
      isActif: map['isActif'] ?? false,
   chambres: (map['chambres'] is List)
        ? (map['chambres'] as List<dynamic>)
            .map((e) => ChambreModel.fromMap(e as Map<String, dynamic>))
            .toList()
        : [],
    images: (map['images'] is List)
        ? (map['images'] as List<dynamic>)
            .map((e) => ImgModel.fromMap(e as Map<String, dynamic>))
            .toList()
        : [],
    );

    
  }

  String toJson() => json.encode(toMap());

  factory AccommodationModel.fromJson(String source) =>
      AccommodationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // AccommodationModel copyWith({
  //   int? id,
  //   String? name,
  //   String? date,
  //   String? address,
  //   String? description,
  //   String? latitude,
  //   String? longitude,
  //   String? type,
  //   String? phone,
  //   bool? isActif,
  //   List<ChambreModel>? chambres,
  //   List<ImgModel>? images,
  // }) {
  //   return AccommodationModel(
  //     id: id ?? this.id,
  //     name: name ?? this.name,
  //     address: address ?? this.address,
  //     description: description ?? this.description,
  //     latitude: latitude ?? this.latitude,
  //     longitude: longitude ?? this.longitude,
  //     images: images ?? this.images,
  //     chambres: chambres ?? this.chambres,
  //     type: type ?? this.type,
  //     phone: phone ?? this.phone,
  //     isActif: isActif ?? this.isActif,
  //   );
  // }

 


}
