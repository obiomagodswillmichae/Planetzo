import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_b/Screens/CarbornFootprint/CarbornFontPrintPages/house.dart';
import 'package:planet_b/Styles/colors.dart';

import '../../../Utils/app_route.dart';
import 'survery_controller.dart';

class Cooking extends StatefulWidget {
  const Cooking({Key? key}) : super(key: key);

  @override
  State<Cooking> createState() => _CookingState();
}

class _CookingState extends State<Cooking> {
  late bool isSelected = false;
  late bool isClicked = false;
  late bool isPicked = false;
  late bool isPick = false;

  @override
  Widget build(BuildContext context) {
    final sController = Get.put(CarbonSurveyController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text("Cooking",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColor.black)),
          const SizedBox(height: 58),
          const Image(image: AssetImage("assets/images/cooking.png")),
          const SizedBox(height: 40),
          Text(
            sController.questions[4]!.question,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16, color: AppColor.black),
          ),
          const SizedBox(height: 20),
          ...sController.questions[4]!.options.map((option) {
            return Obx(
              () => RadioListTile(
                activeColor: Colors.green,
                contentPadding: EdgeInsets.symmetric(horizontal: 50),
                value: option.value,
                groupValue: sController.cookingAnswer.value,
                onChanged: (val) {
                  sController.cookingAnswer(val);
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
  
    return  Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              " Cooking Food",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColor.black),
            ),
            const SizedBox(
              height: 58,
            ),
            const Image(image: AssetImage("assets/images/cooking.png")),
            const SizedBox(
              height: 57,
            ),
            Text(
              "What is your source of cooking?",
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
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(
                                () {
                              isPick = !isPick;
                            },
                          );
                        },
                        child: Icon(
                          isPick
                              ? Icons.check_circle_rounded
                              : Icons.circle_outlined,
                          color: isPick
                              ? AppColor.primaryColor
                              : Colors.black,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            "Gas",
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
                          color: isClicked
                              ? AppColor.primaryColor
                              : Colors.black,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            "Kerosene Stove",
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
                          color: isPicked
                              ? AppColor.primaryColor
                              : Colors.black,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            "Electric Cooker",
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
                              isSelected = !isSelected;
                            },
                          );
                        },
                        child: Icon(
                          isSelected
                              ? Icons.check_circle_rounded
                              : Icons.circle_outlined,
                          color: isSelected
                              ? AppColor.primaryColor
                              : Colors.black,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            "Firewood",
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
                ],
              ),
            ),
            const SizedBox(
              height: 130,
            ),


            Container(
              margin: EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                      decoration: BoxDecoration(

                          borderRadius: const BorderRadius.all(Radius.circular(100)),

                          border: Border.all(color: AppColor.lightSliver, width: 1)
                      ),
                      child: Image(
                        image: const AssetImage("assets/images/leading.png"), color: AppColor.lightSliver,
                      ),
                    ),
                  ),
                  Text(
                    "4/6",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColor.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      isSelected
                          ? nextPage(context, page: const House())
                          : null;
                    },
                    child: Container(

                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                      decoration: BoxDecoration(
                          color: isSelected ? AppColor.primaryColor: AppColor.platinum,

                          borderRadius: const BorderRadius.all(Radius.circular(100)),

                          border: Border.all(color: AppColor.lightSliver, width: 1)
                      ),
                      child: Image(
                        image: const AssetImage("assets/images/foward.png"), color: AppColor.lightSliver,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      
    );
  }
}
