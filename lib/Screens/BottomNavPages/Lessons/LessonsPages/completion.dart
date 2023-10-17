import 'package:flutter/material.dart';
import 'package:planet_b/Screens/BottomNavPages/Home/home.dart';
import 'package:planet_b/Utils/app_route.dart';

import '../../../../Styles/colors.dart';

class ActionCompletion extends StatefulWidget {
  const ActionCompletion({Key? key}) : super(key: key);

  @override
  State<ActionCompletion> createState() => _ActionCompletionState();
}

class _ActionCompletionState extends State<ActionCompletion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Done",
          style: TextStyle(
              fontWeight: FontWeight.w800, color: AppColor.black, fontSize: 24),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 49),
              child: Column(
                children: [
                  const Image(image: AssetImage("assets/images/smallbike.png")),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Drive less fossil fuel vehicle",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColor.black,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your Impact",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Image(
                                    image:
                                        AssetImage("assets/images/crap.png")),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "0.4 Kg CO2 Saved",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 8,
                                      color: AppColor.black),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 26,
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      border: Border.all(
                                          color: AppColor.lightSliver,
                                          width: 1)),
                                  child: Column(
                                    children: const [
                                      Image(
                                        image: AssetImage(
                                            "assets/images/flower.png"),
                                        width: 20,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "Points for action 26",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 8,
                                      color: AppColor.black),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 56,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: AppColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          alignment: Alignment.center,
                          child: Container(
                              margin:
                                  const EdgeInsets.only(top: 24, bottom: 100),
                              child: const Image(
                                  image: AssetImage("assets/images/co2.png"))),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  GestureDetector(
                    onTap: () {
                     Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(19),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              color: AppColor.primaryColor, width: 1)),
                      child: Text(
                        "Share",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                            color: AppColor.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
