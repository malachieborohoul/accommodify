import 'package:Accommodify/components/my_icon_button.dart';
import 'package:Accommodify/core/theme/app_palette.dart';
import 'package:Accommodify/core/utils/loader_dialog.dart';
import 'package:Accommodify/core/utils/show_snackbar.dart';
import 'package:Accommodify/features/home/presentation/bloc/accommodation_bloc.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
class MapWithCustomInfoWindows extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const MapWithCustomInfoWindows(),
        );
      });
  const MapWithCustomInfoWindows({super.key});

  @override
  State<MapWithCustomInfoWindows> createState() =>
      _MapWithCustomInfoWindowsState();
}

class _MapWithCustomInfoWindowsState extends State<MapWithCustomInfoWindows> {

  LatLng? userLocation;

   Future<void> _getUserLocation() async {
    final permission = await Permission.location.request();

    if (permission.isGranted) {
      final location = Location();
      final currentLocation = await location.getLocation();

      setState(() {
        userLocation = LatLng(
          currentLocation.latitude!,
          currentLocation.longitude!,
        );
      });

      googleMapController.animateCamera(
        CameraUpdate.newLatLng(userLocation!),
      );
    } else {
      showSnackBar(context, "Permission refusée. Activez la localisation.");
    }
  }
  LatLng myCurrentLocation = const LatLng(7.330202, 13.579059);
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  late GoogleMapController googleMapController;

  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _loadMarkers();
    context
        .read<AccommodationBloc>()
        .add(const AccommodationGetAccommodations());
  }

  Future<void> _loadMarkers() async {
    customIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(),
      "assets/images/marker.png",
      height: 70,
      width: 48,
    );
  }

  void _updateMarkers(List Accommodifys) {
    Size size = MediaQuery.of(context).size;

    List<Marker> myMarkers = Accommodifys.map<Marker>((Accommodify) {
      return Marker(
        markerId: MarkerId(Accommodify.address),
        position: LatLng(
          Accommodify.latitude,
          Accommodify.longitude,
        ),
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Container(
              height: size.height * 0.16,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: size.height * 0.2,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          child: AnotherCarousel(
                            images: Accommodify.imageUrls.map((url) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(color: AppPalette.gradient1),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }).toList(),
                            dotSize: 5,
                            indicatorBgPadding: 5,
                            dotBgColor: Colors.transparent,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 14,
                        right: 14,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            const MyIconButton(
                              icon: Icons.favorite_border,
                              radius: 15,
                            ),
                            const SizedBox(width: 13),
                            InkWell(
                              onTap: () {
                                _customInfoWindowController.hideInfoWindow!();
                              },
                              child: const MyIconButton(
                                icon: Icons.close,
                                radius: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          ],
                        ),
                        Text(Accommodify.address),
                        SizedBox(height: size.height * 0.007),
                        Text(
                          "${Accommodify.price} XAF",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: size.height * 0.025),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            LatLng(
              Accommodify.latitude,
              Accommodify.longitude,
            ),
          );
        },
        icon: customIcon,
      );
    }).toList();

    setState(() {
      markers = myMarkers;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
            _updateMarkers(state.accommodations);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: myCurrentLocation,
                  zoom: 10,
                ),
                onMapCreated: (GoogleMapController controller) {
                  googleMapController = controller;
                  _customInfoWindowController.googleMapController = controller;
                },
                onTap: (argument) {
                  _customInfoWindowController.hideInfoWindow!();
                },
                onCameraMove: (position) {
                  _customInfoWindowController.onCameraMove!();
                },
                markers:{
                ...markers,
                 if (userLocation != null)
                        Marker(
                          markerId: const MarkerId("userLocation"),
                          position: userLocation!,
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueBlue,
                          ),
                        ),

                } 
                  
              ),
              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: size.height * 0.34,
                width: size.width * 0.85,
                offset: 50,
              ),
              Positioned(
                top: 10,
                left: size.width / 2 - 25,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),


               Positioned(
            top: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _getUserLocation,
              child: const Icon(Icons.my_location),
            ),
          ),
            ],
          );
        },
      ),
    );
  }
}
