import 'dart:convert';

import 'package:Accommodify/features/home/data/models/chambre_model.dart';
import 'package:Accommodify/features/home/domain/entities/accommodation.dart';


class AccommodationModel extends Accommodation{
  AccommodationModel({required super.id, required super.title, required super.type,  required super.address,required super.chambres,required super.description, required super.latitude, required super.longitude, required super.imageUrls});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'address': address,
      'description': description,
      'chambres': chambres,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrls': imageUrls,
    };
  }

    factory AccommodationModel.fromMap(Map<String, dynamic> map) {
    return AccommodationModel(
      id: map['id'] ?? '' ,
      title: map['title'] ?? '',
    // chambre: ChambreModel.fromMap(map['chambre'] ?? {}),
      address: map['address'] ?? '',
      description: map['description'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      type: map['type'] ?? '',
      imageUrls: map['imageUrls'] ?? [],
      chambres: map['chambres'] ?? []
    );
  }

    String toJson() => json.encode(toMap());

  factory AccommodationModel.fromJson(String source) =>
      AccommodationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  AccommodationModel copyWith({
    int? id,
    String? title,
    String? date,
    String? address,
    String? description,
    String? latitude,
    String? longitude,
    String? type,
    List<ChambreModel>? chambres,
    List<String>? imageUrls
    
  }) {
    return AccommodationModel(
      id: id ?? this.id,
      title: title ?? this.title,
     
      address: address ?? this.address,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      imageUrls: imageUrls ?? this.imageUrls,
      chambres: chambres ?? this.chambres,
      type: type ?? this.type,
     
    );
  }

}