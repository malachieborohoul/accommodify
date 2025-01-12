import 'dart:convert';

import 'package:Accommodify/core/error/exceptions.dart';
import 'package:Accommodify/core/secrets/app_secrets.dart';

import 'package:Accommodify/features/home/data/models/accommodation_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


abstract interface class AccommodationLocalDataSource {
 

  Future<List<AccommodationModel>> getAccommodations();
}

class AccommodationLocalDataSourceImpl implements AccommodationLocalDataSource {
  @override
  Future<List<AccommodationModel>> getAccommodations()async {
  try {

      debugPrint("💡From AccommodationLocalDatasource getAccommodations");

           http.Response res = await http.get(Uri.parse('${AppSecrets.baseUrl}/logements'));

          if(res.statusCode==200){
            final List<dynamic> accommodationsJson = json.decode(res.body);
             final accommodations = accommodationsJson
          .map((transaction) => AccommodationModel.fromMap(transaction as Map<String, dynamic>))
          .toList();
          debugPrint("💡From AccommodationRemoteDatasource getAccommodations -  $accommodations ");
      

      return accommodations;

          }else{
      throw ServerException('Error: ${res.statusCode} - ${res.reasonPhrase}');

          }
    
      
   
  } catch (e) {
      debugPrint("💡From AccommodationLocalDatasource - Erreur inconnue : $e");

      throw ServerException("Erreur inconnue : $e");
    }
      
 
  }
  
}
