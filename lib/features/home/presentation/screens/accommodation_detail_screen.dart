import 'package:accommodation/Provider/favorite_provider.dart';
import 'package:accommodation/components/my_icon_button.dart';
import 'package:accommodation/core/contants/padding.dart';
import 'package:accommodation/core/theme/app_palette.dart';
import 'package:accommodation/features/home/domain/entities/accommodation.dart';
import 'package:accommodation/features/home/presentation/widgets/location_in_map.dart';

import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

class AccommodationDetailScreen extends StatefulWidget {
  final Accommodation accommodation;
  const AccommodationDetailScreen({super.key, required this.accommodation});

  @override
  State<AccommodationDetailScreen> createState() => _AccommodationDetailScreenState();
}

class _AccommodationDetailScreenState extends State<AccommodationDetailScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final provider = FavoriteProvider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // detail image , back button, share and favorite button
            detailImageandIcon(size, context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.accommodation.title,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Chambre à ${widget.accommodation.address}",
                    style: Theme.of(context).textTheme.bodyLarge,
                    
                  ),
                  // const Text(
                  //   'bedAndBathroom',
                  //   style: TextStyle(
                  //     fontSize: 17,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                ],
              ),
            ),
            // widget.place["isActive"] == true
            //     ? ratingAndStarTrue()
            //     : ratingAndStarFalse(),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  // placePropertyList(
                  //   size,
                  //   "https://static.vecteezy.com/system/resources/previews/018/923/486/original/diamond-symbol-icon-png.png",
                  //   "This is a rare find",
                  //   "${widget.place['vendor']}'s place is usually fully booked.",
                  // ),
                  const Divider(),
                  // placePropertyList(
                  //   size,
                  //   widget.place['vendorProfile'],
                  //   "Stay with ${widget.place['vendor']}",
                  //   "Superhost . ${widget.place['yearOfHostin']} years hosting",
                  // ),
                  const Divider(),
                  placePropertyList(
                      size,
                      "https://cdn-icons-png.flaticon.com/512/6192/6192020.png",
                      "Chambre moderne",
                      "Votre propre chambre dans un foyer, plus d'accès aux espaces partagés."),
                  placePropertyList(
                      size,
                      "https://cdn0.iconfinder.com/data/icons/co-working/512/coworking-sharing-17-512.png",
                      "Service Restaurant",
                      "Une restautation avec des mets locaux."),
                  placePropertyList(
                      size,
                      "https://img.pikbest.com/element_our/20230223/bg/102f90fb4dec6.png!w700wp",
                      "Service Spa",
                      "Vous partagerez le spa avec d'autres personnes."),
                  const Divider(),
                  const SizedBox(height: AppPadding.miniSpacer),
                   Text(
                    "A propos",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500)
                  ),
                  const SizedBox(height: AppPadding.miniSpacer),

                   Text(widget.accommodation.description),
                  const SizedBox(height: AppPadding.miniSpacer),

                  const Divider(),
                  const SizedBox(height: AppPadding.miniSpacer),

                   Text(
                    "Où vous serez",
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500)

                  ),
                  const SizedBox(height: AppPadding.miniSpacer),

                  Text(
                    widget.accommodation.address,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: AppPadding.miniSpacer),

                  SizedBox(
                    height: 400,
                    width: size.width,
                    child: LocationInMap(
                      accommodation: widget.accommodation,
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: priceAndReserve(size),
    );
  }

  Container priceAndReserve(Size size) {
    return Container(
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("${widget.accommodation.price} XAF ", style: TextStyle(fontWeight: FontWeight.bold),),
                const Text("nuitée "),
              ],
            ),
           
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: AppPalette.gradient1,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "Contactez",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding placePropertyList(Size size, image, title, subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          const Divider(),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(image),
            radius: 20,
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: size.width * 0.0346,
                  color: Colors.grey.shade700,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  // Padding ratingAndStarFalse() => Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 25),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const Icon(Icons.star),
  //           const SizedBox(width: 5),
  //           Text(
  //             "${widget.place['rating'].toString()} . ",
  //             style: const TextStyle(
  //               fontSize: 17,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           Text(
  //             "${widget.place['review'].toString()}reviews",
  //             style: const TextStyle(
  //               fontSize: 17,
  //               decoration: TextDecoration.underline,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           )
  //         ],
  //       ),
  //     );

  // Container ratingAndStarTrue() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(
  //       horizontal: 13,
  //       vertical: 5,
  //     ),
  //     padding: const EdgeInsets.symmetric(
  //       horizontal: 8,
  //       vertical: 15,
  //     ),
  //     decoration: BoxDecoration(
  //       border: Border.all(
  //         color: Colors.black26,
  //       ),
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Column(
  //           children: [
  //             Text(
  //               widget.place['rating'].toString(),
  //               style: const TextStyle(
  //                 fontSize: 17,
  //                 fontWeight: FontWeight.bold,
  //                 height: 1,
  //               ),
  //             ),
  //             StarRating(rating: widget.place['rating']),
  //           ],
  //         ),
  //         Stack(
  //           children: [
  //             Image.network(
  //               "https://wallpapers.com/images/hd/golden-laurel-wreathon-teal-background-k5791qxis5rtcx7w-k5791qxis5rtcx7w.png",
  //               height: 50,
  //               width: 130,
  //               color: Colors.amber,
  //             ),
  //             const Positioned(
  //               left: 35,
  //               child: Text(
  //                 "Guest\nfavorite",
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.bold,
  //                   height: 1.2,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         Column(
  //           children: [
  //             Text(
  //               widget.place['review'].toString(),
  //               style: const TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 17,
  //               ),
  //             ),
  //             const Text(
  //               "Reviews",
  //               style: TextStyle(
  //                 height: 0.7,
  //                 color: Colors.black,
  //                 decoration: TextDecoration.underline,
  //               ),
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  Stack detailImageandIcon(Size size, BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.35,
          child: AnotherCarousel(
            images: widget.accommodation.imageUrls
                .map((url) => NetworkImage(url))
                .toList(),
            showIndicator: false,
            dotBgColor: Colors.transparent,
            onImageChange: (p0, p1) {
              setState(() {
                currentIndex = p1;
              });
            },
            autoplay: true,
            boxFit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black45),
            child: Text(
              "${currentIndex + 1} / ${widget.accommodation.imageUrls.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: 25,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const MyIconButton(
                    icon: Icons.arrow_back_ios_new,
                  ),
                ),
                
                // const MyIconButton(icon: Icons.share_outlined),
                //  SizedBox(width: size.width * 0.9),
                // after this all let's make favorite button function by using provider
                Row(
                  children: [
                    const MyIconButton(icon: Icons.share_outlined),
                    const SizedBox(
                  width: 20,
                ),
                    InkWell(
                      onTap: () {
                        // provider.toggleFavorite(widget.accommodation);
                      },
                      child: const MyIconButton(
                        icon: 
                        // provider.isExist(widget.place)
                        //     ? Icons.favorite
                        //     : 
                            
                            
                            Icons.favorite_border,
                        iconColor: 
                             Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
