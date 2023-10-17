import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';

import '../../Styles/colors.dart';
import '../../Widgets/custom_button.dart';

class PhoneSignUp extends StatefulWidget {
  const PhoneSignUp({Key? key}) : super(key: key);

  @override
  State<PhoneSignUp> createState() => _PhoneSignUpState();
}

class _PhoneSignUpState extends State<PhoneSignUp> {
  TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Phone Number",
          style: TextStyle(
              fontWeight: FontWeight.w800, color: AppColor.black, fontSize: 24),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Image(
                          image: AssetImage("assets/images/auth_one.png"))),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Contact Number",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.black,
                        fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: AppColor.primaryColor),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: const BoxDecoration(
                              color: Color(0xffF8F8FF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Text(
                              "+234",
                              style: TextStyle(
                                  fontSize: 14, color: AppColor.black),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            _phoneNumber,
                            keyboardType: TextInputType.number,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            password: false,
                            hint: "",
                            textStyle: TextStyle(color: AppColor.onyx),
                            backgroundColor: Colors.white,
                            border: const Border.symmetric(
                                horizontal: BorderSide.none,
                                vertical: BorderSide.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "A six digit verification code will be sent to this \n phone number",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Consumer<EmailAndPhoneVerificationProvider>(
                  //     builder: (context, phoneProvider, child) {
                  //       WidgetsBinding.instance.addPostFrameCallback((_) {
                  //         if (phoneProvider.resMessage != "") {
                  //           if (phoneProvider.resMessage.contains("`")) {
                  //             success(context, message: phoneProvider.resMessage);
                  //             phoneProvider.clearMessage();
                  //             nextPage(context,
                  //                 page: const OtpPage(
                  //                   path: "phone",
                  //                 ));
                  //           } else {
                  //             error(context, message: phoneProvider.resMessage);
                  //             phoneProvider.clearMessage();
                  //           }
                  //         }
                  //       });
                  //       return customButton(context,
                  //           onTap: phoneProvider.isLoading == true
                  //               ? () {}
                  //               : () {
                  //             if (_phoneNumber.text.isEmpty) {
                  //               error(context,
                  //                   message: "Phone number is required");
                  //               return;
                  //             }
                  //             phoneProvider.sendPhoneOtp(
                  //                 "+234${_phoneNumber.text.trim()}", context);
                  //           },
                  //           text: phoneProvider.isLoading == true
                  //               ? "Please wait..."
                  //               : 'Continue',
                  //           bgColor: phoneProvider.isLoading == true
                  //               ? AppColor.gainsboro
                  //               : AppColor.primaryColor,
                  //           textColor: AppColor.white);
                  //     }),
                  customButton(
                      text: 'Next',
                      onTap: () {},
                      context,
                      bgColor: AppColor.primaryColor,
                      textColor: AppColor.white),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  customButton(text: 'Login', onTap: () {
                    // nextPage(context, page: const CreateAccountPage());
                    // nextPage(context, page: const OtpPage());
                  }, context,
                      bgColor: AppColor.primaryColor,
                      textColor: AppColor.white),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
