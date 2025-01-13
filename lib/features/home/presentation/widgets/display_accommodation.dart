import 'package:Accommodify/core/contants/padding.dart';
import 'package:Accommodify/core/theme/app_palette.dart';
import 'package:Accommodify/core/utils/loader_dialog.dart';
import 'package:Accommodify/core/utils/show_snackbar.dart';
import 'package:Accommodify/features/home/presentation/bloc/accommodation_bloc.dart';
import 'package:Accommodify/features/home/presentation/screens/accommodation_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayAccommodation extends StatefulWidget {
  const DisplayAccommodation({super.key});

  @override
  State<DisplayAccommodation> createState() => _DisplayAccommodationState();
}

class _DisplayAccommodationState extends State<DisplayAccommodation> {
  @override
  void initState() {
    context
        .read<AccommodationBloc>()
        .add(const AccommodationGetAccommodations());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final provider = FavoriteProvider.of(context);
    return BlocConsumer<AccommodationBloc, AccommodationState>(
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
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.accommodations.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final Accommodify = state.accommodations[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            AccommodationDetailScreen(Accommodify: Accommodify),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: SizedBox(
                              height: 300,
                              width: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl: Accommodify.imageUrls[0],
                                fit: BoxFit
                                    .cover, // Assure que l'image remplit le conteneur
                                placeholder: (context, url) => Center(
                                  child: Container(
                                      height: 300,
                                      width: double.infinity,
                                      color: Colors.grey.shade200,
                                      child: const Center(
                                          child: CircularProgressIndicator(
                                        color: AppPalette.gradient1,
                                      ))), // Indicateur de chargement pendant le téléchargement
                                ),
                                errorWidget: (context, url, error) =>
                                    const Center(
                                  child: Icon(Icons
                                      .error), // Icône affichée en cas d'erreur
                                ),
                              ),
                            ),
                          ),

                          const Positioned(
                            top: 20,
                            left: 15,
                            right: 15,
                            child: Row(
                              children: [
                                // place['isActive'] == true
                                //     ?

                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     borderRadius: BorderRadius.circular(40),
                                //   ),
                                //   child: const Padding(
                                //     padding: EdgeInsets.symmetric(
                                //       horizontal: 15,
                                //       vertical: 5,
                                //     ),
                                //     child: Text(
                                //       "GuestFavorite",
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // : SizedBox(
                                //     width: size.width * 0.03,
                                //   ),
                                Spacer(),
                                // for favorite button
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    // white border
                                    Icon(
                                      Icons.favorite_outline_rounded,
                                      size: AppPadding.smallSpacer - 5,
                                      color: Colors.white,
                                    ),
                                    // InkWell(
                                    //   onTap: () {
                                    //     // provider.toggleFavorite(place);
                                    //   },
                                    //   child: Icon(
                                    //     Icons.favorite,
                                    //     size: 30,
                                    //     color: provider.isExist(place)
                                    //         ? Colors.red
                                    //         : Colors.black54,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // for vendor profile
                          // vendorProfile(place),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            Accommodify.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          // const Icon(Icons.star),
                     
                          // Text(
                          //   place['rating'].toString(),
                          // ),
                        ],
                      ),
                      // Text(
                      //   "Stay with ${place['vendor']} . ${place['vendorProfession']}",
                      //   style: const TextStyle(
                      //     color: Colors.black54,
                      //     fontSize: 16.5,
                      //   ),
                      // ),
                      Text(
                        Accommodify.address,
                        style: const TextStyle(
                          fontSize: 16.5,
                          color: Colors.black54,
                        ),
                      ),
                      // Text(
                      //   Accommodify.date,
                      //   style: const TextStyle(
                      //     fontSize: 16.5,
                      //     color: Colors.black54,
                      //   ),
                      // ),
                      SizedBox(height: size.height * 0.007),
                           const SizedBox(width: 5),
                            Text(
                            Accommodify.type,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                      SizedBox(height: size.height * 0.007),

                      RichText(
                        text: TextSpan(
                          text: "${Accommodify.chambres[0].price} XAF",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: const [
                            // TextSpan(
                            //   text: "night",
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.normal,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.025),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  // Positioned vendorProfile(QueryDocumentSnapshot<Object?> place) {
  //   return Positioned(
  //     bottom: 11,
  //     left: 10,
  //     child: Stack(
  //       children: [
  //         ClipRRect(
  //           borderRadius: const BorderRadius.only(
  //             topRight: Radius.circular(15),
  //             bottomRight: Radius.circular(15),
  //           ),
  //           child: Image.asset(
  //             "asset/images/book_cover.png",
  //             height: 60,
  //             width: 60,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         Positioned(
  //           top: 10,
  //           left: 10,
  //           child: CircleAvatar(
  //             backgroundImage: NetworkImage(
  //               place['vendorProfile'],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
