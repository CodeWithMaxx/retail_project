import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:retail_project/Feature/Auth/Screen/BottamNavigation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Core/DB/database.dart';
import '../../../Core/DB/db_key.dart';
import '../../../Core/Widget/toast.dart';
import '../../../Core/constant/apiconst.dart';
import '../Model/login_model.dart';

class LoginProvider extends ChangeNotifier {
  final httpClient = http.Client();
  final SecureStorageService _secureStorageService = SecureStorageService();

  Future<void> userlogin(
      String mobileNumber, String password, BuildContext context) async {
    final url = Uri.parse(ApiURLs.userLoginApiUrl);
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    var response = await httpClient
        .post(url, body: {'mobile_no': mobileNumber, 'password': password});
    if (response.statusCode == 200) {
      var responseDecoded = jsonDecode(response.body);

      LoginApiModel loginApiModel = LoginApiModel.fromJson(responseDecoded);
      toastMsg(msgTxt: loginApiModel.message.toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => BottamNavigationbar()));
      log(responseDecoded.toString());

      print(responseDecoded);
      _secureStorageService.savePersonID(
          value: loginApiModel.data!.personId.toString(),
          key: DBKeys.personIDKey);
      _secureStorageService.saveFactoryID(
          value: loginApiModel.data!.factoryId.toString(),
          key: DBKeys.factoryIDKey);
      _secureStorageService.saveAddress(
          value: loginApiModel.data!.address.toString(),
          key: DBKeys.addressKey);
      _secureStorageService.saveCity(
          value: loginApiModel.data!.city.toString(), key: DBKeys.cityKey);
      _secureStorageService.saveMobileNo(
          value: loginApiModel.data!.mobileNo.toString(),
          key: DBKeys.mobileKey);
      _secureStorageService.savePersonName(
          value: loginApiModel.data!.personName.toString(),
          key: DBKeys.personNameKey);
      _sharedPreferences.setBool('loggedIN', true);
    }
  }
}
