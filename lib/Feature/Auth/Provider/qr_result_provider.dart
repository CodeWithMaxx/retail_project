import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:retail_project/Core/Db/database.dart';
import 'package:retail_project/Core/Db/db_key.dart';
import 'package:retail_project/Core/Widget/toast.dart';
import 'package:retail_project/Core/constant/apiconst.dart';
import 'package:http/http.dart' as http;
import 'package:retail_project/Feature/Auth/Model/qrresult_model.dart';

class QrResultProvider extends ChangeNotifier {
  final String _message = "";
  bool _isLoading = false;

  String get message => _message;
  bool get isLoading => _isLoading;

  final httpClient = http.Client();
  Future<void> Qrresult(BuildContext context, String qrText) async {
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
          "qr_text": qrText.toString(),
          "trans_type": "add",
        },
      );
      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        QrTransModel qrtransModel = QrTransModel.fromJson(decoded);
        toastMsg(msgTxt: qrtransModel.message.toString());
        notifyListeners();
        print(qrtransModel.message);
        //log(qrtransModel.message.toString());
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
