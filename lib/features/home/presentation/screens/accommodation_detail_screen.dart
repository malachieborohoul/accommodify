import 'package:Accommodify/components/my_icon_button.dart';
import 'package:Accommodify/core/contants/padding.dart';
import 'package:Accommodify/core/theme/app_palette.dart';
import 'package:Accommodify/features/home/domain/entities/accommodation.dart';
import 'package:Accommodify/features/home/presentation/widgets/location_in_map.dart';

import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AccommodationDetailScreen extends StatefulWidget {
  final Accommodation Accommodify;
  const AccommodationDetailScreen({super.key, required this.Accommodify});
   static route( Accommodation Accommodify) => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child:  AccommodationDetailScreen(Accommodify: Accommodify,),
        );
      });
  @override
  State<AccommodationDetailScreen> createState() => _AccommodationDetailScreenState();
}

class _AccommodationDetailScreenState extends State<AccommodationDetailScreen> {
  int currentIndex = 0;

    // Make a call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    widget.Accommodify.name,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Chambre à ${widget.Accommodify.address}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                        // Affichage des types de chambres
            const Divider(),
            chambreTypesSection(widget.Accommodify),
            const Divider(),
            const SizedBox(height: AppPadding.miniSpacer),
            Text(
              "A propos",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: AppPadding.miniSpacer),
            Text(widget.Accommodify.description),
            const SizedBox(height: AppPadding.miniSpacer),
            const Divider(),
            const SizedBox(height: AppPadding.miniSpacer),
            Text(
              "Où vous serez",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: AppPadding.miniSpacer),
            Text(
              widget.Accommodify.address,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: AppPadding.miniSpacer),
            SizedBox(
              height: 400,
              width: size.width,
              child: LocationInMap(
                Accommodify: widget.Accommodify,
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Row(
            //   children: [
            //     Text("${widget.Accommodify.id} XAF ", style: const TextStyle(fontWeight: FontWeight.bold)),
            //     const Text("nuitée "),
            //   ],
            // ),
            GestureDetector(
              onTap: (){
                 _makePhoneCall(widget.Accommodify.phone);
              },
              child: Container(
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
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: size.width * 0.0346,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Stack detailImageandIcon(Size size, BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.35,
          child: AnotherCarousel(
            images: widget.Accommodify.images.map((url) {
              return CachedNetworkImage(
                imageUrl: url.img_url,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: AppPalette.gradient1),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            }).toList(),
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
              "${currentIndex + 1} / ${widget.Accommodify.images.length}",
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
                // Row(
                //   children: [
                //     const MyIconButton(icon: Icons.share_outlined),
                //     const SizedBox(
                //       width: 20,
                //     ),
                //     InkWell(
                //       onTap: () {
                //         // provider.toggleFavorite(widget.Accommodify);
                //       },
                //       child: const MyIconButton(
                //         icon: Icons.favorite_border,
                //         iconColor: Colors.black,
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Nouvelle méthode pour afficher les types de chambres
  Widget chambreTypesSection(Accommodation accommodation) {
    // Liste des types de chambres dans `widget.Accommodify.chambres`
    // Exemple de types de chambres
  
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Types de chambres",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: AppPadding.miniSpacer),
        ...accommodation.chambres.map((chambre) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.hotel, color: AppPalette.gradient1),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chambre.type,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(chambre.description),
                        const SizedBox(height: 5),
                        Text("${chambre.price} XAF", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}

