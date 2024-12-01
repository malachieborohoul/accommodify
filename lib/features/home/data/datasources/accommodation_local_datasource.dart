import 'package:Accommodify/core/error/exceptions.dart';

import 'package:Accommodify/features/home/data/models/accommodation_model.dart';
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
        latitude: 7.311451579096481,
        longitude: 13.575107800002723,
        imageUrls: ["https://www.cameroun-plus.com/data/eo/r1000381/Cameroun_hotel_Ngaoundere_TRANSCAM_photo02.webp","https://www.cameroun-plus.com/data/eo/r1000381/Cameroun_hotel_Ngaoundere_TRANSCAM_photo04.webp","https://www.cameroun-plus.com/data/eo/r1000381/Cameroun_hotel_Ngaoundere_TRANSCAM_photo06.webp","https://www.cameroun-plus.com/data/eo/r1000381/Cameroun_hotel_Ngaoundere_TRANSCAM_photo10.webp","https://ak-d.tripcdn.com/images/0585t12000csdwskdF02E_R_960_660_R5_D.jpg", "https://ak-d.tripcdn.com/images/220310000000occ6c055B_R_600_400_R5.webp", "https://ak-d.tripcdn.com/images/0220412000amw32q3A5D8_R_600_400_R5.webp"], 
        description: "Bienvenue à Hôtel Transcam, votre point de départ idéal pour explorer la ville. Avec ses chambres modernes et fonctionnelles, son Wi-Fi haut débit gratuit et un buffet petit-déjeuner généreux, tout est pensé pour rendre votre séjour agréable. Situé à proximité des transports en commun, cet hôtel est parfait pour les voyageurs en déplacement ou les séjours de courte durée.",
      ),
        AccommodationModel(
        id: "2",
        title: "Adamaoua Hôtel",
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1",
        date: "2024-01-01",
        price: 25000,
        address: "Adamaoua Hôtel, 8HQ8+7PF, Ngaoundéré",
        latitude: 7.338200835367365,
        longitude: 13.566814579663829,
        imageUrls: ["https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/77/adamaoua-hotel.jpg?w=1600&h=-1&s=1"],
        description: "Plongez dans un monde de confort et de luxe au Adamaoua Hôtel, où chaque détail est pensé pour offrir une expérience inoubliable. Nos chambres spacieuses au design contemporain allient élégance et modernité. Profitez de notre spa haut de gamme, de notre piscine panoramique et d'une gastronomie exquise servie par un chef étoilé. Idéalement situé au cœur de la ville, l'hôtel est parfait pour les voyageurs d'affaires et de loisirs.",

      ),
        AccommodationModel(
        id: "3",
        title: "Vina Palace Hôtel",
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1",
        date: "2024-01-01",
        price: 15000,
        address: "Vina Palace Hôtel, 8HQ8+7PF, Ngaoundéré",
        latitude: 7.322573902123331,
        longitude: 13.574945138262308,
        imageUrls: ["https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/77/adamaoua-hotel.jpg?w=1600&h=-1&s=1", "https://ak-d.tripcdn.com/images/0226z12000ab2hsrcB423_R_600_400_R5.webp"],
        description: "Évadez-vous à Vina Palace Hôtel, un havre de paix niché au cœur de la nature. Cet hôtel écologique offre des chalets en bois avec vues imprenables sur les montagnes. Détendez-vous dans nos jardins fleuris, explorez les sentiers environnants ou savourez une cuisine locale et bio. Idéal pour les amoureux de la nature et les familles à la recherche d’un séjour paisible et ressourçant.",
      
      ),
        AccommodationModel(
        id: "4",
        title: "Marhaba Hotel",
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/66/b3/6c/adamaoua-hotel.jpg?w=1600&h=-1&s=1",
        date: "2024-01-01",
        price: 20000,
        address: "Marhaba Hotel, 8HQ8+7PF, Ngaoundéré",
        latitude: 7.319878344945789, 
        longitude: 13.574595480590773,
        imageUrls: ["https://www.ease.travel/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Fdoyf6tnc2%2Fimage%2Fupload%2Ft_hotel_medium%2Cf_auto%2Fhotel%2F0ba1b795_z_sjv6sj.webp&w=1200&q=75","https://www.ease.travel/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Fdoyf6tnc2%2Fimage%2Fupload%2Ft_hotel_medium%2Cf_auto%2Fhotel%2F584ed340_z_q8n9gl.webp&w=1200&q=75" , "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/28/2e/ac/live-music-at-marhaba.jpg?w=2000&h=-1&s=1"],
        description: "Découvrez l'élégance intemporelle de Marhaba Hotel, un hôtel de charme situé dans un bâtiment historique du XVIIIe siècle. Avec ses chambres décorées dans un style classique et ses fresques d'époque, cet hôtel vous transporte dans une autre époque. Profitez de notre cour intérieure, de salons feutrés et d'un service attentionné. Un cadre idéal pour une escapade romantique ou un séjour culturel.",
      
      ),
      
    ];
  } catch (e) {
      debugPrint("💡From AccommodationLocalDatasource - Erreur inconnue : $e");

      throw ServerException("Erreur inconnue : $e");
    }
      
 
  }
  
}
