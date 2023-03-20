// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:bussystem/Providers/LoginServiceProvider.dart';
import 'package:bussystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum BuslistServiceStatus { idleState, loadingState, loadedState, errorState }

class BusListProvider extends ChangeNotifier {
  static BusListProvider instance = BusListProvider();
  BusListProvider();
  BuslistServiceStatus buslistServiceStatus = BuslistServiceStatus.idleState;
  Future BuslistService() async {
    await LoginServiceProvider.instance.login();
    await LoginServiceProvider.instance.refreshTokencall();

    final url_id1 = LoginServiceProvider.instance.urlId;
    final accessToken1 = LoginServiceProvider.instance.accessToken;
    final refreshToken = LoginServiceProvider.instance.refreshedAccesstoken;
  //  final refreshToken = LoginServiceProvider.instance.refreshToken;
    print("final one $refreshToken");
    final url = "${BaseUrl + BuslistUrl + url_id1}/";
    

    buslistServiceStatus = BuslistServiceStatus.loadingState;
    notifyListeners();
    final header1 = {"Authorization": "Bearer $accessToken1"};

    http.Response response = await http.get(Uri.parse(url), headers: header1);

    try {
      if (response.statusCode == 200) {
        print("statusciodebus ${response.statusCode}");
        buslistServiceStatus = BuslistServiceStatus.loadedState;

        final DecodeData = jsonDecode(response.body);

        print('decoded bus list  $DecodeData');

        notifyListeners();
      } else if (response.statusCode == 401) {
       // final body = {"refresh": jsonEncode(refreshToken)};
        
    final header2 = {"Authorization": "Bearer $refreshToken"};
        
        final http.Response response =
            await http.post(Uri.parse(url), headers: header2);

        final DecodeData = jsonDecode(response.body);
        print("refreshed $DecodeData");

        notifyListeners();
      } else {
        print("errorcode${response.statusCode}");
      }
    } catch (e) {
      buslistServiceStatus = BuslistServiceStatus.errorState;
      print(e.toString());
      print(response.statusCode);

      notifyListeners();
    }
  }
}
