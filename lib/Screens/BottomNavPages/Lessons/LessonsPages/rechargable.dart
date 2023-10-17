import 'package:flutter/material.dart';
import 'package:planet_b/Screens/BottomNavPages/Lessons/LessonsPages/eath.dart';

import '../../../../Styles/colors.dart';
import '../../../../Utils/app_route.dart';
import '../../../../Utils/page_service.dart';


class Rechargable extends StatelessWidget {
  const Rechargable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const Image(image: AssetImage("assets/images/lights.png")),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Use rechargeable energy",
                    textAlign: TextAlign.center,
                    style: PageService.headerStyle,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,),
                      child: Text(
                        "Much of our electricity and heat is powered by coal, oil and gas. Use less energy by lowering your heating and cooling, switching to LED light bulbs and energy-efficient electric appliances, washing your laundry with cold water or hanging things to dry instead of using a dryer.",

                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColor.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),

                  const SizedBox(height: 23,),
                  GestureDetector(
                    onTap: () {
                      // nextPage(context, page: const EathVegetable());
                      Navigator.pop(context);


                    },
                    child: Container(
                      margin:const  EdgeInsets.only(bottom: 40),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(19),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: AppColor.primaryColor, width: 1)),
                      child: Text(
                        "Log Habit",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
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
