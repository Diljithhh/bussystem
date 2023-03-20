// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:bussystem/Model/DrivermodelData.dart';
import 'package:bussystem/Providers/LoginServiceProvider.dart';
import 'package:bussystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum DriverlistServiceStatus {
  idleState,
  loadingState,
  loadedState,
  errorState
}

enum DriveraddedStatus { idleState, addingState, addedState, errorState }

enum Driverlistdeleted { idleState, deletingState, deletedState, errorState }

class DriverListProvider extends ChangeNotifier {
  static DriverListProvider instance = DriverListProvider();
  DriverListProvider();
  List<DriverList>? driverList = [];
  DriverModelData? data;
  final urlId = LoginServiceProvider.instance.urlId;

  final accesstoken = LoginServiceProvider.instance.refreshedAccesstoken;
  DriverlistServiceStatus driverlistsytatus = DriverlistServiceStatus.idleState;
    DriveraddedStatus driveraddedStatus = DriveraddedStatus.idleState;
    Driverlistdeleted driverlistdeleted = Driverlistdeleted.idleState;



  Future getDriverList() async {
    driverlistsytatus = DriverlistServiceStatus.loadingState;
    notifyListeners();

    final url = "${BaseUrl + DriverlistUrl}/$urlId/";

    final header = {"Authorization": "Bearer " + accesstoken};
    http.Response response = await http.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200) {
      try {
        final decodeData = jsonDecode(response.body);

        DriverModelData data = DriverModelData.fromJson(decodeData);

        print("model$data");

        if (data.status == true) {
          driverList = data.driverList;
          print("drivers are$driverList");
          driverlistsytatus = DriverlistServiceStatus.loadedState;
          notifyListeners();
        }
      } catch (e) {
        print("fn call 3");

        driverlistsytatus = DriverlistServiceStatus.errorState;
        print(e.toString());

        log(response.statusCode);
        notifyListeners();
      }
    }
  }

  Future addDriver(
      {required String name,
      required String mobile,
      required String licensenumber}) async {
    final url = "${BaseUrl + DriverlistUrl}/$urlId/";

    final header = {"Authorization": "Bearer " + accesstoken};

    final body = {"name": name, "mobile": mobile, "license_no": licensenumber};
    driveraddedStatus = DriveraddedStatus.addingState;
    notifyListeners();
    http.Response response =
        await http.post(Uri.parse(url), headers: header, body: body);

    if (response.statusCode == 200) {
      driveraddedStatus = DriveraddedStatus.addedState;
      notifyListeners();
    } else {
      driveraddedStatus = DriveraddedStatus.errorState;
      notifyListeners();

      return print(response.statusCode);
    }
  }

  Future deleteDriver({required String id}) async {

    final url = "${BaseUrl + DriverlistUrl}/$urlId/";
    final header = {"Authorization": "Bearer " + accesstoken};


final body={"driver_id":id};
    http.Response response = await http.delete(Uri.parse(url),headers:header,body: body );

    driverlistdeleted = Driverlistdeleted.deletingState;

    if (response.statusCode == 200) {
      driverlistdeleted = Driverlistdeleted.deletedState;



      print('deleted driver');

      notifyListeners();
    } else {
      driverlistdeleted = Driverlistdeleted.deletedState;
      notifyListeners();

      return print(response.statusCode);
    }
  }
}
