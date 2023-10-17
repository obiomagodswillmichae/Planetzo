import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../Styles/colors.dart';

void success(BuildContext context, {required String message}) {
  // ignore: avoid_single_cascade_in_expression_statements
  Flushbar(
    message: message,
    messageColor: AppColor.white,
    flushbarPosition: FlushbarPosition.TOP,
    icon: Icon(
      Icons.done,
      size: 28.0,
      color: AppColor.primaryColor,
    ),
    duration: const Duration(seconds: 3),
    leftBarIndicatorColor: AppColor.primaryColor,
  )..show(context);
}

void error(BuildContext context, {required String message}) {
  // ignore: avoid_single_cascade_in_expression_statements
  Flushbar(
    messageColor: AppColor.white,
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    icon: Icon(
      Icons.error,
      size: 28.0,
      color: AppColor.Fireopal,
    ),
    duration: const Duration(seconds: 3),
    leftBarIndicatorColor: AppColor.Fireopal,
  )..show(context);
}
