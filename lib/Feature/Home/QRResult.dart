import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail_project/Core/Db/database.dart';
import 'package:http/http.dart' as http;
import 'package:retail_project/Feature/Auth/Provider/qr_result_provider.dart';

class Qrresult extends StatefulWidget {
  final result;
  const Qrresult({super.key, required this.result});

  @override
  State<Qrresult> createState() => _QrresultState();
}

class _QrresultState extends State<Qrresult> {
  final httpClient = http.Client();
  SecureStorageService secureStorageloginservice = SecureStorageService();
  late QrResultProvider qrResultProvider;

  @override
  void initState() {
    qrResultProvider = QrResultProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QrResultProvider>(builder: (_, ref, __) {
      return Container();
    });
  }
}
