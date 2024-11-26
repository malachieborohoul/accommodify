import 'package:flutter/material.dart';
import 'package:accommodation/core/theme/app_palette.dart';

class CustomDividerWithText extends StatelessWidget {
  final String text;
  final Color dividerColor;
  final Color textColor;
  final double horizontalPadding;

  const CustomDividerWithText({
    super.key,
    required this.text,
    this.dividerColor = AppPalette.greyColor,
    this.textColor = AppPalette.greyColor,
    this.horizontalPadding = 45.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Divider(
              color: dividerColor,
            ),
          ),
          const SizedBox(
            width: 8.0, // Ajustez si besoin
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: textColor),
          ),
          const SizedBox(
            width: 8.0, // Ajustez si besoin
          ),
          Expanded(
            child: Divider(
              color: dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}
