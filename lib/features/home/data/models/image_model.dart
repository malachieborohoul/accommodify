import 'dart:convert';

import 'package:Accommodify/features/home/domain/entities/img.dart';


class ImgModel extends Img{
  ImgModel({required super.id,   required super.img_url,  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'img_url': img_url,
      
     
    };
  }

    factory ImgModel.fromMap(Map<String, dynamic> map) {
    return ImgModel(
      id: map['id'] ?? 0 ,
      img_url: map['img_url'] ?? '',
     
  
    );
  }

    String toJson() => json.encode(toMap());

  factory ImgModel.fromJson(String source) =>
      ImgModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ImgModel copyWith({
    int? id,
    
    String? img_url,
   
  
    
  }) {
    return ImgModel(
      id: id ?? this.id,
      img_url: img_url ?? this.img_url,
      
    
   
     
    );
  }

}