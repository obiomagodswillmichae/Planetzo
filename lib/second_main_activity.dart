import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:planet_b/Styles/colors.dart';

import 'Constants/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'Screens/BottomNavPages/Actions/ActionsPages/action_home.dart';
import 'Screens/BottomNavPages/Home/home.dart';
import 'Screens/BottomNavPages/Lessons/LessonsPages/lessons_home.dart';
import 'Screens/BottomNavPages/Profile/profile.dart';
import 'Screens/BottomNavPages/community/community.dart';

class SecondMainActivity extends StatefulWidget {
  const SecondMainActivity({Key? key}) : super(key: key);

  @override
  State<SecondMainActivity> createState() => _SecondMainActivityState();
}

class _SecondMainActivityState extends State<SecondMainActivity> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const HomePage(),
    ActionsPage(),
    const LessonsPage(),
    const CommunityPage(groupName: 'Community',),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
             showBlurBottomBar: false,
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: Colors.white,
              showLabel: true,
              notchColor: AppColor.primaryColor,
              removeMargins: false,
              /// restart app if you change removeMargins

              bottomBarWidth: 0,
              durationInMilliSeconds: 200,

              bottomBarItems: const [
                BottomBarItem(

                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.pending_actions,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.pending_actions,
                    color: Colors.white,
                  ),
                  itemLabel: 'Action',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.play_lesson,
                    color: Colors.blueGrey,

                  ),
                  activeItem: Icon(
                    Icons.play_lesson,
                    color: Colors.white,
                  ),
                  itemLabel: 'Lesson',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.groups_outlined,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.groups_outlined,
                    color: Colors.white,
                  ),
                  itemLabel: 'Community',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.white,

                  ),
                  itemLabel: 'Profile',
                ),
              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}
