import 'package:Accommodify/features/home/presentation/screens/accommodation_detail_screen.dart';
import 'package:Accommodify/features/home/presentation/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:Accommodify/features/home/domain/entities/accommodation.dart';
import 'package:Accommodify/features/home/presentation/widgets/accommodation_card.dart'; // À adapter selon la façon dont vous affichez un logement

class FilteredAccommodationsScreen extends StatelessWidget {
  
  final List<Accommodation> filteredAccommodations;
     static route(List<Accommodation> filteredAccommodations) => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child:  FilteredAccommodationsScreen(filteredAccommodations: filteredAccommodations,),
        );
      });

  const FilteredAccommodationsScreen({super.key, required this.filteredAccommodations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logements filtrés"),
        leading:   GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const MyIconButton(
                    icon: Icons.arrow_back_ios_new,
                  ),
                ),
      ),
      body: filteredAccommodations.isEmpty
          ? const Center(child: Text("Aucun logement trouvé."))
          : ListView.builder(
              itemCount: filteredAccommodations.length,
              itemBuilder: (context, index) {
                final accommodation = filteredAccommodations[index];
                // Utilisez un widget qui affiche chaque logement, par exemple une carte (AccommodationCard)
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, AccommodationDetailScreen.route(accommodation));
                  },
                  child: AccommodationCard(accommodation: accommodation)); // Adapter en fonction de votre UI
              },
            ),
    );
  }
}
