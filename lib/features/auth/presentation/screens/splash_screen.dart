import 'package:flutter/material.dart';
import 'package:accommodation/core/theme/app_palette.dart';
import 'package:accommodation/features/auth/presentation/screens/loading_screen.dart';

class SplashScreen extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const SplashScreen(),
        );
      });
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) {

     if (mounted) {
      Navigator.pushReplacement(context, LoadingScreen.route());
    }
    });

  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body:  Center(
      child: Text("Accomodify", style:  TextStyle(color: AppPalette.gradient1, fontSize: 35, fontWeight: FontWeight.bold)),
    ));


  }
}
