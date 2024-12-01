import 'package:Accommodify/core/contants/constants.dart';
import 'package:Accommodify/core/contants/padding.dart';
import 'package:Accommodify/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;
  final String svgImage;
  final bool isImage;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.primaryColor = AppPalette.gradient1,
      this.secondaryColor = AppPalette.gradient2,
      this.textColor = Colors.white, 
      this.svgImage="", 
       this.isImage=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppPalette.gradient1),
          gradient: LinearGradient(colors: [
            primaryColor,
            secondaryColor,
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppPalette.transparentColor,
              shadowColor: AppPalette.transparentColor,
              fixedSize: const Size(
                395,
                55,
              )),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             isImage? SvgPicture.asset(
          Constants.assetImg + svgImage,
          fit: BoxFit.none,
        ): const SizedBox(),
        const SizedBox(width: AppPadding.miniSpacer,),
              Text(
                buttonText,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: textColor),
              ),
            ],
          )),
    );
  }
}
