import 'dart:convert';
import 'dart:math';
import 'package:bussystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum Loginstatus {
  notLogined,
  isLogined,
  inProgress,
  isError,
  refreshToken2loaded
}

class LoginServiceProvider extends ChangeNotifier {
  late String accessToken;
  late String refreshedAccesstoken;

  late String urlId;

  late String refreshToken;
  static LoginServiceProvider instance = LoginServiceProvider();

  LoginServiceProvider();
  Loginstatus loginstatus = Loginstatus.notLogined;

  Future login() async {
    loginstatus = Loginstatus.inProgress;
    final Url = BaseUrl + logInApi;
    final body = {"username": "admin_user", "password": "123admin789"};
    http.Response response = await http.post(Uri.parse(Url), body: body);
    if (response.statusCode == 200) {
      try {
        final decodedData = jsonDecode(response.body);
        //  print("decodedata$decodedData");
        accessToken = decodedData['access'];
        refreshToken = decodedData['refresh'];
        urlId = decodedData['url_id'];
        loginstatus = Loginstatus.isLogined;
        notifyListeners();

        // print("accesstoken $accessToken");
        // print("refreshtoken $refreshToken");
      } catch (e) {
        loginstatus = Loginstatus.isError;
        log(response.statusCode);
        notifyListeners();
      }
    } else {
      return print(response.statusCode);
    }
  }

  Future refreshTokencall() async {
    const url = BaseUrl + Refresh;
    final body = {"refresh": "$refreshToken"};
    http.Response response = await http.post(Uri.parse(url), body: body);

    try {
      if (response.statusCode == 200) {
        final DecodedData = jsonDecode(response.body);

        refreshedAccesstoken = DecodedData['access'];
        loginstatus = Loginstatus.refreshToken2loaded;
        notifyListeners();
        print('finalToken is $refreshedAccesstoken');
      }
    } catch (e) {
      log(response.statusCode);
    }
  }
}
