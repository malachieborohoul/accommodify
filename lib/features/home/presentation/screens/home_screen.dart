
import 'package:Accommodify/core/contants/padding.dart';
import 'package:Accommodify/features/home/presentation/widgets/display_accommodation.dart';
import 'package:Accommodify/features/home/presentation/widgets/map_with_custom_info_windows.dart';
import 'package:Accommodify/features/home/presentation/widgets/search_bar_and_filter.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// 
class _HomeScreenState extends State<HomeScreen> {


  // collection for category
  // final CollectionReference categoryCollection =
  //     FirebaseFirestore.instance.collection("AppCategory");

  

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: const SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(top: AppPadding.appPadding),
          child: Column(
            children: [
              // for search bar and filter button
              SearchBarAndFilter(),
              // let's fetch list of category items from firebase.
              // listOfCategoryItems(size),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                     // for switch button
                      // DisplayTotalPrice(),
                      SizedBox(height: 15),
                      // displat the place items
                      DisplayAccommodation(),
                    
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // for google map
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () {
       Navigator.push(context, MapWithCustomInfoWindows.route() );
      },
      label: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Row(
          children: [
            SizedBox(width: 5),
            Text(
              "Carte",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.map_outlined,
              color: Colors.white,
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
    )
        
      
      // floatingActionButton: MapWithCustomInfoWindows(),
    );
  }

  // StreamBuilder<QuerySnapshot<Object?>> listOfCategoryItems(Size size) {
  //   return StreamBuilder(
  //     stream: categoryCollection.snapshots(),
  //     builder: (context, streamSnapshot) {
  //       if (streamSnapshot.hasData) {
  //         return Stack(
  //           children: [
  //             const Positioned(
  //               left: 0,
  //               right: 0,
  //               top: 80,
  //               child: Divider(
  //                 color: Colors.black12,
  //               ),
  //             ),
  //             SizedBox(
  //               height: size.height * 0.12,
  //               child: ListView.builder(
  //                 padding: EdgeInsets.zero,
  //                 scrollDirection: Axis.horizontal,
  //                 itemCount: streamSnapshot.data!.docs.length,
  //                 physics: const BouncingScrollPhysics(),
  //                 itemBuilder: (context, index) {
  //                   return GestureDetector(
  //                     onTap: () {
  //                       setState(() {
  //                         selectedIndex = index;
  //                       });
  //                     },
  //                     child: Container(
  //                       padding: const EdgeInsets.only(
  //                         top: 20,
  //                         right: 20,
  //                         left: 20,
  //                       ),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(15),
  //                       ),
  //                       child: Column(
  //                         children: [
  //                           Container(
  //                             height: 32,
  //                             width: 40,
  //                             decoration: const BoxDecoration(
  //                               shape: BoxShape.circle,
  //                             ),
  //                             child: Image.network(
  //                               streamSnapshot.data!.docs[index]['image'],
  //                               color: selectedIndex == index
  //                                   ? Colors.black
  //                                   : Colors.black45,
  //                             ),
  //                           ),
  //                           const SizedBox(height: 5),
  //                           Text(
  //                             streamSnapshot.data!.docs[index]['title'],
  //                             style: TextStyle(
  //                               fontSize: 13,
  //                               color: selectedIndex == index
  //                                   ? Colors.black
  //                                   : Colors.black45,
  //                             ),
  //                           ),
  //                           const SizedBox(height: 10),
  //                           Container(
  //                             height: 3,
  //                             width: 50,
  //                             color: selectedIndex == index
  //                                 ? Colors.black
  //                                 : Colors.transparent,
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ],
  //         );
  //       }
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     },
  //   );
  // }
}