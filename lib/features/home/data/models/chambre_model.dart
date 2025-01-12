import 'dart:convert';

import 'package:Accommodify/features/home/domain/entities/accommodation.dart';
import 'package:Accommodify/features/home/domain/entities/chambre.dart';


class ChambreModel extends Chambre{
  ChambreModel({required super.id,   required super.price, required super.description, required super.type, });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'description': description,
      'type': type,
     
    };
  }

    factory ChambreModel.fromMap(Map<String, dynamic> map) {
    return ChambreModel(
      id: map['id'] ?? 0 ,
      price: map['price'] ?? '',
      description: map['description'] ?? '',
      type: map['type'] ?? '',
  
    );
  }

    String toJson() => json.encode(toMap());

  factory ChambreModel.fromJson(String source) =>
      ChambreModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ChambreModel copyWith({
    int? id,
    
    String? price,
    String? description,
    String? type,
  
    
  }) {
    return ChambreModel(
      id: id ?? this.id,
      type: type ?? this.type,
      
      price: price ?? this.price,
      description: description ?? this.description,
   
     
    );
  }

}