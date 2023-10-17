import 'package:flutter/material.dart';
import 'package:planet_b/Utils/page_service.dart';

import '../../../../Styles/colors.dart';



class FristActionsPage extends StatelessWidget {
  const FristActionsPage({Key? key}) : super(key: key);

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
                  const Image(image: AssetImage("assets/images/smallbike.png")),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Drive less fossil  fuel vehicle",
                    textAlign: TextAlign.center,
                    style: PageService.headerStyle,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "The world’s roads are clogged with vehicles, most of them burning diesel or petrol. Walking or riding a bike instead of driving will reduce greenhouse gas emissions – and help your health and fitness. For longer distances, consider taking a train or bus. And carpool whenever possible.",

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
                      Navigator.pop(context);
                    },
                    child: Container(
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