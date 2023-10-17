import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_b/Screens/CarbornFootprint/CarbornFontPrintPages/survery_controller.dart';
import 'package:planet_b/Styles/colors.dart';

import '../../../Utils/app_route.dart';
import '../../../Utils/page_service.dart';
import 'food.dart';

class CarbonTransportCar extends StatefulWidget {
  const CarbonTransportCar({Key? key}) : super(key: key);

  @override
  State<CarbonTransportCar> createState() => _CarbonTransportCarState();
}

class _CarbonTransportCarState extends State<CarbonTransportCar> {
  late bool isSelected = false;
  late bool isClicked = false;
  late bool isPicked = false;

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
              style:TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColor.black)),
          const SizedBox(height: 58),
          const Image(image: AssetImage("assets/images/bus.png")),
          const SizedBox(height: 40),
          Text(
            sController.questions[2]!.question,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16, color: AppColor.black),
          ),
          const SizedBox(height: 20),
          ...sController.questions[2]!.options.map((option) {
            return Obx(
              () => RadioListTile(
                activeColor: Colors.green,
                contentPadding: EdgeInsets.symmetric(horizontal: 50),
                value: option.value,
                groupValue: sController.transportAnswer2.value,
                onChanged: (val) {
                  sController.transportAnswer2(val);
                },
                title: Text(option.option),
              ),
            );
          }).toList(),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 70),
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           GestureDetector(
          //             onTap: () {
          //               setState(
          //                 () {
          //                   isSelected = !isSelected;
          //                 },
          //               );
          //             },
          //             child: Icon(
          //               isSelected
          //                   ? Icons.check_circle_rounded
          //                   : Icons.circle_outlined,
          //               color: isSelected ? AppColor.primaryColor : Colors.black,
          //               size: 25,
          //             ),
          //           ),
          //           const SizedBox(width: 10),
          //           Column(
          //             children: [
          //               Text(
          //                 "Petrol Powered",
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                     fontSize: 16,
          //                     color: AppColor.black),
          //               ),
          //             ],
          //           )
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 15,
          //       ),
          //       Row(
          //         children: [
          //           GestureDetector(
          //             onTap: () {
          //               setState(
          //                 () {
          //                   isClicked = !isClicked;
          //                 },
          //               );
          //             },
          //             child: Icon(
          //               isClicked
          //                   ? Icons.check_circle_rounded
          //                   : Icons.circle_outlined,
          //               color: isClicked ? AppColor.primaryColor : Colors.black,
          //               size: 25,
          //             ),
          //           ),
          //           const SizedBox(width: 10),
          //           Column(
          //             children: [
          //               Text(
          //                 "Diesel Powered",
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                     fontSize: 16,
          //                     color: AppColor.black),
          //               ),
          //             ],
          //           )
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 15,
          //       ),
          //       Row(
          //         children: [
          //           GestureDetector(
          //             onTap: () {
          //               setState(
          //                 () {
          //                   isPicked = !isPicked;
          //                 },
          //               );
          //             },
          //             child: Icon(
          //               isPicked
          //                   ? Icons.check_circle_rounded
          //                   : Icons.circle_outlined,
          //               color: isPicked ? AppColor.primaryColor : Colors.black,
          //               size: 25,
          //             ),
          //           ),
          //           const SizedBox(width: 10),
          //           Column(
          //             children: [
          //               Text(
          //                 "None of theAbove",
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                     fontSize: 16,
          //                     color: AppColor.black),
          //               ),
          //             ],
          //           )
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // ,const SizedBox(
          //   height: 120,
          // ),
        ],
      ),
    );
  

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Transportation",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.black),
          ),
          const SizedBox(
            height: 58,
          ),
          const Image(image: AssetImage("assets/images/bus.png")),
          const SizedBox(
            height: 57,
          ),
          Text(
            "How many minute per day do you \n  typically travel  by bus?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.black),
          ),
          const SizedBox(
            height: 26,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 112),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            isSelected = !isSelected;
                          },
                        );
                      },
                      child: Icon(
                        isSelected
                            ? Icons.check_circle_rounded
                            : Icons.circle_outlined,
                        color:
                            isSelected ? AppColor.primaryColor : Colors.black,
                        size: 25,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          "10 - 20min",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColor.black),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            isClicked = !isClicked;
                          },
                        );
                      },
                      child: Icon(
                        isClicked
                            ? Icons.check_circle_rounded
                            : Icons.circle_outlined,
                        color: isClicked ? AppColor.primaryColor : Colors.black,
                        size: 25,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          "20 - 40min",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColor.black),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            isPicked = !isPicked;
                          },
                        );
                      },
                      child: Icon(
                        isPicked
                            ? Icons.check_circle_rounded
                            : Icons.circle_outlined,
                        color: isPicked ? AppColor.primaryColor : Colors.black,
                        size: 25,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          "40 - 60min",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColor.black),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
