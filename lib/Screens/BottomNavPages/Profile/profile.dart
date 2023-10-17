import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planet_b/Screens/Authentication/email_login.dart';
import 'package:planet_b/Services/auth_service.dart';
import 'package:planet_b/SplashScreem.dart';
import 'package:planet_b/Utils/app_route.dart';
import 'package:planet_b/main_activity.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Authentication/auth_provider.dart';
import '../../../Provider/database_provider.dart';
import '../../../Styles/colors.dart';
import '../../../Utils/page_service.dart';
import '../../CarbornFootprint/carborn_get_started.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthenticationProvider>(context).currentUser;
    final maxWith = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Text(
              String.fromCharCode(0x1F60E),
              style: TextStyle(fontSize: 28.0),
            ),
            const SizedBox(width: 8,),
            Text(
              'Hello ${user.firstName} ${user.lastName}',
              style: PageService.bigHeaderStyle,
            ),
          ],
        ),
        actions:  [
          GestureDetector(
            onTap: () {
              signOutAndCloseApp(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.logout, color: Colors.red,),
            ),
          )
        ],

      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Image(
                            image: AssetImage("assets/images/walk.png")),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "${user.profile.steps}",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: AppColor.primaryColor),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Steps",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color: AppColor.black),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Image(
                            image: AssetImage("assets/images/flower2.png")),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "${user.profile.climateAction.toInt()}",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: AppColor.primaryColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Climate Actions",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color: AppColor.black),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 35,
                          child: Image(
                              image: AssetImage("assets/images/foot.png")),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${user.profile.carbonFootprint}",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: AppColor.primaryColor),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Carbon Footprint",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color: AppColor.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Carbon emissions",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: AppColor.black,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1,
                  color: AppColor.lightSliver,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Image(
                            image:
                                AssetImage("assets/images/small_circle.png")),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Transport",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColor.black,
                              fontSize: 10),
                        ),
                      ],
                    ),
                    Text(
                      "${user.profile.transport}",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColor.black,
                          fontSize: 16),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: AppColor.lightSliver,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: const AssetImage(
                              "assets/images/small_circle.png"),
                          color: AppColor.purple,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Energy Consumption",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColor.black,
                              fontSize: 10),
                        ),
                      ],
                    ),
                    Text(
                      "${user.profile.home}",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColor.black,
                          fontSize: 16),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: AppColor.lightSliver,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: const AssetImage(
                              "assets/images/small_circle.png"),
                          color: AppColor.Coquelicot,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Diet and Food Choices",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColor.black,
                              fontSize: 10),
                        ),
                      ],
                    ),
                    Text(
                      "${user.profile.food}",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColor.black,
                          fontSize: 16),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: AppColor.lightSliver,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: const AssetImage(
                              "assets/images/small_circle.png"),
                          color: AppColor.blue,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Awareness and Advocacy",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColor.black,
                              fontSize: 10),
                        ),
                      ],
                    ),
                    Text(
                      "${user.profile.bushBurning}",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColor.black,
                          fontSize: 16),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: AppColor.lightSliver,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Column _buildNormalProfile(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Image(image: AssetImage("assets/images/output.png")),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              // log(user.profile.climateAction.toString());
              nextPage(context, page: const CarbonfootprintPage());
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 40),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(19),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColor.primaryColor, width: 1)),
              child: Text(
                "Start Survery",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                    color: AppColor.black),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Center _buildRingProfile(double maxWith) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: maxWith * 0.6,
        height: maxWith * 0.6,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 3,
            color: Colors.green,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: maxWith * 0.5,
          height: maxWith * 0.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 3,
              color: Colors.red,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: maxWith * 0.6,
            height: maxWith * 0.6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: Colors.blue,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(30),
              width: maxWith * 0.6,
              height: maxWith * 0.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: Colors.purple,
                ),
              ),
              child: Image(image: AssetImage("assets/images/output.png")),
            ),
          ),
        ),
      ),
    );
  }
  void signOutAndCloseApp(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Close the app
      nextPageAndRemovePrevious(context,  page: LoginPage());
    } catch (e) {
      // Handle any errors that occur during sign-out
      print("Error while signing out: $e");
    }
  }
}

