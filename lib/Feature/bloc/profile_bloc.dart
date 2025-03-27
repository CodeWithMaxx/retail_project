import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:retail_project/Feature/Auth/Model/profile_model.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:retail_project/Core/Db/database.dart';
import 'package:retail_project/Core/Db/db_key.dart';
import 'package:retail_project/Feature/Auth/Model/profile_model.dart';
import 'package:retail_project/Feature/Auth/Screen/Profile_screen.dart';

import '../../../Core/Widget/toast.dart';
import '../../../Core/constant/apiconst.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileDetailsFetchEvent>(profileDetailsFetchEvent);
  }

  FutureOr<void> profileDetailsFetchEvent(
      ProfileDetailsFetchEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    UserProfile userProfile = UserProfile();
    final httpClient = http.Client();
    final SecureStorageService _secureStorageService = SecureStorageService();
    String? personID =
        await _secureStorageService.getPersonID(key: DBKeys.personIDKey);

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
        emit(ProfileLoadedSuccessState(userProfile: userProfile));
        print('Profile => ${userProfile.toString()}');
        log('User Profile =>> ${userProfile.data!.aadhar}');

        toastMsg(msgTxt: userProfile.message.toString());
      } else {
        // Handle error response (e.g., display specific error message)
        print("Error: ${response.statusCode}");
        toastMsg(msgTxt: "Error occurred");
      }
    } catch (e) {
      print(e.toString());
      toastMsg(msgTxt: "An error occurred. Please try again later.");
      emit(ProfileErrorState(error: e.toString()));
    }
  }
}
