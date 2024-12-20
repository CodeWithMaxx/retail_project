import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Core/Widget/toast.dart';
import '../../../Core/constant/apiconst.dart';
import '../Model/forgot_model.dart';
import '../Screen/login_screen.dart';

class ForgotProvider extends ChangeNotifier {
  String _message = "";
  bool _isLoading = false;

  String get message => _message;
  bool get isLoading => _isLoading;

  final httpClient = http.Client();

  Future<void> forgotScreen(BuildContext context, String mobileNumber) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(ApiURLs.forgotPassApiUrl),
        // Add headers if required (e.g., {"Content-Type": "application/json"})
        body: ({
          "mobile_no": mobileNumber,
        }),
      );

      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        forgotAPi forgotapiModel = forgotAPi.fromJson(decoded);
        print(forgotapiModel.message);
        log(forgotapiModel.message.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginPage()),
        );
        toastMsg(msgTxt: forgotapiModel.message.toString());
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
