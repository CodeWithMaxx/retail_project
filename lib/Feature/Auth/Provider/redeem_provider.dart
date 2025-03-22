import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RedeemProvider extends ChangeNotifier {
  final httpClient = http.Client();
}
