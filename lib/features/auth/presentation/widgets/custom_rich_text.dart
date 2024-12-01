import 'package:flutter/material.dart';
import 'package:Accommodify/core/theme/app_palette.dart';

class CustomRichText extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final TextStyle? primaryTextStyle;
  final TextStyle? secondaryTextStyle;
  final VoidCallback? onTap; // Pour gérer le clic sur le texte secondaire

  const CustomRichText({
    super.key,
    required this.primaryText,
    required this.secondaryText,
    this.primaryTextStyle,
    this.secondaryTextStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: primaryText,
          style: primaryTextStyle ?? Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black),
          children: [
            TextSpan(
              text: secondaryText,
              style: secondaryTextStyle?.copyWith(decoration: TextDecoration.underline) ?? 
                  Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: AppPalette.gradient1,

                    decoration: TextDecoration.underline,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
