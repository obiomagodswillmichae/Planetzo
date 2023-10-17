import 'package:flutter/material.dart';
import 'package:planet_b/Screens/Onboarding/page.dart';

import '../../Styles/colors.dart';
import '../../Widgets/custom_button.dart';


class OnBoardingPage extends StatefulWidget {
  final List<Pages> boardingPages;
  final String? appName;

  final VoidCallback? continueProcess;
  final VoidCallback? skip;

  ///On Boarding constructor
  OnBoardingPage(this.boardingPages,
      {this.appName = '', this.skip, this.continueProcess});
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  List<int> selectedIndex = [0];
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,

      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: PageView(
                onPageChanged: (int value) {
                  if (selectedIndex.contains(value)) {
                    selectedIndex.remove(value);
                  } else {
                    selectedIndex.add(value);
                  }
                  setState(() {
                    currentIndex = value;
                  });
                },
                controller: controller,
                children: widget.boardingPages,
              ),
            ),

            //indicator



            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: customButton(
                context,
                onTap: () {
                  if ((currentIndex + 1) == widget.boardingPages.length) {
                    ///Go to login page
                    widget.continueProcess!.call();
                  } else {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  }
                },
                text: (currentIndex + 1) == widget.boardingPages.length
                    ? "NEXT"
                    : "NEXT",
                textColor: AppColor.white,
                bgColor: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
