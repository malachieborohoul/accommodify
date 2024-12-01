
import 'package:Accommodify/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:Accommodify/core/theme/theme.dart';
import 'package:Accommodify/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:Accommodify/features/auth/presentation/screens/splash_screen.dart';
import 'package:Accommodify/features/home/presentation/bloc/accommodation_bloc.dart';
import 'package:Accommodify/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
      BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      BlocProvider(create: (_) => serviceLocator<AccommodationBloc>()),
      
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      title: "accomodation",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      home: const SplashScreen(), // Affiche d'abord le Splash Screen
    );
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (_) => FavoriteProvider(),
    //     )
    //   ],
    //   child:  MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: 
    //     // GoogleMapFlutter(),
    //         // keep user login until logout

    //         StreamBuilder(
    //       stream: FirebaseAuth.instance.authStateChanges(),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           return const AppMainScreen();
    //         } else {
    //           return const LoginScreen();
    //         }
    //       },
    //     ),
    //   ),
    // );
  }
}
