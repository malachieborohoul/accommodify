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
        title: "Adamaoua Hôtel",
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1",
        date: "2024-01-01",
        price: 250,
        address: "Adamaoua Hôtel, 8HQ8+7PF, Ngaoundéré",
        latitude: 7.338200835367365,
        longitude: 13.566814579663829,
        imageUrls: ["https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/77/adamaoua-hotel.jpg?w=1600&h=-1&s=1"],
      ),
        AccommodationModel(
        id: "1",
        title: "Adamaoua Hôtel",
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1",
        date: "2024-01-01",
        price: 250,
        address: "Adamaoua Hôtel, 8HQ8+7PF, Ngaoundéré",
        latitude: 7.338200835367365,
        longitude: 13.566814579663829,
        imageUrls: ["https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/77/adamaoua-hotel.jpg?w=1600&h=-1&s=1"],
      ),
        AccommodationModel(
        id: "1",
        title: "Adamaoua Hôtel",
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1",
        date: "2024-01-01",
        price: 250,
        address: "Adamaoua Hôtel, 8HQ8+7PF, Ngaoundéré",
        latitude: 7.338200835367365,
        longitude: 13.566814579663829,
        imageUrls: ["https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/77/adamaoua-hotel.jpg?w=1600&h=-1&s=1"],
      ),
        AccommodationModel(
        id: "1",
        title: "Adamaoua Hôtel",
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1",
        date: "2024-01-01",
        price: 250,
        address: "Adamaoua Hôtel, 8HQ8+7PF, Ngaoundéré",
        latitude: 7.338200835367365,
        longitude: 13.566814579663829,
        imageUrls: ["https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/77/adamaoua-hotel.jpg?w=1600&h=-1&s=1"],
      ),
      
    ];
  } catch (e) {
      debugPrint("💡From AccommodationLocalDatasource - Erreur inconnue : $e");

      throw ServerException("Erreur inconnue : $e");
    }
      
 
  }
  
}
