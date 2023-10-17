import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'package:planet_b/Constants/constant.dart';

import '../database_provider.dart';

class ChangePasswordProvider extends ChangeNotifier {
  ///Base url
  final requestBaseUrl = AppStrings.baseUrl;

  ///
  bool _isLoading = false;
  String _resMessage = "";

  ///Field Getters
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  ///Registeration :
  void changePassword({
    required String oldPassword,
    required String newPassword,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    final token = await DatabaseProvider().getToken();

    ///Authentication url
    String _url = "$requestBaseUrl/auth/change-password";

    try {
      final body = {
        "old_password": oldPassword,
        "new_password": newPassword,
      };

      print(body);

      http.Response res = await http.post(Uri.parse(_url),
          body: body, headers: {"authorization": "Bearer $token"});

      print(res.statusCode);
      log(res.body);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final req = json.decode(res.body);
        // log(req);

        _isLoading = false;
        _resMessage = "${req["message"]}`";
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
      _resMessage = "Please try again`";
      notifyListeners();

      print(":::: $e");
    }
  }

  ///Clear response message
  void clearMessage() {
    _resMessage = "";
    // _isLoading = false;
    notifyListeners();
  }
}
