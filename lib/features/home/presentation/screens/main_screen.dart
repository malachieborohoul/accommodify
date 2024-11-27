
import 'package:accommodation/core/contants/padding.dart';
import 'package:accommodation/core/theme/app_palette.dart';
import 'package:accommodation/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppMainScreen extends StatefulWidget {
    static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const AppMainScreen(),
        );
      });

  const AppMainScreen({super.key});


  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;

  @override
  void initState() {
    page = [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      
      // const Wishlists(),
      // const Scaffold(),
      // const MessagesScreen(),
      // const ProfilePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 5,
        iconSize: AppPadding.smallSpacer,
        selectedItemColor: AppPalette.gradient1,
        unselectedItemColor: Colors.black45,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
           BottomNavigationBarItem(
            icon: Icon(
              
              Icons.home,
              color: selectedIndex == 0 ? AppPalette.gradient1 : Colors.black45,
            ),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: selectedIndex == 1 ? AppPalette.gradient1 : Colors.black45,
            ),
            label: "Favoris",
          ),
         
        
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: selectedIndex == 2 ? AppPalette.gradient1 : Colors.black45,
            ),
            label: "Profil",
          ),
        ],
      ),
      body: page[selectedIndex],
    );
  }
}