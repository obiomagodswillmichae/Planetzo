import 'package:flutter/material.dart';
import 'package:planet_b/Provider/Authentication/auth_provider.dart';
import 'package:planet_b/Screens/CarbornFootprint/carborn_get_started.dart';
import 'package:planet_b/Utils/app_route.dart';
import 'package:planet_b/Utils/message.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../../Styles/colors.dart';
import '../../../Utils/page_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthenticationProvider>(context).currentUser;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(

        backgroundColor: AppColor.primaryColor,
          onPressed: () {
            nextPage(context, page: const CarbonfootprintPage());

          },
          icon: const Icon(Icons.restart_alt),
          label: Text("Start survey", style: PageService.whitelabelStyle,),

      ),
      appBar: AppBar(
        elevation: 0,

        title: Row(
          children: [
            Text(
              String.fromCharCode(0x1F60E),
              style: const TextStyle(fontSize: 28.0),
            ),
            const SizedBox(width: 8,),
            Text(
              'Hello ${user.firstName} ${user.lastName}',
              style: PageService.bigHeaderStyle,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      showDialog(context: context, builder: (context) =>  AlertDialog(
                        content: Text("Do You want to start your Carbon FootPrint Survey?", style: PageService.labelStyle,),
                        actions: [
                          Row(
                            children: [
                             TextButton(onPressed: (){
                               nextPage(context, page: const CarbonfootprintPage());

                             }, child: Text("Yes", style: PageService.bigHeaderStyle,)),
                             TextButton(onPressed: (){
                               Navigator.pop(context);
                             }, child: const Text("No", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red),)),
                            ],
                          )
                        ],
                      ),);

                    },
                    child: Container(

                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 19),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: AppColor.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset:
                                const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 42.32,
                          ),
                          const Image(
                              image: AssetImage("assets/images/foot.png")),
                          const SizedBox(
                            height: 37.68,
                          ),
                          Text(
                            "Carbon footprint",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: AppColor.black),
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(image: AssetImage("assets/images/fire.png")),
                              Image(image: AssetImage("assets/images/spoon.png")),
                              Image(image: AssetImage("assets/images/car.png")),
                              Image(image: AssetImage("assets/images/house.png")),
                            ],
                          ),
                          const SizedBox(
                            height: 43,
                          ),
                          const SizedBox(
                            height: 12,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 19),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                            child: Image(
                          image: AssetImage("assets/images/round_one.png"),
                        )),
                        const Positioned(
                            left: 270,
                            child: Image(
                              image: AssetImage("assets/images/round_two.png"),
                            )),
                        const Positioned(
                            left: 50,
                            top: 150,
                            child: Image(
                              image: AssetImage("assets/images/roun_three.png"),
                            )),
                        const Positioned(
                            left: 195,
                            top: 190,
                            child: Image(
                              image: AssetImage("assets/images/roun_four.png"),
                            )),
                        Column(
                          children: [
                            Text(
                              user.profile.carbonFootprint.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 38,
                                  color: AppColor.black),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Carbon footprint",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: AppColor.black),
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Image(
                                        image: AssetImage(
                                            "assets/images/walk.png")),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "${user.profile.steps.toInt()}",
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
                                        image: AssetImage(
                                            "assets/images/flower2.png")),
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
                                      height: 45,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/images/foot.png")),
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
                            const SizedBox(height: 10)
                          ],
                        ),

                      ],
                    ),
                  ),
                  PageService.textSpacexxL,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DashBoardPreview extends StatelessWidget {
  const DashBoardPreview({
    Key? key,
    this.title,
    this.image,
    this.desc,
    this.noOfPages = '2',
    this.onPressed,
    this.totalPoints = '',
  }) : super(key: key);

  final String? title;
  final Widget? image;
  final String? desc;
  final String? noOfPages;
  final VoidCallback? onPressed;
  final String totalPoints;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child:  Column(
                children: [
                  const Image(image: AssetImage("assets/images/flower.png")),
                  Text(
                    totalPoints,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: AppColor.black),
                  ),
                ],
              ),
            ),
            const Image(
              image: AssetImage(
                "assets/images/ozone.png",
              ),
              width: 100,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "Global warming",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        color: AppColor.black),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 45,
                    child: ReadMoreText(
                      desc ?? "Global warming is the sudden rise in temperature of ...",
                      trimLines: 3,
                      style:const TextStyle(
                          color: Colors.black,
                          fontSize: 13,height: 2),
                      colorClickableText: const Color(0xff006400),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'read more',
                      trimExpandedText: ' see less ',
                    ),
                  ),
                  const Spacer(),
                  Text('$noOfPages Slides')
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  children: [

                  ],
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
