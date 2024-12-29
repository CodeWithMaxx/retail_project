import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:retail_project/Core/Db/database.dart';
import 'package:retail_project/Core/Db/db_key.dart';
import 'package:retail_project/Core/Widget/toast.dart';
import 'package:retail_project/Core/constant/apiconst.dart';
import 'package:retail_project/Feature/Auth/Model/redeem_model.dart';

class RedeemProvider extends ChangeNotifier {
  final httpClient = http.Client();
}
