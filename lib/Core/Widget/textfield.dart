import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  IconData iconData;
  bool toHide;
  String text;

  CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.iconData,
      required this.text,
      required this.toHide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      // decoration: BoxDecoration(color: Colors.red.withOpacity(10)),
      child: TextFormField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(iconData),
            label: Text(text),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
