import 'package:flutter/material.dart';
import 'package:planet_b/Provider/bottom_nav_provider.dart';
import 'package:planet_b/Screens/BottomNavPages/Home/home.dart';
import 'package:planet_b/Styles/colors.dart';

import 'package:provider/provider.dart';

import 'Screens/BottomNavPages/Actions/ActionsPages/action_home.dart';
import 'Screens/BottomNavPages/Actions/alarm.dart';
import 'Screens/BottomNavPages/Lessons/LessonsPages/lessons_home.dart';
import 'Screens/BottomNavPages/Profile/profile.dart';
import 'Screens/BottomNavPages/community/community.dart';

class MainActivityPage extends StatefulWidget {
  const MainActivityPage({Key? key, this.page}) : super(key: key);
  final int? page;

  @override
  State<MainActivityPage> createState() => _MainActivityPageState();
}

class _MainActivityPageState extends State<MainActivityPage> {
  ///bottom nav items
  List<Map>? bottomNavItems = [
    {'title': 'Home', 'icon': 'assets/images/Home.png'},
    {'title': "Actions", 'icon': 'assets/images/Alarm.png'},
    {'title': "Lessons", 'icon': 'assets/images/Tuition.png'},
    {'title': "Community", 'icon':'assets/images/com.png'},
    {'title': "Profile", 'icon': 'assets/images/User.png'},

  ];

  ///bottom nav pages
  List<Widget> bottomNavPages = [
    const HomePage(),
     ActionsPage(),
    const LessonsPage(),
     CommunityPage(groupName: 'Community',),
    const ProfilePage(),
  ];
  late int initialPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialPage = widget.page ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavPages[initialPage],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColor.darkJungleGreen,
          onTap: (value) {
            setState(() {
              initialPage = value;
            });
          },
          currentIndex: initialPage,
          items: List.generate(bottomNavItems!.length, (index) {
            final data = bottomNavItems![index];

            return BottomNavigationBarItem(
            
                tooltip: data['title'],
              
                icon: Image.asset(
                  data['icon'],
                  width: 20,
                  color: initialPage == index
                      ? AppColor.primaryColor
                      : AppColor.black,
                ),
                label: data['title'],
                backgroundColor: AppColor.primaryColor);
          })),
    );
  }
}
