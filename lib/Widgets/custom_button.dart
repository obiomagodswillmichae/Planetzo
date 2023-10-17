import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Styles/colors.dart';

Widget customButton(BuildContext context,
    {required VoidCallback onTap,
      required String text,
      Color? bgColor,
      Color? textColor,
      bool isLoading = false,
      Color? loadingColor,
      }) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: bgColor ?? AppColor.white,
            borderRadius: BorderRadius.circular(10)),
        child: isLoading? CupertinoActivityIndicator(color: loadingColor?? Colors.white,): Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor ?? AppColor.primaryColor,
              fontFamily: ''),
        )),
  );
}