import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_b/Screens/CarbornFootprint/CarbornFontPrintPages/survery_controller.dart';
import 'package:planet_b/Styles/colors.dart';
import 'package:planet_b/Utils/page_service.dart';

import '../../../Utils/app_route.dart';
import 'second_transport.dart';

class CarbonTransport extends StatefulWidget {
  const CarbonTransport({Key? key}) : super(key: key);

  @override
  State<CarbonTransport> createState() => _CarbonTransportState();
}

class _CarbonTransportState extends State<CarbonTransport> {
  late bool isSelected = false;
  late bool isClicked = false;
  late bool isPicked = false;

  String? value;

  @override
  Widget build(BuildContext context) {
    final sController = Get.put(CarbonSurveyController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text("Transportation",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColor.black)),
          const SizedBox(height: 58),
          const Image(image: AssetImage("assets/images/bus.png")),
          const SizedBox(height: 40),
          Text(
            sController.questions[1]!.question,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16, color: AppColor.black),
          ),
          const SizedBox(height: 20),
          ...sController.questions[1]!.options.map((option) {
            return Obx(
              () => RadioListTile(
                activeColor: Colors.green,
                contentPadding: EdgeInsets.symmetric(horizontal: 50),
                value: option.value,
                groupValue: sController.transportAnswer.value,
                onChanged: (val) {
                  sController.transportAnswer(val);
                },
                title: Text(option.option),
              ),
            );
          }).toList(),
        ],
      ),
    );
  
  }
}
