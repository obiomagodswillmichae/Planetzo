import 'package:flutter/material.dart';

import '../Screens/Authentication/forgot_password.dart';
import '../Screens/Authentication/phone_signup.dart';
import '../Styles/colors.dart';
import '../Utils/app_route.dart';
import '../main_activity.dart';


void showCustomBottomSheet(BuildContext context, String? path) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25))),
    builder: (context) => Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Image(image: AssetImage("assets/images/sucessful.png")),
          const SizedBox(
            height: 32,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              path == "email" ? "Email Verified" : "Phone Verified",
              style: TextStyle(fontSize: 18, color: AppColor.spaceCadet),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              path == "email"
                  ? "Your Email Address has been verified"
                  : "Your Phone Number has been verified",
              style: TextStyle(fontSize: 16, color: AppColor.black, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              "successfully",
              style: TextStyle(fontSize: 16, color: AppColor.black, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 44,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              width: 200,
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Done",
                    style: TextStyle(
                        fontSize: 16, color: AppColor.white, fontFamily: ''),
                  )),
            ),
          ),
        ],
      ),
    ),
  ).then((value) {
    if (path == 'email') {
      nextPage(context, page: const PhoneSignUp());
    } else if (path == "reset") {
      nextPageAndRemovePrevious(context, page: const ForgotPasswordPage());
    } else {
      nextPageAndRemovePrevious(context, page: const MainActivityPage());
    }
  });
}
