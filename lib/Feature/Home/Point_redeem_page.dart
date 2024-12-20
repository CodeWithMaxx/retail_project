import 'package:flutter/material.dart';

class PointRedeemPage extends StatefulWidget {
  const PointRedeemPage({super.key});

  @override
  State<PointRedeemPage> createState() => _PointRedeemPageState();
}

class _PointRedeemPageState extends State<PointRedeemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pointReddem"),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
