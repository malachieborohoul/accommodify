import 'package:accommodation/components/my_icon_button.dart';
import 'package:accommodation/core/utils/loader_dialog.dart';
import 'package:accommodation/core/utils/show_snackbar.dart';
import 'package:accommodation/features/home/presentation/bloc/accommodation_bloc.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  void _updateMarkers(List accommodations) {
    Size size = MediaQuery.of(context).size;

    List<Marker> myMarkers = accommodations.map<Marker>((accommodation) {
      return Marker(
        markerId: MarkerId(accommodation.address),
        position: LatLng(
          accommodation.latitude,
          accommodation.longitude,
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
                            images: accommodation.imageUrls
                                .map((url) => NetworkImage(url))
                                .toList(),
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
                              accommodation.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                          ],
                        ),
                        Text(accommodation.address),
                        SizedBox(height: size.height * 0.007),
                        Text(
                          "${accommodation.price} XAF",
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
              accommodation.latitude,
              accommodation.longitude,
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
                markers: markers.toSet(),
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
            ],
          );
        },
      ),
    );
  }
}
