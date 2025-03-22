import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:retail_project/Core/Db/database.dart';
import 'package:retail_project/Core/Db/db_key.dart';
import 'package:retail_project/Feature/Auth/Model/profile_model.dart';
import 'package:retail_project/Feature/Auth/Screen/Profile_screen.dart';

import '../../../Core/Widget/toast.dart';
import '../../../Core/constant/apiconst.dart';

class ProfileProvider extends ChangeNotifier {
  String _message = "";
  bool _isLoading = false;

  String get message => _message;
  bool get isLoading => _isLoading;
  UserProfile userProfile = UserProfile();
  final httpClient = http.Client();

  Future<void> Profile(
    BuildContext context,
  ) async {
    final SecureStorageService _secureStorageService = SecureStorageService();
    String? personID =
        await _secureStorageService.getPersonID(key: DBKeys.personIDKey);
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.post(
        Uri.parse(ApiURLs.userProfileApiurl),
        // Add headers if required (e.g., {"Content-Type": "application/json"})
        body: {
          "person_id": personID.toString(),
        },
      );
      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        userProfile = UserProfile.fromJson(decoded);
        print('Profile => ${userProfile.toString()}');
        notifyListeners();
        toastMsg(msgTxt: userProfile.message.toString());
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
