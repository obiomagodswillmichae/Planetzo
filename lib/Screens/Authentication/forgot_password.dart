import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:flutter_utilities/flutter_utilities.dart';
import 'package:planet_b/Screens/Authentication/reset_password.dart';
import 'package:planet_b/Styles/colors.dart';
import 'package:planet_b/Utils/message.dart';
import 'package:provider/provider.dart';

import '../../Provider/Authentication/auth_provider.dart';
import '../../Utils/app_route.dart';
import '../../Widgets/custom_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColor.primaryColor,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Forgot password",
          style: TextStyle(
              fontWeight: FontWeight.w800, color: AppColor.black, fontSize: 24),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Enter your email address so that we can help \n you retrieve your email address.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black),
                      ),
                    ),
                    const SizedBox(
                      height: 49,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        "Email address",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColor.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    CustomTextField(
                      _email,
                      hint: "plant-b@gmail.com",
                      textStyle: TextStyle(
                          fontSize: 16,
                          color: AppColor.black,
                          fontWeight: FontWeight.w700),
                      password: false,
                      // backgroundColor: Colors.green.shade100,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: AppColor.primaryColor),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: () {
                            // nextPageAndRemovePrevious(context,
                            //     page: const EmailLoginPage());
                          },
                          child: Text("Remember Password?",
                              style: TextStyle(
                                  color: AppColor.primaryColor, fontSize: 14))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Consumer<AuthenticationProvider>(
                        builder: (context, auth, child) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          if (auth.resMessage != "") {
                            if (auth.resMessage.contains("`")) {
                              success(context, message: auth.resMessage);
                              auth.clearMessage();
                            } else {
                              error(context, message: auth.resMessage);
                              auth.clearMessage();
                            }
                          }
                        },
                      );
                      return customButton(context,
                          onTap: auth.isLoading == true
                              ? () {}
                              : () {
                                  if (_email.text.isEmpty) {
                                    error(context,
                                        message: "All field are required");
                                  } else if (FlutterUtilities()
                                          .isEmailValid(_email.text.trim()) ==
                                      false) {
                                    error(context,
                                        message: "Invalid email address");
                                  } else {
                                    ///Send user into the app
                                    auth.forgotPassword(
                                        email: _email.text.trim(),
                                        context: context);
                                  }
                                  // nextPage(context, page: const PhoneSignUp());
                                },
                          text: auth.isLoading == true
                              ? "Please wait..."
                              : 'Continue',
                          bgColor: auth.isLoading == true
                              ? AppColor.gray
                              : AppColor.primaryColor,
                          textColor: AppColor.white);
                    }),
                    Container(
                      margin: const EdgeInsets.only(top: 250),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          nextPage(context, page: const ResetPasswordPage());
                        },
                        child: Text(
                          " Back to log in page",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
