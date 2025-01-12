import 'package:flutter/material.dart';
import 'package:Accommodify/features/auth/presentation/screens/loading_screen.dart';

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

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late final _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));

  late final Animation<double> _animation = Tween<double>(begin: 1.0, end: 1.2)
      .animate(CurvedAnimation(
          parent: _animationController, curve: Curves.decelerate));

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) {

     if (mounted) {
      Navigator.pushReplacement(context, LoadingScreen.route());
    }
    });

        _animationController.forward();
    _animationController.addStatusListener((status) {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (_animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

  }

   @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:
          Center(
            child: ScaleTransition(
                          scale: _animation,
                          child:  Image.asset("assets/logo.png", width: 200,)
                          
                          // Text("Accomodify", style:  TextStyle(color: AppPalette.gradient1, fontSize: 35, fontWeight: FontWeight.bold)),
                        ),
          ),
          );


  }
}
