import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:planet_b/SplashScreem.dart';
import 'package:provider/provider.dart';


import 'Provider/Authentication/auth_provider.dart';
import 'Provider/Authentication/change_password_provider.dart';
import 'Provider/Authentication/email_verification.dart';
import 'Provider/bottom_nav_provider.dart';

import 'Provider/database_provider.dart';
import 'Styles/colors.dart';


void main()  {
  runApp(const MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelProviders()),
        ChangeNotifierProvider(create: (_) => ChangePasswordProvider()),
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => EmailAndPhoneVerificationProvider()),

      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:  const SplashScreen(),
        theme: ThemeData(scaffoldBackgroundColor: AppColor.white, appBarTheme: AppBarTheme(backgroundColor: AppColor.white),fontFamily: 'Nunito'),
      ),

    );
  }
}


