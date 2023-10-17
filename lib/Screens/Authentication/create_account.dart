import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:planet_b/Provider/Authentication/auth_provider.dart';
import 'package:planet_b/Services/auth_service.dart';
import 'package:planet_b/Services/otp_service.dart';
import 'package:planet_b/Utils/app_route.dart';
import 'package:planet_b/Utils/message.dart';
import 'package:planet_b/Utils/busy_overlay.dart'; // Import the busy overlay
import 'package:provider/provider.dart';
import '../../Styles/colors.dart';
import '../../Utils/page_service.dart';
import '../../Widgets/custom_button.dart';
import 'email_login.dart';
import 'otp.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  bool isBusy = false;

  @override
  Widget build(BuildContext context) {
    return BusyOverlay(
      // Wrap the entire widget with BusyOverlay
      show: isBusy, // Set show to control when the overlay is visible
      title: 'Creating',
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            "Create Account",
            style: PageService.bigHeaderStyle,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Text(
                          "First Name",
                          style: PageService.labelStyle,
                        ),
                      ),
                      CustomTextField(
                        firstName,
                        hint: "",
                        password: false,
                        backgroundColor: const Color(0xffF5F5F5),
                        border: Border.all(
                            color: const Color(0xffF5F5F5), width: 0),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Text(
                          "Last Name",
                          style: PageService.labelStyle,
                        ),
                      ),
                      CustomTextField(
                        lastName,
                        hint: "",
                        password: false,
                        backgroundColor: const Color(0xffF5F5F5),
                        border: Border.all(
                            color: const Color(0xffF5F5F5), width: 0),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Text(
                          "Email",
                          style: PageService.labelStyle,
                        ),
                      ),
                      CustomTextField(
                        email,
                        hint: "",
                        password: false,
                        backgroundColor: const Color(0xffF5F5F5),
                        border: Border.all(
                            color: const Color(0xffF5F5F5), width: 0),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Text(
                          "User Name",
                          style: PageService.labelStyle,
                        ),
                      ),
                      CustomTextField(
                        userName,
                        hint: "",
                        password: false,
                        backgroundColor: const Color(0xffF5F5F5),
                        border: Border.all(
                            color: const Color(0xffF5F5F5), width: 0),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Text(
                          "Password",
                          style: PageService.labelStyle,
                        ),
                      ),
                      CustomTextField(
                        password,
                        hint: "",
                        password: true,
                        pwdVisibilityColor: AppColor.primaryColor,
                        backgroundColor: const Color(0xffF5F5F5),
                        border: Border.all(
                            color: const Color(0xffF5F5F5), width: 0),
                      ),
                      const SizedBox(height: 40),
                      customButton(
                          text: 'Create Account',
                          isLoading: isBusy,
                          onTap: _handleRegister,
                          context,
                          bgColor: AppColor.primaryColor,
                          textColor: AppColor.white),
                      PageService.textSpacexxL,
                      GestureDetector(
                        onTap: () {
                          nextPageAndRemovePrevious(context,
                              page: const LoginPage());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                  children: [
                                TextSpan(
                                    text: 'Already have an account?',
                                    style: PageService.labelStyle),
                                TextSpan(
                                    text: ' Login here',
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ])),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleRegister() async {
    if (!key.currentState!.validate()) {
      return;
    }
    log('in here');
    setState(() => isBusy = true); // Show the busy overlay

    final resp = await FAuth.signUpWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim(),
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      userName: userName.text.trim(),
    );
    if (!resp.isSuccess) {
      error(context, message: 'Fields are required');
      setState(() => isBusy = false);
      return;
    }
    log('Sending otp');
    final otpResp = await OtpService.sendOtp(userEmail: email.text.trim());
    if (!otpResp.isSuccess) {
      error(context, message: 'An Error Occurred');
      setState(() => isBusy = false);
      return;
    }
    success(context, message: 'Success $otpResp.message');
    await Provider.of<AuthenticationProvider>(context, listen: false)
        .setCurrentUser();
    nextPage(context,
        page: OtpPage(
          userId: resp.content,
        ));

    setState(() => isBusy = false); // Hide the busy overlay
  }
}
