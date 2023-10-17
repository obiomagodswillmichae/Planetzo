import 'package:flutter/material.dart';

import '../Styles/colors.dart';

class SocialButton extends StatelessWidget {
  SocialButton(
      {required this.text,
        required this.icon,
        this.onTap,
        required this.bgColor,
        this.textColor});

  final String text;
  final Widget icon;
  final Color bgColor;
  final Color? textColor;
  final VoidCallback? onTap;

  //Color Instance

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.black, width: 1),
              color: bgColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: textColor ?? AppColor.primaryColor,
                    fontFamily: ''),
              )
            ],
          )),
    );
  }
}
