import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:retail_project/Feature/Auth/Model/register_model.dart';
import '../../../Core/Widget/toast.dart';
import '../../../Core/constant/apiconst.dart';
import '../Screen/login_screen.dart';

class RegisterProvider extends ChangeNotifier {
  String _message = "";
  bool _isLoading = false;

  String get message => _message;
  bool get isLoading => _isLoading;

  final httpClient = http.Client();

  Future<void> userregister(
      BuildContext context,
      String person_name,
      String address,
      String city,
      String contact_no,
      String mobile_no,
      String email,
      String password,
      String aadhar,
      String pan_no,
      String bank_name,
      String bank_branch,
      String bankAcNo,
      String ifsc) async {
    _isLoading = true;
    notifyListeners();

    try {
      final reponse = await http.post(
        Uri.parse(ApiURLs.personRegisterApiurl),
        //  headers: {"Content-Type": "application/json"},
        body: ({
          "person_name": person_name,
          "address": address,
          "city": city,
          "contact_no": contact_no,
          "mobile_no": mobile_no,
          "email": email,
          "password": password,
          "aadhar": aadhar,
          "pan_no": pan_no,
          "bank_name": bank_name,
          "bank_branch": bank_branch,
          "bank_ac_no": bankAcNo,
          "ifsc": ifsc,
        }),
      );
      if (reponse.statusCode == 200) {
        var decoded = jsonDecode(reponse.body);
        Registration registration = Registration.fromJson(decoded);
        print(registration.message);
        log(registration.message.toString());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LoginPage()));
        toastMsg(msgTxt: registration.message.toString());

        notifyListeners();
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
