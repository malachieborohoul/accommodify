import 'package:flutter/material.dart';
import 'package:Accommodify/features/home/domain/entities/accommodation.dart'; // Assurez-vous d'avoir cette importation

class AccommodationCard extends StatelessWidget {
  final Accommodation accommodation;

  const AccommodationCard({super.key, required this.accommodation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Image du logement
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              accommodation.imageUrls.isNotEmpty ? accommodation.imageUrls[0] : 'https://via.placeholder.com/150',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),

          // Informations du logement
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    accommodation.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    accommodation.address,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    accommodation.type,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'XAF ${accommodation.chambres.isNotEmpty ? accommodation.chambres[0].price : "N/A"}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
