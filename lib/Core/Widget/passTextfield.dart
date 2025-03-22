import 'package:flutter/material.dart';

class Passtextfield {
  static CustomTextField(TextEditingController Controller, String text,
      IconData iconData, double border, bool toHide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: TextField(
                controller: Controller,
                obscureText: toHide,
                decoration: InputDecoration(
                    hintText: text,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Icon(iconData),
                    ),
                    border: InputBorder.none)),
          )),
    );
  }
}
