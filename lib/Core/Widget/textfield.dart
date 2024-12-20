import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  IconData iconData;

  String text;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.iconData,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Color.fromARGB(250, 109, 41, 50))),
          hintText: hintText,
          prefixIcon: Icon(iconData),
          label: Text(text)),
    );
  }
}
