import 'package:Accommodify/core/common/widgets/loader.dart';
import 'package:Accommodify/core/contants/padding.dart';
import 'package:Accommodify/core/theme/app_palette.dart';
import 'package:Accommodify/core/utils/loader_dialog.dart';
import 'package:Accommodify/core/utils/show_snackbar.dart';
import 'package:Accommodify/features/home/domain/entities/accommodation.dart';
import 'package:Accommodify/features/home/presentation/bloc/accommodation_bloc.dart';
import 'package:Accommodify/features/home/presentation/widgets/price_range_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccommodationFilterScreen extends StatefulWidget {
  // static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
  //     return FadeTransition(
  //       opacity: animation,
  //       child: const AccommodationFilterScreen(),
  //     );
  //   });

  final ScrollController? controller;
  const AccommodationFilterScreen({super.key, this.controller});

  @override
  State<AccommodationFilterScreen> createState() =>
      _AccommodationFilterScreenState();
}

class _AccommodationFilterScreenState extends State<AccommodationFilterScreen> {
    late RangeValues _currentRange;
    double minPrice=2000;
    double maxPrice=50000;
    


  @override
  void initState() {
     _currentRange = RangeValues(minPrice, maxPrice);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Accommodation> accommodations = [];
    int divisions = ((maxPrice.toInt()-minPrice.toInt())/500).round();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<AccommodationBloc, AccommodationState>(
        listener: (context, state) {
          if (state is AccommodationFailure) {
            // Close any open dialogs and show an error snackbar
            closeLoaderDialog(context);
            showSnackBar(context, state.message);
          }
          if (state is AccommodationLoading) {
            // Show the loader dialog
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showLoaderDialog(context);
            });
          }
          if (state is AccommodationSuccess) {
            // Ensure loader dialog is closed if Accommodifys loaded successfully
            closeLoaderDialog(context);
          }
        },
        builder: (context, state) {
          if (state is AccommodationSuccess) {
            for (var accommodation in state.accommodations) {
              accommodations.add(accommodation);
            }
            print(accommodations.length);
            return SingleChildScrollView(
              controller: widget.controller,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.appPadding,
                    vertical: AppPadding.appPadding),
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
                          "Fitres",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppPadding.miniSpacer),
                    Text("Fourchette de prix",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w500)),

                    const SizedBox(height: AppPadding.miniSpacer),

                    RangeSlider(values: _currentRange, 
                    min: minPrice,
                    max: maxPrice,
                    divisions: divisions,
                    activeColor: AppPalette.gradient1,
                    labels: RangeLabels(
            "${_currentRange.start.toInt()} XAF",
            "${_currentRange.end.toInt()} XAF",
          ),
                    onChanged: (newRange){
                    setState(() {
                                  _currentRange = newRange;
                                });
                    }),

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



                  ],
                ),
              ),
            );
          }

          return SingleChildScrollView(
            controller: widget.controller,
            child: const SizedBox(),
          );
        },
      ),
      bottomSheet: bottom(size, accommodations),
    );
  }

  Container bottom(Size size, List<Accommodation> accommodations) {
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
              "Effacer tout ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            BlocBuilder<AccommodationBloc, AccommodationState>(
              builder: (context, state) {
                print(state);
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: () {
                    if (state is AccommodationLoading) {
                      return const Loader();
                    } else if (state is AccommodationFailure) {
                      return Text(
                        "Erreur: ${state.message}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      );
                    } else if (state is AccommodationSuccess) {
                      return Text(
                        "Afficher ${state.accommodations.length} résultats",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      );
                    } else {
                      return const Text(
                        "État non reconnu",
                        style: TextStyle(color: Colors.white),
                      );
                    }
                  }(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
