import 'package:flutter/material.dart';
import 'package:planet_b/main_activity.dart';

import '../../Styles/colors.dart';
import '../../Utils/app_route.dart';
import '../../Utils/page_service.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/socail_button.dart';
import 'create_account.dart';
import 'email_login.dart';
import 'phone_signup.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  ///Controllers
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,

        elevation: 0,
        title: Text(
          "Sign up",
          style: PageService.bigHeaderStyle,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 90),
              child: Column(
                children: [
                  SocialButton(
                    onTap: () {
                      nextPage(context, page: const MainActivityPage());
                    },
                    text: 'Sign up with Google',
                    bgColor: AppColor.platinum,
                    textColor: Colors.black,
                    icon: const Image(
                      image: AssetImage("assets/images/google.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  SocialButton(
                    onTap: () {
                      nextPage(context, page: const PhoneSignUp());
                    },
                    text: 'Sign up with Phone Number',
                    bgColor: AppColor.platinum,
                    textColor: Colors.black,
                    icon: const Image(
                      width: 30,
                      image: AssetImage("assets/images/phone.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  const Divider(
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Text(
                    'Or sign up with',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  customButton(
                    text: 'Email and Password',
                    onTap: () {
                      // nextPage(context, page: const CreateAccountPage());
                      nextPage(context, page: const CreateAccountPage());
                    },
                    context,
                    bgColor: AppColor.primaryColor,
                    textColor: AppColor.white,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  customButton(
                    text: 'Login Instead',
                    onTap: () {
                      // nextPage(context, page: const CreateAccountPage());
                      nextPage(context, page: const LoginPage());
                    },
                    context,
                    bgColor: AppColor.primaryColor,
                    textColor: AppColor.white,
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
