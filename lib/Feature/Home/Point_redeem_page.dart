import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:retail_project/Core/Theme/color_pallets.dart';
import 'package:retail_project/Feature/Auth/Provider/pointtrans_provider.dart';
import 'package:retail_project/Feature/Auth/Provider/redeem_provider.dart';

class PointRedeemPage extends StatefulWidget {
  PointRedeemPage({super.key});

  @override
  State<PointRedeemPage> createState() => _PointRedeemPageState();
}

class _PointRedeemPageState extends State<PointRedeemPage> {
  final TextEditingController pointController = TextEditingController();
  // late PointtransProvider _pointtransProvider;

  // @override
  // void initState() {
  //   super.initState();
  //   _pointtransProvider = PointtransProvider();
  //   _pointtransProvider.pointsummery();
  // }

  @override
  void dispose() {
    pointController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPallets.secondaryColor,
        body: Consumer<PointtransProvider>(
          builder: (_, ref, __) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Redeem Reward Points",
                      style: GoogleFonts.poppins(
                          color: ColorPallets.primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 130,
                        width: 128,
                        decoration: BoxDecoration(
                            color: ColorPallets.primaryColor.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8)),
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 2),
                          child: Column(
                            children: [
                              Text(
                                "Total Reward Points",
                                style: GoogleFonts.poppins(
                                    color: ColorPallets.secondaryColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ref.pointTransModel.data!.totPointsAdded
                                    .toString(),
                                style: GoogleFonts.poppins(
                                    color: ColorPallets.secondaryColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                          height: 130,
                          width: 123,
                          decoration: BoxDecoration(
                              color: ColorPallets.primaryColor.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8)),
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 2),
                            child: Column(
                              children: [
                                Text(
                                  "Total Points Add",
                                  style: GoogleFonts.poppins(
                                      color: ColorPallets.secondaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ref.pointTransModel.data!.totPointsRedeemed
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      color: ColorPallets.secondaryColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(width: 5),
                      Container(
                          height: 130,
                          width: 120,
                          decoration: BoxDecoration(
                              color: ColorPallets.primaryColor.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8)),
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 2),
                            child: Column(
                              children: [
                                Text(
                                  "Balance Point",
                                  style: GoogleFonts.poppins(
                                      color: ColorPallets.secondaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ref.pointTransModel.data!.balPoints
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      color: ColorPallets.secondaryColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                      height: 100,
                      width: 375,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorPallets.primaryColor, width: 2),
                      ),
                      alignment: Alignment.topLeft,
                      child: Text("Minimum 100 reward points redeem at a time",
                          style: GoogleFonts.poppins(
                              color: ColorPallets.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: pointController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 5,
                                      color: ColorPallets.primaryColor)),
                              hintText: "Enter Point to Redeem"),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        height: 60,
                        child: ElevatedButton(
                            onPressed: () async {
                              ref.reddemPoint(context, pointController.text);
                              pointController.clear();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPallets.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              "REDEEM POINTS",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ]);
          },
        ));
  }
}
