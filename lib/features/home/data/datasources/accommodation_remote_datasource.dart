import 'dart:convert';

import 'package:Accommodify/core/error/exceptions.dart';
import 'package:Accommodify/core/secrets/app_secrets.dart';

import 'package:Accommodify/features/home/data/models/accommodation_model.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;


abstract interface class AccommodationRemoteDataSource {
 

  Future<List<AccommodationModel>> getAccommodations();
}

class AccommodationRemoteDataSourceImpl implements AccommodationRemoteDataSource {
@override
Future<List<AccommodationModel>> getAccommodations() async {
  try {
    debugPrint("💡[AccommodationRemoteDataSource] Fetching accommodations...");

    // Appel HTTP
    final http.Response res = await http.get(Uri.parse('${AppSecrets.baseUrl}/logements'));

    if (res.statusCode == 200) {
      // Décoder la réponse
      final body = json.decode(res.body)['logements'];

      // Vérification si le corps est une liste
      if (body is List) {
        final accommodations = body
            .map((item) => AccommodationModel.fromMap(item as Map<String, dynamic>))
            .where((accommodation)=> accommodation.isActif)
            .toList();

          

        debugPrint("✅ [AccommodationRemoteDataSource] Accommodations fetched successfully: ${accommodations.length}");

        return accommodations;
      } else {
        // Erreur si le corps n'est pas une liste
        throw ServerException("Erreur : Réponse inattendue, liste attendue mais obtenu : $body");
      }
    } else {
      // Gestion des erreurs HTTP
      throw ServerException('Erreur HTTP: ${res.statusCode} - ${res.reasonPhrase}');
    }
  } catch (e, stackTrace) {
    debugPrint("❌ [AccommodationRemoteDataSource] Erreur lors de la récupération des accommodations : $e");
    debugPrint(stackTrace.toString());
    throw ServerException("Erreur inconnue : $e");
  }
}

  
}
