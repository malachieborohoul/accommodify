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
        title: "Hotel Transcam",
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1",
        date: "2024-01-01",
        price: 10000,
        address: "Hotel Transcam, 8HQ8+7PF, Ngaoundéré",
        latitude: 7.338200835367365,
        longitude: 13.566814579663829,
        imageUrls: ["https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/77/adamaoua-hotel.jpg?w=1600&h=-1&s=1"], 
        description: "Bienvenue à Hôtel Transcam, votre point de départ idéal pour explorer la ville. Avec ses chambres modernes et fonctionnelles, son Wi-Fi haut débit gratuit et un buffet petit-déjeuner généreux, tout est pensé pour rendre votre séjour agréable. Situé à proximité des transports en commun, cet hôtel est parfait pour les voyageurs en déplacement ou les séjours de courte durée.",
      ),
        AccommodationModel(
        id: "2",
        title: "Adamaoua Hôtel",
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1",
        date: "2024-01-01",
        price: 250,
        address: "Adamaoua Hôtel, 8HQ8+7PF, Ngaoundéré",
        latitude: 8.338200835367365,
        longitude: 13.566814579663829,
        imageUrls: ["https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/77/adamaoua-hotel.jpg?w=1600&h=-1&s=1"],
        description: "Plongez dans un monde de confort et de luxe au Adamaoua Hôtel, où chaque détail est pensé pour offrir une expérience inoubliable. Nos chambres spacieuses au design contemporain allient élégance et modernité. Profitez de notre spa haut de gamme, de notre piscine panoramique et d'une gastronomie exquise servie par un chef étoilé. Idéalement situé au cœur de la ville, l'hôtel est parfait pour les voyageurs d'affaires et de loisirs.",

      ),
        AccommodationModel(
        id: "3",
        title: "Vina Hôtel",
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1",
        date: "2024-01-01",
        price: 15000,
        address: "Vina Hôtel, 8HQ8+7PF, Ngaoundéré",
        latitude: 9.338200835367365,
        longitude: 13.566814579663829,
        imageUrls: ["https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/77/adamaoua-hotel.jpg?w=1600&h=-1&s=1"],
        description: "Évadez-vous à Vina Hôtel, un havre de paix niché au cœur de la nature. Cet hôtel écologique offre des chalets en bois avec vues imprenables sur les montagnes. Détendez-vous dans nos jardins fleuris, explorez les sentiers environnants ou savourez une cuisine locale et bio. Idéal pour les amoureux de la nature et les familles à la recherche d’un séjour paisible et ressourçant.",
      
      ),
        AccommodationModel(
        id: "4",
        title: "Marhaba Hotel",
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1",
        date: "2024-01-01",
        price: 20000,
        address: "Marhaba Hotel, 8HQ8+7PF, Ngaoundéré",
        latitude: 10.338200835367365,
        longitude: 13.566814579663829,
        imageUrls: ["https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/77/adamaoua-hotel.jpg?w=1600&h=-1&s=1"],
        description: "Découvrez l'élégance intemporelle de Marhaba Hotel, un hôtel de charme situé dans un bâtiment historique du XVIIIe siècle. Avec ses chambres décorées dans un style classique et ses fresques d'époque, cet hôtel vous transporte dans une autre époque. Profitez de notre cour intérieure, de salons feutrés et d'un service attentionné. Un cadre idéal pour une escapade romantique ou un séjour culturel.",
      
      ),
      
    ];
  } catch (e) {
      debugPrint("💡From AccommodationLocalDatasource - Erreur inconnue : $e");

      throw ServerException("Erreur inconnue : $e");
    }
      
 
  }
  
}
