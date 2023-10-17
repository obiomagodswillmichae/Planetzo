import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_b/Models/app_user.dart';
import 'package:planet_b/Provider/Authentication/auth_provider.dart';
import 'package:planet_b/Screens/CarbornFootprint/CarbornFontPrintPages/survery_controller.dart';
import 'package:planet_b/Services/db_service.dart';
import 'package:planet_b/Utils/app_route.dart';
import 'package:planet_b/Utils/busy_overlay.dart';
import 'package:planet_b/Utils/message.dart';
import 'package:planet_b/Widgets/custom_button.dart';
import 'package:planet_b/main_activity.dart';
import 'package:planet_b/second_main_activity.dart';
import 'package:provider/provider.dart';

import '../../../Styles/colors.dart';

class CompletedCarbonfootprintPage extends StatefulWidget {
  const CompletedCarbonfootprintPage({Key? key}) : super(key: key);

  @override
  State<CompletedCarbonfootprintPage> createState() =>
      _CompletedCarbonfootprintPageState();
}

class _CompletedCarbonfootprintPageState
    extends State<CompletedCarbonfootprintPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center, // Center the content
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 200),
          child: Column(
            children: [
              Text(
                "You have completed the \n survey!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: AppColor.black),
              ),
              const SizedBox(
                height: 19,
              ),
              const SizedBox(
                height: 120,
              ),
              customButton(context, onTap:isLoading ? () {} : _handleDataSubmition, text: 'SEE FOOTPRINT DETAILS', bgColor: AppColor.primaryColor, textColor: AppColor.white)
              // GestureDetector(
              //   onTap: isLoading ? () {} : _handleDataSubmition,
              //   child: Container(
              //     alignment: Alignment.center,
              //     padding: const EdgeInsets.all(19),
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       color: Colors.green.shade100,
              //       borderRadius: const BorderRadius.all(Radius.circular(10)),
              //       border: Border.all(color: AppColor.primaryColor, width: 1),
              //     ),
              //     child: Text(
              //       "SEE FOOTPRINT DETAILS",
              //       style: TextStyle(
              //           fontWeight: FontWeight.w800,
              //           fontSize: 12,
              //           color: AppColor.black),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        if (isLoading)
          Positioned.fill(
            child: const BusyOverlay(
                show: true,
                title: 'Loading.....', child: Text("")),
          ),
      ],
    );
  }

  void _handleDataSubmition() async {
    setState(() => isLoading = true);

    final controller = Get.put(CarbonSurveyController());
    final footPrint = controller.cookingAnswer.value +
        controller.transportAnswer.value +
        controller.foodAnswer.value +
        controller.homeAnswer.value;
    final profile = UserProfile(
      bushBurning: controller.cookingAnswer.value,
      carbonFootprint: footPrint,
      food: controller.foodAnswer.value,
      home: controller.homeAnswer.value,
      transport: controller.transportAnswer.value,
    );

    final resp = await FDatabase.addUserProfile(profile, false);
    if (!resp.isSuccess) {
      error(context, message: 'An error occurred $resp.message');
      setState(() => isLoading = false);
      return;
    }
    await Provider.of<AuthenticationProvider>(context, listen: false)
        .setCurrentUser();
    setState(() => isLoading = false);
    success(context, message: 'Successfully completed today\'s survey');
    await Future.delayed(Duration(seconds: 2));
    nextPageAndRemovePrevious(context, page: SecondMainActivity());
    controller.currentPage(1);
  }
}
