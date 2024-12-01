import 'dart:convert';

import 'package:Accommodify/core/common/entities/user.dart';



class UserModel extends User {
  UserModel( {required super.id, required super.email, required super.name, required super.updatedAt,   required super.avatar, });
  
  
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
     
      'avatar': avatar,
     
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '' ,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
     
      avatar: map['avatar'] ?? '',
     
      updatedAt: map['updated_at'] == null
          ? DateTime.now()
          : DateTime.parse(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? gender,
    String? phoneNumber,
    String? countryCode,
    String? avatar,
    int? age,
     DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email, 
      
      avatar: avatar ?? this.avatar, 
      updatedAt:updatedAt ?? this.updatedAt,
    );
  }
}
