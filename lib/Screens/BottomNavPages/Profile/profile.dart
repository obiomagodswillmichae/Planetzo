import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:planet_b/Screens/Authentication/email_login.dart';
import 'package:planet_b/Screens/BottomNavPages/Actions/ActionsPages/action_home.dart';
import 'package:planet_b/Utils/app_route.dart';
import 'package:planet_b/Utils/message.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Authentication/auth_provider.dart';
import '../../../Provider/bottom_nav_provider.dart';
import '../../../Services/auth_service.dart';
import '../../../SplashScreem.dart';
import '../../../Styles/colors.dart';
import '../../../Utils/page_service.dart';
import '../../../Widgets/custom_button.dart';
import '../../CarbornFootprint/carborn_get_started.dart';
import '../Actions/tips_screen.dart';

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
              'Hello ${user.userName} ',
              style: PageService.bigHeaderStyle,
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

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
                    ),
                    GestureDetector(
                      onTap: () {
                        nextPage(context, page: CarbonFootprintTipsScreen());
                      },
                      child: Card(

                        elevation: 5,
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    5, 0, 10, 0),
                                child: Icon(
                                  MdiIcons.information,
                                  color: AppColor.primaryColor,
                                  size: 30,
                                )),
                            const SizedBox(
                              height: 60,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, 0, 0, 3),
                                      child: Text(
                                        'Manage carbon footprint',
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 12),
                                      )),
                                  SizedBox(
                                      child: Text(
                                        'Get to know tips carbon footprint',
                                        style: TextStyle(fontSize: 10),
                                      )),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              MdiIcons.chevronRight,
                              color: AppColor.gray,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        nextPage(context, page: ActionsPage());

                      },
                      child: Card(

                        elevation: 5,
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    5, 0, 10, 0),
                                child: Icon(
                                  MdiIcons.responsive,
                                  color: AppColor.primaryColor,
                                  size: 30,
                                )),
                            const SizedBox(
                              height: 60,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, 0, 0, 3),
                                      child: Text(
                                        'Take Action',
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 12),
                                      )),
                                  SizedBox(
                                      child: Text(
                                        'Take Actions today',
                                        style: TextStyle(fontSize: 10),
                                      )),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              MdiIcons.chevronRight,
                              color: AppColor.gray,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(context: context, builder: (context) => AlertDialog(
                          title: Text("Coming Soon", style: PageService.bigHeaderStyle,),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.pop(context);
                            }, child: Text("Ok", style: PageService.bigHeaderStyle,))
                          ],
                        ),);
                      },
                      child: Card(

                        elevation: 5,
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    5, 0, 10, 0),
                                child: Icon(
                                  MdiIcons.share,
                                  color: AppColor.primaryColor,
                                  size: 30,
                                )),
                            const SizedBox(
                              height: 60,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, 0, 0, 3),
                                      child: Text(
                                        'Share to friends',
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 12),
                                      )),
                                  SizedBox(
                                      child: Text(
                                        'Modify your profile details',
                                        style: TextStyle(fontSize: 10),
                                      )),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              MdiIcons.chevronRight,
                              color: AppColor.gray,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  AlertDialog(
                                    title: Container(
                                      decoration:
                                      const BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(
                                              Radius
                                                  .circular(
                                                  16))),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Text(
                                              "Log out",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w600,
                                                  fontSize: 15,
                                                  color: Colors.red),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                              "Are you sure you want to Log out?",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w600,
                                                  fontSize: 14,
                                                  color: AppColor
                                                      .black)),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Expanded(
                                                child: customButton(
                                                  context,
                                                  bgColor: Colors.red,
                                                  textColor:
                                                  AppColor.white,
                                                  onTap: () {
                                                    print('done');
                                                    FAuth().clearFirebaseCache().then((value) {Provider.of<ModelProviders>(context, listen: false,).changeCounter(0);
                                                          nextPageAndRemovePrevious(context, page: const SplashScreen());
                                                        });

                                                  },
                                                  text: 'Log out',
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                  child:
                                                  customButton(
                                                    context,
                                                    bgColor: AppColor
                                                        .primaryColor,
                                                    textColor:
                                                    AppColor.white,
                                                    onTap: () {
                                                      Navigator.pop(
                                                          context);
                                                    },
                                                    text: 'Close',
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Card(
                        margin: const EdgeInsets.fromLTRB(
                            10, 0, 10, 10),
                        elevation: 5,
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    5, 0, 10, 0),
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                  size: 30,
                                )),
                            SizedBox(
                              height: 60,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, 0, 0, 3),
                                      child: Text(
                                        'Sign Out',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                230, 249, 145, 144),
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 12),
                                      ))
                                ],
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              MdiIcons.chevronRight,
                              color: AppColor.gray,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
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


}

