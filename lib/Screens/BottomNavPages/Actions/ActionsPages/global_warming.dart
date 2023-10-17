import 'dart:async';
import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_b/Models/app_user.dart';
import 'package:planet_b/Services/db_service.dart';
import 'package:planet_b/Utils/message.dart';
import 'package:planet_b/Widgets/custom_button.dart';
import 'package:planet_b/second_main_activity.dart';
import 'package:provider/provider.dart';

import '../../../../Provider/Authentication/auth_provider.dart';
import '../../../../Styles/colors.dart';
import '../../../../Utils/app_route.dart';
import '../../../../main_activity.dart';

class GlobalWarmingPage extends StatefulWidget {
  const GlobalWarmingPage({Key? key, required this.slides}) : super(key: key);
  final List<Map<String, dynamic>> slides;

  @override
  State<GlobalWarmingPage> createState() => _GlobalWarmingPageState();
}


class _GlobalWarmingPageState extends State<GlobalWarmingPage> {
  double currPosition = 0;
  int padding = 20;
  int totalPooints = 0;
  PageController controller = PageController();

  int time = 0;
  startTimer({int times = 3}) {
    time = times;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time == 0) {
        timer.cancel();
      } else {
        time--;
        log(time.toString());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer(times: 5);
  }

  @override
  Widget build(BuildContext context) {
    
    final indWidth = MediaQuery.of(context).size.width;
    final width =
        (indWidth - (2 * padding) - (5 * 2 * (widget.slides.length))) / widget.slides.length;
    log(width.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DotsIndicator(
                position: currPosition,
                dotsCount: widget.slides.length,
                decorator: DotsDecorator(
                  spacing: const EdgeInsets.symmetric(horizontal: 5),
                  // color: AppColor.primaryColor,
                  activeColor: AppColor.primaryColor,
                  size: Size(width, 6),
                  activeSize: Size(width, 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Climate Action",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                    color: AppColor.black),
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: PageView.builder(
                  controller: controller,
                  allowImplicitScrolling: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.slides.length,
                  onPageChanged: (val) => setState(() {
                        currPosition = val.toDouble();
                      }),
                  itemBuilder: (_, ind) {
                    return LessonItemDetail(
                      title: widget.slides[ind]['title'].toString(),
                      text: widget.slides[ind]['desc'].toString(),
                      point: widget.slides[ind]['point'] as int,
                      icon: widget.slides[ind]['img'] as String?,
                      islast: widget.slides.last == widget.slides[ind],
                      onPressed: () {
                        log(widget.slides[ind]['point'].toString());
                        if (time != 0) {
                          error(context, message: 'Read the slide Please read to slide this current proceed to the next');
                          return;
                        }
                        controller.nextPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeIn);
                        startTimer(
                            times: (((widget.slides[ind]['point'] as int) / 10) * 10)
                                .toInt());
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonItemDetail extends StatefulWidget {
  const LessonItemDetail({
    Key? key,
    required this.title,
    this.icon,
    required this.text,
    required this.point,
    required this.onPressed,
    this.islast = false,
  }) : super(key: key);

  final String title;
  final String? icon;
  final String text;
  final int point;
  final VoidCallback onPressed;
  final bool islast;

  @override
  State<LessonItemDetail> createState() => _LessonItemDetailState();
}

class _LessonItemDetailState extends State<LessonItemDetail> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: AppColor.black),
            ),
          ),
          // CustomTextField(_controller)
          const SizedBox(
            height: 14,
          ),
          Container(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage(widget.icon ?? 'assets/images/earth.png'),
              width: 150,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const SizedBox(
            height: 30,
          ),
          if (!widget.islast)
            Container(
              alignment: Alignment.center,
              child: Text(
                widget.text,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColor.black),
              ),
            ),
          const SizedBox(
            height: 57,
          ),
          if (widget.islast)
            Column(
              children: [
                const Text(
                  'Episode Completed',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
                const SizedBox(height: 35),
                const Text('You Have gained'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.point}',
                      style:
                          const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 40,
                      width: 40,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/flower2.png"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                customButton(
                  context,
                  onTap: () => _addClimateaAction(widget.point),
                  text: 'Accept Reward',
                  textColor: AppColor.white,
                  bgColor: AppColor.primaryColor,
                  isLoading: isLoading,
                  loadingColor: Colors.black,
                )
              ],
            ),

          if (!widget.islast)
            GestureDetector(
              onTap: widget.onPressed,
              child: Container(
                margin: const EdgeInsets.only(bottom: 40),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(19),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Text(
                      "Points for completion of this Episode",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          color: AppColor.white),
                    ),
                    const SizedBox(
                      width: 29,
                    ),
                    Text(
                      '${widget.point}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: AppColor.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Image(image: AssetImage("assets/images/flower.png")),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _addClimateaAction(int point) async {
    setState(() => isLoading = true);
    final profile = UserProfile(climateAction: point.toDouble());
    final resp = await FDatabase.addUserProfile(profile, true);
    if (!resp.isSuccess) {
     error(context, message: 'An Error Occurred, $resp.message');
      return;
    }
    await Provider.of<AuthenticationProvider>(context, listen: false)
        .setCurrentUser();
    setState(() => isLoading = false);
    success(context, message:' Success You have gained $point Climate action points');
    await Future.delayed(const Duration(seconds: 5));
    nextPageAndRemovePrevious(context, page: SecondMainActivity());
  }
}
