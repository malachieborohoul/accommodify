import 'package:Accommodify/features/home/presentation/screens/filtered_accommodations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Accommodify/core/contants/padding.dart';
import 'package:Accommodify/core/theme/app_palette.dart';
import 'package:Accommodify/core/utils/loader_dialog.dart';
import 'package:Accommodify/core/utils/show_snackbar.dart';
import 'package:Accommodify/features/home/domain/entities/accommodation.dart';
import 'package:Accommodify/features/home/domain/entities/chambre.dart';
import 'package:Accommodify/features/home/presentation/bloc/accommodation_bloc.dart';
import 'package:Accommodify/features/home/presentation/widgets/price_range_label.dart';

class AccommodationFilterScreen extends StatefulWidget {
  final ScrollController? controller;

  const AccommodationFilterScreen({super.key, this.controller});

  @override
  State<AccommodationFilterScreen> createState() => _AccommodationFilterScreenState();
}

class _AccommodationFilterScreenState extends State<AccommodationFilterScreen> {
  late RangeValues _currentRange;
  double minPrice = 5000;
  double maxPrice = 100000;
  List<String> roomTypes = ["Tous", "Standard", "Luxe", "Économique"];
  List<String> accommodationTypes = ["Tous", "Hotel", "Motel", "Auberge"];
  List<String> selectedRoomTypes = [];
  List<String> selectedAccommodationTypes = [];
  List<Accommodation> accommodations = [];  // Liste d'accommodations récupérées
  List<Accommodation> filteredAccommodations = [];

  @override
  void initState() {
    super.initState();
    _currentRange = RangeValues(minPrice, maxPrice);

    // Appel de l'événement pour récupérer les accommodations depuis le Bloc
    context.read<AccommodationBloc>().add(const AccommodationGetAccommodations());
  }

  // Fonction pour appliquer les filtres
  void _applyFilters() {
    List<Accommodation> tempAccommodations = [];

    for (var accommodation in accommodations) {
      // Filtre par type de logement
      bool accommodationTypeMatch = selectedAccommodationTypes.isEmpty ||
          selectedAccommodationTypes.contains(accommodation.type) ||
          selectedAccommodationTypes.contains("Tous");

      if (!accommodationTypeMatch) continue;

      // Filtrer les chambres dans chaque accommodation
      List<Chambre> filteredChambres = accommodation.chambres.where((chambre) {
        // Filtre par prix
        bool priceMatch = double.parse(chambre.price) >= _currentRange.start && double.parse(chambre.price) <= _currentRange.end;

        // Filtre par type de chambre
        bool roomTypeMatch = selectedRoomTypes.isEmpty || selectedRoomTypes.contains(chambre.type) || selectedRoomTypes.contains("Tous");

        return priceMatch && roomTypeMatch;
      }).toList();

      // Si des chambres sont filtrées, on les conserve
      if (filteredChambres.isNotEmpty) {
        tempAccommodations.add(Accommodation(
          id: accommodation.id,
          title: accommodation.title,
          address: accommodation.address,
          description: accommodation.description,
          chambres: filteredChambres,
          type: accommodation.type,
          latitude: accommodation.latitude,
          longitude: accommodation.longitude,
          phone: accommodation.phone,
          imageUrls: accommodation.imageUrls,
        ));
      }
    }

    setState(() {
      filteredAccommodations = tempAccommodations;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int divisions = ((maxPrice.toInt() - minPrice.toInt()) / 1000).round();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<AccommodationBloc, AccommodationState>(
        listener: (context, state) {
          if (state is AccommodationFailure) {
            closeLoaderDialog(context);
            showSnackBar(context, state.message);
          }
          if (state is AccommodationLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showLoaderDialog(context);
            });
          }
          if (state is AccommodationSuccess) {
            closeLoaderDialog(context);
            accommodations = state.accommodations; // Mettez à jour les accommodations récupérées
            _applyFilters();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            controller: widget.controller,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.appPadding, vertical: AppPadding.appPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(Icons.close)),
                      SizedBox(width: AppPadding.miniSpacer),
                      Text(
                        "Filtres",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppPadding.miniSpacer),
                  Text("Fourchette de prix", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: AppPadding.miniSpacer),
                  RangeSlider(
                    values: _currentRange,
                    min: minPrice,
                    max: maxPrice,
                    divisions: divisions,
                    activeColor: AppPalette.gradient1,
                    labels: RangeLabels(
                      "${_currentRange.start.toInt()} XAF",
                      "${_currentRange.end.toInt()} XAF",
                    ),
                    onChanged: (newRange) {
                      setState(() {
                        _currentRange = newRange;
                      });
                      _applyFilters();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PriceRangeLabel(value: _currentRange.start, title: "Minimum"),
                      PriceRangeLabel(value: _currentRange.end, title: "Maximum"),
                    ],
                  ),
                  const SizedBox(height: AppPadding.miniSpacer),
                  Divider(),
                  const SizedBox(height: AppPadding.miniSpacer),

                  // Sélection des types de logement
                  Text("Type d'hébergement", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: AppPadding.miniSpacer),
                  _buildSelectableOptions(accommodationTypes, selectedAccommodationTypes),

                  const SizedBox(height: AppPadding.miniSpacer),
                  Divider(),

                  // Sélection des types de chambre
                  Text("Type de chambre", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: AppPadding.miniSpacer),
                  _buildSelectableOptions(roomTypes, selectedRoomTypes),

                  const SizedBox(height: AppPadding.miniSpacer),
                ],
              ),
            ),
          );
        },
      ),
      bottomSheet: bottom(size),
    );
  }

  Widget _buildSelectableOptions(List<String> options, List<String> selectedOptions) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: options.map((option) {
          bool isSelected = selectedOptions.contains(option);

          return GestureDetector(
            onTap: () {
              setState(() {
                if (option == "Tous") {
                  if (!isSelected) {
                    selectedOptions.clear();
                    selectedOptions.add("Tous");
                  } else {
                    selectedOptions.remove(option);
                  }
                } else {
                  if (selectedOptions.contains("Tous")) {
                    selectedOptions.remove("Tous");
                  }

                  if (isSelected) {
                    selectedOptions.remove(option);
                  } else {
                    selectedOptions.add(option);
                  }
                }
              });
              _applyFilters();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                option,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Container bottom(Size size) {
    return Container(
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.appPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Effacer tout",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, FilteredAccommodationsScreen.route(filteredAccommodations));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Afficher ${filteredAccommodations.length} résultats",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
