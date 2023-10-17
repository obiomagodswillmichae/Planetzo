import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:flutter_utilities/flutter_utilities.dart';
import 'package:provider/provider.dart';

import '../../Provider/Authentication/auth_provider.dart';
import '../../Provider/database_provider.dart';
import '../../Styles/colors.dart';
import '../../Utils/message.dart';
import '../../Widgets/custom_button.dart';



class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _code = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();

    DatabaseProvider().getEmail().then((value) {
      _email.text = value;
    });
  }

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
          "Reset Password",
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

                    Consumer<DatabaseProvider>(builder: (context, db, child) {
                      db.getEmail();
                      return Center(
                        child: Text(
                          "An OTP code has been sent to ${db.email} to complete \n password reset",
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                            fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.black
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        "Enter Email Address",
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
                      height: 9,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        "Code",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColor.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    CustomTextField(
                      _code,
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
                      height: 9,
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
                      _password,
                      hint: "*********",
                      textStyle: TextStyle(
                          fontSize: 16,
                          color: AppColor.black,
                          fontWeight: FontWeight.w700),
                      password: true,
                      // backgroundColor: Colors.green.shade100,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: AppColor.primaryColor),
                    ),

                    const SizedBox(
                      height: 26,
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
                                if (_email.text.isEmpty ||
                                    _password.text.isEmpty ||
                                    _code.text.isEmpty) {
                                  error(context,
                                      message: "All field are required");
                                } else if (FlutterUtilities()
                                    .isEmailValid(_email.text.trim()) ==
                                    false) {
                                  error(context,
                                      message: "Invalid email address");
                                } else {
                                  ///Send user into the app
                                  auth.newPassword(
                                      code: _code.text.trim(),
                                      email: _email.text.trim(),
                                      password: _password.text.trim(),
                                      context: context);
                                }
                                // nextPage(context, page: const PhoneSignUp());
                              },
                              text: auth.isLoading == true
                                  ? "Please wait..."
                                  : 'Confirm',
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
                            // nextPage(context, page: const EmailLoginPage());
                          },
                          child: const Text("Remember password? Sign in",
                              style: TextStyle(fontSize: 16))),
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
