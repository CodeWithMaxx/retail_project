import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:retail_project/Core/Db/database.dart';
import 'package:retail_project/Core/Db/db_key.dart';
import 'package:retail_project/Feature/Auth/Model/point_detailmodel.dart';
import 'package:retail_project/Feature/Home/TransReport.dart';
import '../../../Core/Widget/toast.dart';
import '../../../Core/constant/apiconst.dart';

class PointDetailProvider extends ChangeNotifier {
  String _message = "";
  bool _isLoading = false;

  String get message => _message;
  bool get isLoading => _isLoading;
  PointsReport PointSummaryModel = PointsReport();

  final httpClient = http.Client();

  Future<void> TransReport(
    BuildContext context,
  ) async {
    final SecureStorageService _secureStorageService = SecureStorageService();
    String? personID =
        await _secureStorageService.getPersonID(key: DBKeys.personIDKey);
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(ApiURLs.personPointDetailApiUrl),
        // Add headers if required (e.g., {"Content-Type": "application/json"})
        body: {
          "person_id": personID.toString(),
        },
      );

      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        PointSummaryModel = PointsReport.fromJson(decoded);
        notifyListeners();
        print(PointSummaryModel.message);
        log(PointSummaryModel.message.toString());
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (_) => LoginPage()),
        // );
        toastMsg(msgTxt: PointSummaryModel.message.toString());
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
}
