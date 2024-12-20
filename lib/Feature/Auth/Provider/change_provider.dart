import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Core/Widget/toast.dart';
import '../../../Core/constant/apiconst.dart';
import '../Model/change_model.dart';
import '../Screen/login_screen.dart';

class ChangeProvider extends ChangeNotifier {
  String _message = "";
  bool _isLoading = false;

  String get message => _message;
  bool get isLoading => _isLoading;

  final httpClient = http.Client();

  Future<void> changePassword(BuildContext context, String existingPassword,
      String mobileNumber, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final reponse = await http.post(
        Uri.parse(ApiURLs.changePassApiUrl),
        //  headers: {"Content-Type": "application/json"},
        body: ({
          "existing_password": existingPassword,
          "password": password,
          "mobile_no": mobileNumber,
        }),
      );
      if (reponse.statusCode == 200) {
        var decoded = jsonDecode(reponse.body);
        ChangepassModel changepassModel = ChangepassModel.fromJson(decoded);
        print(changepassModel.message);
        log(changepassModel.message.toString());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LoginPage()));
        toastMsg(msgTxt: changepassModel.message.toString());

        notifyListeners();
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
