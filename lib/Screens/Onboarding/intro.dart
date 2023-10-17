import 'package:flutter/material.dart';
import 'package:planet_b/Screens/Onboarding/page.dart';

import '../../Utils/app_route.dart';
import '../Authentication/create_account.dart';
import 'boarding_screen.dart';


class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final List<Pages> boardingPages = <Pages>[
    Pages(
      description:
      "Reduce your heating \n and cooling",
      imagePath: 'assets/images/earth.png',
    ),
    Pages(

      description: 'Drive less vehicles that \n use fossile fuel',
      imagePath: 'assets/images/ride.png',
    ),
    Pages(

      description: "Buy renewable energy  \n and burn less fire wood",
      imagePath: 'assets/images/invoation.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return OnBoardingPage(
      boardingPages,
      appName: '',
      skip: () {
        // nextPageAndRemovePrevious(context, page: const RegisterPage());
      },
      continueProcess: () {
        nextPageAndRemovePrevious(context, page: const CreateAccountPage ());
      },
    );
  }
}
