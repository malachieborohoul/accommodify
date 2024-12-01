import 'package:Accommodify/core/utils/loader_dialog.dart';
import 'package:Accommodify/core/utils/show_snackbar.dart';
import 'package:Accommodify/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:Accommodify/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:Accommodify/core/common/widgets/custom_button.dart';
import 'package:Accommodify/core/contants/constants.dart';
import 'package:Accommodify/core/contants/padding.dart';
import 'package:Accommodify/core/theme/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const OnboardingScreen(),
        );
      });
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;
  SharedPreferences? prefs;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    pref();
    super.initState();
  }

  void pref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
           listener: (context, state) {
                  if (state is AuthLoading) {
                    showLoaderDialog(context);
                  } else {
                    closeLoaderDialog(context);
                    if (state is AuthFailure) {
                      showSnackBar(context, state.message);
                    } else if (state is AuthSuccess) {
                      Navigator.pushAndRemoveUntil(
                          context, SplashScreen.route(), (route) => false);
                    }
                  }
                },
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                onPageChanged: (int page) {
                  setState(() {
                    currentIndex = page;
                  });
                },
                controller: _pageController,
                children: [
                  makePage(
                    image: "hotel.webp",
                    title: "Simplifiez votre recherche, trouvez votre logement",
                    content: "",
                    button: true,
                  ),
                  // makePage(
                  //     image: "graph.webp",
                  //     title: "Track Your Progress, Celebrate Your Success",
                  //     content:
                  //         "Stay motivated by watching your transformation unfold. Ready to begin?",
                  //     button: true,
                  //     prefs: prefs),
                ],
              ),
              // Container(
              //   margin: EdgeInsets.only(bottom: size.height * .15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: _buildIndicator(),
              //   ),
              // ),

              Padding(
                padding: EdgeInsets.only(
                  bottom: size.height * .05,
                  left: AppPadding.appPadding,
                  right: AppPadding.appPadding,
                ),
                child: CustomButton(
                    isImage: true,
                    svgImage: "google_logo.svg",
                    textColor: Colors.black,
                    primaryColor: Colors.white,
                    secondaryColor: Colors.white,
                    buttonText: "Connectez vous avec Google",
                    onPressed: () {
                      // prefs!.setString('x-auth-token', '');
                      // Navigator.push(context, SigninScreen.route());

                      context.read<AuthBloc>().add(AuthSignUpWithGoogle());
                    }),
              )
            ],
          );
        },
      ),
    );
  }

  Widget makePage(
      {image, title, content, button = false, SharedPreferences? prefs}) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: AppPadding.appPadding,
              right: AppPadding.appPadding,
              bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.appPadding),
                child: Image.asset(
                  Constants.assetImg + image,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppPadding.miniSpacer,
              ),
              Text(
                content,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppPalette.greyColor),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _indicator(bool isActive) {
  //   return AnimatedContainer(
  //       duration: const Duration(milliseconds: 300),
  //       height: 8,
  //       width: isActive ? 30 : 8,
  //       margin: const EdgeInsets.only(right: 5),
  //       decoration: BoxDecoration(
  //           color: AppPalette.gradient2,
  //           borderRadius: BorderRadius.circular(5)));
  // }

  // List<Widget> _buildIndicator() {
  //   List<Widget> indicators = [];
  //   for (int i = 0; i < 2; i++) {
  //     if (currentIndex == i) {
  //       indicators.add(_indicator(true));
  //     } else {
  //       indicators.add(_indicator(false));
  //     }
  //   }
  //   return indicators;
  // }
}
