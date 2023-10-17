import 'package:flutter/material.dart';
import 'package:planet_b/Screens/CarbornFootprint/CarbornFontPrintPages/carbon_survey_page.dart';
import 'package:planet_b/Utils/app_route.dart';
import '../../../Styles/colors.dart';
import '../../Utils/page_service.dart';

class CarbonfootprintPage extends StatefulWidget {
  const CarbonfootprintPage({Key? key}) : super(key: key);

  @override
  State<CarbonfootprintPage> createState() => _CarbonfootprintPageState();
}

class _CarbonfootprintPageState extends State<CarbonfootprintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(

        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          nextPage(context, page: const CarbonSurveryPage());

        },
        icon: const Icon(Icons.restart_alt),
        label: Text("Start survey", style: PageService.whitelabelStyle,),

      ),

      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leading: BackButton(color: AppColor.black,),
        title: Text(
          "Carbon footprint",
          style: PageService.bigHeaderStyle,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding:
                  const EdgeInsets.symmetric(horizontal: 26, vertical: 200),
              child: Column(
                children: [
                  Text(
                    "Take a survey to know your \n carbon footprint.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColor.black),
                  ),

                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    String.fromCharCode(0x1F609),
                    style: const TextStyle(fontSize: 58.0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
