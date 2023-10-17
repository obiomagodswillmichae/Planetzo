import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_b/Screens/BottomNavPages/Home/home.dart';
import 'package:planet_b/Screens/BottomNavPages/Lessons/LessonsPages/lessonData.dart';
import 'package:planet_b/Utils/app_route.dart';
import 'package:planet_b/Utils/page_service.dart';

import '../../../../Styles/colors.dart';
import '../../Actions/ActionsPages/global_warming.dart';
import '../../Actions/ActionsPages/second_global_warmimg.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Lessons',
          style: PageService.bigHeaderStyle,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
              child: Column(
                children: [
                  ...lessonData.map((lesson) {
                    log(lesson.toString());
                    return Column(
                      children: [
                        DashBoardPreview(
                          title: lesson[0]['title'] as String,
                          desc: lesson[0]['desc'] as String,
                          noOfPages: lesson.length.toString(),
                          totalPoints:
                              lesson[lesson.length - 1]['point'].toString(),
                          onPressed: () =>
                              Get.to(GlobalWarmingPage(slides: lesson)),
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
