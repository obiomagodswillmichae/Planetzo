// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:planet_b/Models/app_user.dart';
import 'package:planet_b/Provider/database_provider.dart';
import 'package:planet_b/Utils/db_constants.dart';

import '../../Constants/constant.dart';
import '../../Screens/Authentication/otp.dart';
import '../../Screens/Authentication/reset_password.dart';
import '../../Utils/app_route.dart';
import '../../main_activity.dart';

class AuthenticationProvider extends ChangeNotifier {
  AppUser? _currentUser;

  AppUser get currentUser => _currentUser as AppUser;
  Future setCurrentUser() async {
    final user = await FirebaseFirestore.instance
        .collection(DbConstants.userPath)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    _currentUser = AppUser.fromJson(user.data() as Map<String, dynamic>);
    notifyListeners();
    log(_currentUser!.firstName);
    log(_currentUser!.lastName);
    log(_currentUser!.email);
  }

  ///Base url
  final requestBaseUrl = AppStrings.baseUrl;

  ///
  bool _isLoading = false;
  String _resMessage = "";

  ///Field Getters
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  ///Registeration :
  void registerUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    ///Authentication url
    String _url = "$requestBaseUrl/auth/register";

    final body = {
      "email": email,
      "password": password,
    };

    print(body);

    try {
      http.Response res = await http.post(
        Uri.parse(_url),
        body: body,
      );

      print(res.statusCode);

      if (res.statusCode == 200 || res.statusCode == 201) {
        // final req = json.decode(res.body);
        log(res.body);

        DatabaseProvider().saveEmail(email: email);

        _isLoading = false;
        _resMessage = "Account created`";
        notifyListeners();

        // nextPage(context!, page: const OtpPage(path: "email"));
      } else {
        ///Request was not successful
        ///print error

        final data = res.body;
        log(data);

        _resMessage = json.decode(data)["message"];
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Please connect to an active internet";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();

      print(":::: $e");
    }
  }

  ///Login User
  void loginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    ///Login url
    String _url = "$requestBaseUrl/auth/login";

    final body = {"email": email, "password": password};

    try {
      http.Response res = await http.post(
        Uri.parse(_url),
        body: body,
      );
//ssssddd
      print(res.statusCode);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final req = json.decode(res.body)["data"];
        print(req);

        final userId = req["user"]["user_id"];
        final token = req["refresh"];
        final email = req["user"]["email"];

        DatabaseProvider().saveToken(token: token);
        DatabaseProvider().saveEmail(email: email);
        DatabaseProvider().saveUserId(id: userId);

        _isLoading = false;
        _resMessage = "Login was successful`";
        notifyListeners();

        nextPageOnly(context!, page: const MainActivityPage());
      } else {
        ///Request was not successful
        ///print error
        String req = res.body;
        Map errorBody = json.decode(req);

        print(errorBody);

        _isLoading = false;

        _resMessage = errorBody['message'];

        log("hello worldld");

        if (_resMessage == "Account not activated, Please verify your email") {
          DatabaseProvider().saveEmail(email: email);
          // nextPage(context!, page: const OtpPage(path: "email"));
        }

        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Please connect to an active internet";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
      print("Error :::::::::::: $e");
    }
  }

  ///Forgot password
  void forgotPassword({
    required String email,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    ///Forgot password url
    String _url = "$requestBaseUrl/auth/forgot-password";

    final body = {"email": email};

    print(body);

    try {
      http.Response res = await http.post(Uri.parse(_url), body: body);

      print(res.statusCode);
      if (res.statusCode == 200) {
        String req = res.body;
        final successBody = json.decode(req);

        ///Resquest was successfully

        print(successBody);
        _isLoading = false;
        _resMessage = successBody['message'] + '`';
        notifyListeners();

        DatabaseProvider().saveEmail(email: email);

        nextPage(context!, page: const ResetPasswordPage());
      } else {
        ///Request was not successful
        ///print error
        String req = res.body;
        final errorBody = json.decode(req);
        print(_url);
        print(errorBody);
        _isLoading = false;
        _resMessage = errorBody["message"];
        notifyListeners();

        DatabaseProvider().saveEmail(email: email);

        if (errorBody["message"].toString().contains("Email not verified")) {
          // nextPage(context!, page: const OtpPage(path: "reset"));
        }
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Please connect to an active internet";
      notifyListeners();
    } catch (e) {
      // print(e);
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
    }
  }

  ///New password
  void newPassword({
    required String email,
    required String code,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    ///Get new password url
    String url = "$requestBaseUrl/auth/reset-password";
    Map<String, dynamic> body = {
      "code": code,
      "new_password": password,
      "email": email,
    };
    // print(body);

    try {
      http.Response res = await http.post(Uri.parse(url), body: body);

      if (res.statusCode == 200) {
        String req = res.body;

        ///Request was successfully
        // print(req);

        _isLoading = false;
        _resMessage = "Password changed`";
        notifyListeners();

        // nextPage(context!, page: const EmailLoginPage());
      } else {
        ///Request was not successful
        ///print error
        String req = res.body;
        final errorBody = json.decode(req);

        // print(req);

        _isLoading = false;
        _resMessage = errorBody["message"];
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Please connect to an active internet";
      notifyListeners();
    } catch (_) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
    }
  }

  ///Verification of phone
  void sendPhoneOrEmailVerification({
    required String source,
    required String sourceValue,
    BuildContext? context,
  }) async {
    _isLoading = true;
    _resMessage = "Please wait";
    notifyListeners();

    ///Get new password url
    String _url = "$requestBaseUrl/verification/resend";
    Map<String, dynamic> body = {
      "source": source,
      "source_value": sourceValue,
    };

    try {
      http.Response res = await http.post(Uri.parse(_url), body: body);

      print(res.statusCode);
      if (res.statusCode == 200) {
        String req = res.body;

        ///Request was successfully
        // print(req);

        _isLoading = false;
        notifyListeners();
      } else {
        ///Request was not successful
        ///print error
        String req = res.body;
        final errorBody = json.decode(req);

        print(req);

        _isLoading = false;
        _resMessage = errorBody['message'];
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Please connect to an active internet";
      notifyListeners();
    } catch (e) {
      print(e);
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
    }
  }

  ///Verify phone otp
  void verifyPhone({
    required String otpCode,
    BuildContext? context,
  }) async {
    _isLoading = true;
    _resMessage = "Please wait";
    notifyListeners();

    ///Get new password url
    String _url = "$requestBaseUrl/verification/verify";
    Map<String, dynamic> body = {
      "verification_token": otpCode,
      "verification_source": 'phone_number',
    };

    try {
      http.Response res = await http.post(Uri.parse(_url), body: body);

      if (res.statusCode == 200) {
        String req = res.body;

        ///Request was successfully
        // print(req);

        _isLoading = false;
        // _resMessage = 'OTP sent!';
        notifyListeners();
      } else {
        ///Request was not successful
        ///print error
        String req = res.body;
        final errorBody = json.decode(req);

        // print(req);

        _isLoading = false;
        _resMessage = errorBody['message'];
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Please connect to an active internet";
      notifyListeners();
    } catch (_) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
    }
  }

  ///Clear response message
  void clearMessage() {
    _resMessage = "";
    // _isLoading = false;
    notifyListeners();
  }
}
