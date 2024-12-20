import 'package:flutter/material.dart';

class TransReport extends StatefulWidget {
  const TransReport({super.key});

  @override
  State<TransReport> createState() => _TransReportState();
}

class _TransReportState extends State<TransReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text("Transation Report")
      )
    );
  }
}