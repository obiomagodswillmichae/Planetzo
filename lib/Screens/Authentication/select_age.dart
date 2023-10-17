import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_b/Utils/db_constants.dart';
import 'package:planet_b/Utils/page_service.dart';
import 'package:planet_b/Widgets/custom_button.dart';
import 'package:planet_b/second_main_activity.dart';

import '../../Styles/colors.dart';

class SelectAgePage extends StatefulWidget {
  const SelectAgePage({Key? key}) : super(key: key);

  @override
  State<SelectAgePage> createState() => _SelectAgePageState();
}

class _SelectAgePageState extends State<SelectAgePage> {

  late bool isSelected = false;
  bool? isAbove18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,

        title: Text(
          "Select your age",
          style: PageService.bigHeaderStyle,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Center(
                child: Column(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                isAbove18 = true;
                              },
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(19),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: isAbove18 != null
                                    ? isAbove18!
                                        ? Colors.green.shade300
                                        : Colors.green.shade100
                                    : Colors.green.shade100,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                    color: isSelected
                                        ? Colors.grey.shade900
                                        : AppColor.primaryColor,
                                    width: 1)),
                            child: Text(
                              "Are you 18 years and above ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColor.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                isAbove18 = false;
                              },
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(19),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: isAbove18 != null
                                    ? !isAbove18!
                                        ? Colors.green.shade300
                                        : Colors.green.shade100
                                    : Colors.green.shade100,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color: isSelected
                                        ? Colors.grey.shade900
                                        : AppColor.primaryColor,
                                    width: 1)),
                            child: Text(
                              "Are you below 18 years ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColor.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 200),
                    customButton(context,
                        onTap: isAbove18 != null ? _handleSelectAge : () {},
                        text: 'Next',
                        textColor: isSelected ? AppColor.white : AppColor.black,
                        bgColor: isAbove18 != null
                            ? AppColor.primaryColor
                            : Colors.grey)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _handleSelectAge() async {
    final user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection(DbConstants.userPath)
        .doc(user!.uid)
        .update({
      DbConstants.isAbove18: isAbove18,
    });
    Get.to(() => const SecondMainActivity());
  }
}
