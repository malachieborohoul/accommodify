import 'package:flutter/material.dart';
import 'package:accommodation/core/common/widgets/custom_button.dart';
import 'package:accommodation/core/contants/constants.dart';
import 'package:accommodation/core/contants/padding.dart';
import 'package:accommodation/core/theme/app_palette.dart';
import 'package:accommodation/features/auth/presentation/screens/signin_screen.dart';
import 'package:accommodation/features/auth/presentation/widgets/custom_rich_text.dart';

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
      body: Stack(
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
                image: "group.webp",
                title: "Beauty Made Simple Wellness Made Essential",
                content:
                    "Transform Your Look, Transform Your Life, Your Ultimate Desire Awaits Here.",
              ),
              makePage(
                  image: "graph.webp",
                  title: "Track Your Progress, Celebrate Your Success",
                  content:
                      "Stay motivated by watching your transformation unfold. Ready to begin?",
                  button: true,
                  prefs: prefs),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: size.height * .15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          currentIndex < 1
              ? Container(
                  margin: EdgeInsets.only(bottom: size.height * .05),
                  child: CustomRichText(
                    primaryText: "Skip to",
                    secondaryText: " Sign In",
                    onTap: () {
                      // prefs!.setString('x-auth-token', '');

                      Navigator.push(context, SigninScreen.route());
                    },
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    bottom: size.height * .05,
                    left: AppPadding.appPadding,
                    right: AppPadding.appPadding,
                  ),
                  child:
                      CustomButton(buttonText: "Get Started", onPressed: () {
                          prefs!.setString('x-auth-token', '');
                          Navigator.push(context, SigninScreen.route());
                      }),
                )
        ],
      ),
    );
  }

  Widget makePage(
      {image, title, content, button = false, SharedPreferences? prefs}) {
    return Stack(
      children: [
        Image.asset(
          color: const Color.fromARGB(255, 236, 229, 229),
          '${Constants.assetImg}background.webp',
        ),
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
                style: Theme.of(context).textTheme.headlineSmall!,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppPadding.miniSpacer,
              ),
              Text(
                content,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppPalette.greyColor),
                textAlign: TextAlign.center,
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

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 8,
        width: isActive ? 30 : 8,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: AppPalette.gradient2,
            borderRadius: BorderRadius.circular(5)));
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 2; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
