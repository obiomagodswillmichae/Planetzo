import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:planet_b/Services/otp_service.dart';
import 'package:planet_b/Utils/message.dart';
import 'package:planet_b/Utils/page_service.dart';
import 'package:planet_b/second_main_activity.dart';

import '../../Styles/colors.dart';
import '../../Utils/app_route.dart';
import '../../Widgets/custom_button.dart';
import 'package:planet_b/Utils/busy_overlay.dart';

class OtpPage extends StatefulWidget {
  final String userId;

  const OtpPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int countdown = 60;

  Timer? timer;

  ///Controller for all text
  TextEditingController text1 = TextEditingController();
  bool isBusy = false;

  @override
  Widget build(BuildContext context) {
    return BusyOverlay(

      show: isBusy,
      title: 'Loading....',
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "OTP Page",
            style: PageService.bigHeaderStyle,
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Enter the 6 digit code sent to your email \n address",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: AppColor.black),
                      ),
                    ),
                    const SizedBox(
                      height: 85,
                    ),
                    PinInputTextField(
                      pinLength: 6,
                      controller: text1,
                      decoration: BoxLooseDecoration(
                        strokeWidth: 1,
                        strokeColorBuilder: PinListenColorBuilder(
                            AppColor.primaryColor, AppColor.primaryColor),
                        // bgColorBuilder: _solidEnable ? _solidColor : null,
                        obscureStyle: ObscureStyle(
                          isTextObscure: false,
                          obscureText: '☺️',
                        ),
                      ),
                      textInputAction: TextInputAction.go,
                      enabled: true,
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.characters,
                      enableInteractiveSelection: true,
                      cursor: Cursor(
                        width: 2,
                        color: AppColor.primaryColor,
                        radius: const Radius.circular(1),
                        // enabled: _cursorEnable,
                      ),
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "I didn't receive the code?",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 231,
                    ),
                    customButton(
                        isLoading: isBusy,
                        text: 'Proceed',
                        onTap: verifyOtp,
                        context,
                        bgColor: AppColor.primaryColor,
                        textColor: AppColor.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void verifyOtp() async {
    setState(() => isBusy = true); // Show the busy overlay
    final resp = await OtpService.verifyOtp(otp: text1.text.trim(), userId: widget.userId);

    if (!resp.isSuccess) {
      error(context, message: 'An Error occurred: $resp.message');
      setState(() => isBusy = false);
      return;
    }

    nextPageAndRemovePrevious(context, page: SecondMainActivity());

    setState(() => isBusy = false); // Hide the busy overlay
  }
}
