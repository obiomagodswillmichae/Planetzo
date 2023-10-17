import 'package:flutter/material.dart';
import 'package:planet_b/Screens/Authentication/create_account.dart';
import 'package:planet_b/Screens/Authentication/forgot_password.dart';
import 'package:planet_b/Services/auth_service.dart';
import 'package:planet_b/Utils/app_route.dart';
import 'package:planet_b/Utils/message.dart';
import 'package:planet_b/Utils/validator.dart';
import 'package:planet_b/Widgets/custom_text_form_field.dart';
import 'package:planet_b/second_main_activity.dart';
import 'package:provider/provider.dart';
import 'package:planet_b/Utils/busy_overlay.dart'; // Import the busy overlay
import '../../Provider/Authentication/auth_provider.dart';
import '../../Styles/colors.dart';
import '../../Utils/page_service.dart';
import '../../Widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _Password = TextEditingController();
  GlobalKey<FormState> loginK = GlobalKey();

  bool isBusy = false;

  @override
  Widget build(BuildContext context) {
    return BusyOverlay(

      show: isBusy,
      title: 'Loading...',
      child: Scaffold(
        appBar: AppBar(

          elevation: 0,
          title: Text(
            "Login",
            style: PageService.bigHeaderStyle,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                child: Form(
                  key: loginK,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        labelText: 'Email',
                        controller: _email,
                        validator: Validator.validateEmail,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        labelText: 'Password',
                        controller: _Password,
                        validator: Validator.validatePassword,
                        obscureTextWithToggle: true,
                      ),
                      const SizedBox(height: 9),
                      GestureDetector(
                        onTap: () {
                          nextPage(context, page: const ForgotPasswordPage());
                        },
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColor.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      customButton(
                        text: 'Next',
                        onTap: _handleLogin,
                        context,
                        bgColor: AppColor.primaryColor,
                        textColor: AppColor.white,
                        isLoading: isBusy,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      GestureDetector(
                        onTap: () {
                          nextPage(context, page: const CreateAccountPage());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                  children: [
                                    TextSpan(
                                        text: 'Don’t have an account? ',
                                        style: TextStyle(
                                            color: AppColor.quickSilver)),
                                    TextSpan(
                                        text: 'Create Account',
                                        style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ])),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleLogin() async {
    if (!loginK.currentState!.validate()) {
      return;
    }
    setState(() => isBusy = true); // Show the busy overlay

    final resp = await FAuth.logInWithEmailAndPassword(
        email: _email.text..trim(), password: _Password.text.trim());

    if (!resp.isSuccess) {
      setState(() => isBusy = false);
      error(context, message: 'An Error Occurred $resp.message');
      return;
    }
    success(context, message: 'Login Was successfully');
    await Provider.of<AuthenticationProvider>(context, listen: false)
        .setCurrentUser();
    nextPage(context,
        page: SecondMainActivity());
    setState(() => isBusy = false);

    setState(() => isBusy = false); // Hide the busy overlay
  }
}
