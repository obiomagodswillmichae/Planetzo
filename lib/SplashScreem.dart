import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planet_b/Provider/Authentication/auth_provider.dart';
import 'package:planet_b/Screens/Authentication/email_login.dart';
import 'package:planet_b/main_activity.dart';
import 'package:planet_b/second_main_activity.dart';
import 'package:provider/provider.dart';

import 'Screens/Onboarding/intro.dart';
import 'Styles/colors.dart';
import 'Utils/app_route.dart';
import 'Utils/page_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initDependencies();
  }

  Future<void> initDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    // await Provider.of<AuthenticationProvider>(context, listen: false).setCurrentUser();
    // FirebaseFirestore.instance.collection('User').add({'hello': 'mememe'});

    if(FirebaseAuth.instance.currentUser != null){
      await Provider.of<AuthenticationProvider>(context, listen: false).setCurrentUser();
    }
    // FirebaseFirestore.instance.collection('User').add({'hello': 'mememe'});
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Expanded(child: Image(image: AssetImage("assets/images/logo.png"), color: AppColor.primaryColor,)),

              Align(

                child: Text("PlanetZo", style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: AppColor.primaryColor)),),
              
            ],
          ),
        ),
      ),
    );
  }

  void navigate() async {
    final user = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(seconds: 2));
    if (user != null) {
      nextPageAndRemovePrevious(context, page: SecondMainActivity());
      return;
    }
    nextPageAndRemovePrevious(context, page: LoginPage());
  }
}
