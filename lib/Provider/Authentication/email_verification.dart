import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;

import '../../Constants/constant.dart';
import '../../Screens/Authentication/otp.dart';
import '../../Utils/app_route.dart';
import '../../Widgets/custom_bottomsheet.dart';
import '../database_provider.dart';

class EmailAndPhoneVerificationProvider extends ChangeNotifier {
  ///Base url
  final requestBaseUrl = AppStrings.baseUrl;

  ///
  bool _isLoading = false;
  String _resMessage = "";

  ///Field Getters
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  ///Login User Google
  void verifyEmailOtp(
      BuildContext? context, String? email, String? code, String? path) async {
    _isLoading = true;
    notifyListeners();

    final body = {"code": code, "email": email};

    ///Login url
    String _url = "$requestBaseUrl/auth/verify-email-otp";

    // final token = await DatabaseProvider().getToken();

    try {
      http.Response res = await http.post(Uri.parse(_url), body: body);
//ssssddd
      print(res.statusCode);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final req = json.decode(res.body);
        print(req);

        // final userId = req["user"]["user_id"];
        final token = req["refresh"];
        // final email = req["user"]["email"];

        DatabaseProvider().saveToken(token: token);
        // DatabaseProvider().saveEmail(email: email);
        // DatabaseProvider().saveUserId(id: userId);

        _isLoading = false;
        _resMessage = "Email Verified!`";
        notifyListeners();

        showCustomBottomSheet(context!, path);
      } else {
        ///Request was not successful
        ///print error
        String req = res.body;
        Map errorBody = json.decode(req);

        // print("hello $errorBody");
        _isLoading = false;
        _resMessage = errorBody['message'];
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
      print("Error :::::::::::: $e");
    }
  }

  ///resend email otp
  void resendEmailOtp(String email) async {
    _isLoading = true;
    notifyListeners();

    ///Login url
    String _url = "$requestBaseUrl/auth/resend-email-otp";

    // final token = await DatabaseProvider().getToken();

    final body = {"email": email};

    try {
      http.Response res = await http.post(Uri.parse(_url), body: body);
//ssssddd
      print(res.statusCode);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final req = json.decode(res.body);
        print(req);

        _isLoading = false;
        _resMessage = "Otp Sent!`";
        notifyListeners();
      } else {
        ///Request was not successful
        ///print error
        String req = res.body;
        Map errorBody = json.decode(req);

        print(errorBody);
        _isLoading = false;
        _resMessage = errorBody['message'];
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
      print("Error :::::::::::: $e");
    }
  }

  ///Phone verification
  void verifyPhoneOtp(
      BuildContext? context, String? phone, String? code) async {
    _isLoading = true;
    notifyListeners();

    final body = {"code": code};

    ///Login url
    String _url = "$requestBaseUrl/auth/verify-phone-otp";

    final token = await DatabaseProvider().getToken();

    try {
      http.Response res = await http.post(Uri.parse(_url),
          body: body, headers: {"authorization": "Bearer $token"});
//ssssddd
      print(res.statusCode);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final req = json.decode(res.body);
        print(req);

        _isLoading = false;
        _resMessage = "Phone number verified!`";
        notifyListeners();
        showCustomBottomSheet(context!, "phone");
      } else {
        ///Request was not successful
        ///print error
        String req = res.body;
        Map errorBody = json.decode(req);

        // print("hello $errorBody");
        _isLoading = false;
        _resMessage = errorBody['message'];
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
      print("Error :::::::::::: $e");
    }
  }

  ///resend email otp
  void sendPhoneOtp(String phone, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final token = await DatabaseProvider().getToken();

    String _url = "$requestBaseUrl/auth/send-phone-otp";

    final body = {"phone_number": phone};
    print(body);
    print(token);

    try {
      http.Response res = await http.post(Uri.parse(_url),
          body: body, headers: {"authorization": "Bearer $token"});
//ssssddd
      print(res.statusCode);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final req = json.decode(res.body);
        print(req);

        _isLoading = false;
        _resMessage = "Otp Sent to $phone`";
        notifyListeners();

        DatabaseProvider().savePhone(phone: phone);

        // nextPage(context, page: OtpPage(path: "phone",));
      } else {
        ///Request was not successful
        ///print error
        String req = res.body;
        Map errorBody = json.decode(req);

        print(errorBody);
        _isLoading = false;
        _resMessage = errorBody['message'];
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again";
      notifyListeners();
      print("Error :::::::::::: $e");
    }
  }

  ///Clear response message
  void clearMessage() {
    _resMessage = "";
    notifyListeners();
  }
}
