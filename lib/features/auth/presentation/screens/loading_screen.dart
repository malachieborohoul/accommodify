import 'package:Accommodify/features/auth/presentation/screens/onboarding_screen.dart';
import 'package:Accommodify/features/home/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Accommodify/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:Accommodify/core/common/widgets/loader.dart';
import 'package:Accommodify/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const LoadingScreen(),
        );
      });
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late String? token;
  @override
  void initState()  {
    super.initState();
    // Future.delayed(const Duration(seconds: 2));

    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
    getSharedPreferencesData();
  }

  void getSharedPreferencesData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('x-auth-token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocSelector<AppUserCubit, AppUserState, bool>(
      selector: (state) {
        return state is AppUserLoggedIn;
      },
      builder: (context, isLoggedIn) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
              if (state is AuthSuccess) {
                               Navigator.pushReplacement(context, AppMainScreen.route());

              } else if (state is AuthFailure ||
                  state is AuthInitial ||
                  state is AuthSignOutSuccess) {
                // L'utilisateur n'est pas authentifié, redirection vers la page de connexion
                // Navigator.pushReplacement(
                //   context,
                //   OnboardingScreen.route(),
                // );
                Navigator.pushReplacement(context, AppMainScreen.route());
              }
          },
          child: const Center(
            child: Loader(),
          ),
        );
      },
    ));
  }
}
