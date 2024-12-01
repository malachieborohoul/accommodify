import 'package:Accommodify/core/common/widgets/loader.dart';
import 'package:flutter/material.dart';

void showLoaderDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Loader();
    },
  );
}

void closeLoaderDialog(BuildContext context) {

  if (Navigator.canPop(context)) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
