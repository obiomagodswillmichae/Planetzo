import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_b/Screens/CarbornFootprint/completed.dart';
import 'package:planet_b/Styles/colors.dart';

import '../../../Utils/app_route.dart';
import 'survery_controller.dart';

class House extends StatefulWidget {
  const House({Key? key}) : super(key: key);

  @override
  State<House> createState() => _HouseState();
}

class _HouseState extends State<House> {
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
          Text("Home",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColor.black)),
          const SizedBox(height: 58),
          const Image(image: AssetImage("assets/images/house.png")),
          const SizedBox(height: 40),
          Text(
            sController.questions[5]!.question,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16, color: AppColor.black),
          ),
          const SizedBox(height: 20),
          ...sController.questions[5]!.options.map((option) {
            return Obx(
              () => RadioListTile(
                activeColor: Colors.green,
                contentPadding: EdgeInsets.symmetric(horizontal: 50),
                value: option.value,
                groupValue: sController.homeAnswer.value,
                onChanged: (val) {
                  sController.homeAnswer(val);
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
   CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Home",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColor.black),
                  ),
                  const SizedBox(
                    height: 58,
                  ),
                  const Image(image: AssetImage("assets/images/house.png"),),
                  const SizedBox(
                    height: 57,
                  ),
                  Text(
                    "How many people live in your house hold?",
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
                                  "5 - 10",
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
                                  "10 - 20",
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
                                  "Above",
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
                    height: 178,
                  ),


                  Container(
                    margin: const EdgeInsets.only(top: 40),
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
                          "6/6",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColor.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            isSelected
                                ? nextPage(context, page: const CompletedCarbonfootprintPage())
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
            ),
          )
        ],
      
    );
  }
}
