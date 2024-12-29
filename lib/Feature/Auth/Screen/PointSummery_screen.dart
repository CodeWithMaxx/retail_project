import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retail_project/Core/Theme/color_pallets.dart';

class PointsummeryScreen extends StatefulWidget {
  const PointsummeryScreen({super.key});

  @override
  State<PointsummeryScreen> createState() => _PointsummeryScreenState();
}

class _PointsummeryScreenState extends State<PointsummeryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPallets.secondaryColor,
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                    'PointSummery',
                    style: GoogleFonts.poppins(
                        color: ColorPallets.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text("Total Point Add",
                          style: GoogleFonts.poppins(
                              color: ColorPallets.textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500))),
                ]))));
  }
}
