import 'package:accommodation/core/error/exceptions.dart';
import 'package:accommodation/features/home/data/models/accommodation_model.dart';
import 'package:flutter/material.dart';


abstract interface class AccommodationLocalDataSource {
 

  Future<List<AccommodationModel>> getAccommodations();
}

class AccommodationLocalDataSourceImpl implements AccommodationLocalDataSource {
  @override
  Future<List<AccommodationModel>> getAccommodations()async {
  try {

      debugPrint("💡From AccommodationLocalDatasource getAccommodations");

       // Simulate api call
    await Future.delayed(const Duration(seconds: 2));

    return [
      AccommodationModel(
        id: "1",
        title: "Beautiful Beach House",
        image: "https://example.com/house1.jpg",
        date: "2024-01-01",
        price: 250,
        address: "123 Ocean Ave, Miami, FL",
        latitude: 25.7617,
        longitude: -80.1918,
        imageUrls: ["https://example.com/house1.jpg", "https://example.com/house2.jpg"],
      ),
      
    ];
  } catch (e) {
      debugPrint("💡From AccommodationLocalDatasource - Erreur inconnue : $e");

      throw ServerException("Erreur inconnue : $e");
    }
      
 
  }
  
}
