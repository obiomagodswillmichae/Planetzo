import 'package:flutter/material.dart';
import 'package:planet_b/Screens/BottomNavPages/Lessons/LessonsPages/completion.dart';
import 'package:planet_b/Utils/app_route.dart';
import 'package:planet_b/Utils/page_service.dart';

import '../../../../Styles/colors.dart';

class EathVegetable extends StatelessWidget {
  const EathVegetable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

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
                  const Image(image: AssetImage("assets/images/veg.png")),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Eat more vegetables",
                    textAlign: TextAlign.center,
                    style: PageService.bigHeaderStyle,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Eating more vegetables, fruits, whole grains, legumes, nuts and seeds, and less meat and dairy, can significantly lower your environmental impact. Producing plant-based foods generally results in fewer greenhouse gas emissions and requires less energy, land and water.",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColor.black),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 23,
                  ),
                  GestureDetector(
                    onTap: () {
                      // nextPage(context, page: const ActionCompletion());
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
