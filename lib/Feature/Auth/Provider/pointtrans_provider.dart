import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:retail_project/Core/Db/db_key.dart';
import 'package:retail_project/Core/Widget/toast.dart';
import 'package:retail_project/Core/constant/apiconst.dart';
import 'package:http/http.dart' as http;
import 'package:retail_project/Core/Db/database.dart';
import 'package:retail_project/Feature/Auth/Model/pointTrans_model.dart';
import 'package:retail_project/Feature/Auth/Model/redeem_model.dart';

class PointtransProvider extends ChangeNotifier {
  final String _message = "";
  bool _isLoading = false;
  String get message => _message;
  bool get isLoading => _isLoading;
  PointTransModel pointTransModel = PointTransModel();

  final httpClient = http.Client();
  Future<void> pointsummery() async {
    final SecureStorageService _secureStorageService = SecureStorageService();
    String? personID =
        await _secureStorageService.getPersonID(key: DBKeys.personIDKey);
    // final SecureStorageService _secureStorageService1 = SecureStorageService();
    String? factoryID =
        await _secureStorageService.getFactoryID(key: DBKeys.factoryIDKey);
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(ApiURLs.personPointReportApiUrl),
        // Add headers if required (e.g., {"Content-Type": "application/json"})
        body: {
          "person_id": personID,
          "factory_id": factoryID,
        },
      );
      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        pointTransModel = PointTransModel.fromJson(decoded);
        log(pointTransModel.data!.balPoints.toString());
        notifyListeners();
        toastMsg(msgTxt: pointTransModel.message.toString());

        print('Message => ${pointTransModel.message}');
        //log(PointTransModel.message.toString());
      } else {
        // Handle error response (e.g., display specific error message)
        print("Error: ${response.statusCode}");

        toastMsg(msgTxt: "Error occurred");
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      toastMsg(msgTxt: "An error occurred. Please try again later.");
    }
  }

  Future<void> reddemPoint(
      BuildContext context, String points_redeem_request) async {
    final SecureStorageService _secureStorageService = SecureStorageService();
    String? personID =
        await _secureStorageService.getPersonID(key: DBKeys.personIDKey);
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.post(
        Uri.parse(ApiURLs.personAccTransApiUrl),
        // Add headers if required (e.g., {"Content-Type": "application/json"})
        body: {
          "person_id": personID.toString(),
          "points_redeem_request": points_redeem_request.toString(),
          "trans_type": "redeem",
        },
      );
      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        RedeemPointModel redeemPointModel = RedeemPointModel.fromJson(decoded);
        toastMsg(msgTxt: redeemPointModel.message.toString());
        notifyListeners();
        print(redeemPointModel.message);
        //  log(redeemPointModel.message.toString());
      } else {
        print("Error: ${response.statusCode}");
        toastMsg(msgTxt: "Error occurred");
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      toastMsg(msgTxt: "An error occurred. Please try again later.");
    }
  }
}
