import 'dart:convert';

import 'package:accommodation/features/home/domain/entities/accommodation.dart';

class AccommodationModel extends Accommodation{
  AccommodationModel({required super.id, required super.title, required super.image, required super.date, required super.price, required super.address, required super.latitude, required super.longitude, required super.imageUrls});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'date': date,
      'price': price,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrls': imageUrls,
    };
  }

    factory AccommodationModel.fromMap(Map<String, dynamic> map) {
    return AccommodationModel(
      id: map['id'] ?? '' ,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      date: map['date'] ?? '',
      price: map['price'] ?? 0,
      address: map['address'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      imageUrls: map['imageUrls'] ?? [],
    );
  }

    String toJson() => json.encode(toMap());

  factory AccommodationModel.fromJson(String source) =>
      AccommodationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  AccommodationModel copyWith({
    String? id,
    String? title,
    String? image,
    String? date,
    int? price,
    String? address,
    double? latitude,
    double? longitude,
    List<String>? imageUrls
    
  }) {
    return AccommodationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      date: image ?? this.date,
      price: price ?? this.price,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      imageUrls: imageUrls ?? this.imageUrls,
     
    );
  }

}