import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retail_project/Core/Theme/color_pallets.dart';
import 'package:retail_project/bloc/camichal_bloc.dart';

class PointRedeemPage extends StatefulWidget {
  PointRedeemPage({super.key});

  @override
  State<PointRedeemPage> createState() => _PointRedeemPageState();
}

class _PointRedeemPageState extends State<PointRedeemPage> {
  final TextEditingController pointController = TextEditingController();
  // late PointtransProvider _pointtransProvider;
  late CamichalBloc _camichalBloc;
  @override
  void initState() {
    _camichalBloc = CamichalBloc();
    _camichalBloc.add(FetchPointSummeryData());
    super.initState();
  }

  @override
  void dispose() {
    pointController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //   final size = MediaQuery.sizeOf(contex);
    return Scaffold(
        backgroundColor: ColorPallets.secondaryColor,
        body: BlocBuilder(
            bloc: _camichalBloc,
            builder: (context, state) {
              switch (state.runtimeType) {
                case CamichalLoadingState:
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                case CamichalLoadedSuccessState:
                  final successState = state as CamichalLoadedSuccessState;
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
                        SizedBox(height: 30),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: ColorPallets.primaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  // alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 15, left: 2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Total Points Add",
                                          style: GoogleFonts.poppins(
                                            color: ColorPallets.secondaryColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          successState.pointTransModel.data!
                                              .totPointsAdded!,
                                          style: GoogleFonts.poppins(
                                              color:
                                                  ColorPallets.secondaryColor,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                  height: 120,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: ColorPallets.primaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 15, left: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Total Points Redeem",
                                          style: GoogleFonts.poppins(
                                              color:
                                                  ColorPallets.secondaryColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          successState.pointTransModel.data!
                                              .totPointsRedeemed!,
                                          style: GoogleFonts.poppins(
                                              color:
                                                  ColorPallets.secondaryColor,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(width: 8),
                              Container(
                                  height: 120,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      color: ColorPallets.primaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 15, left: 2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Total Point Expired",
                                          style: GoogleFonts.poppins(
                                              color:
                                                  ColorPallets.secondaryColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          successState.pointTransModel.data!
                                              .totPointsExpired
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              color:
                                                  ColorPallets.secondaryColor,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(width: 8),
                              Container(
                                  height: 120,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      color: ColorPallets.primaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, right: 2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Balance Point",
                                          style: GoogleFonts.poppins(
                                              color:
                                                  ColorPallets.secondaryColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          successState
                                              .pointTransModel.data!.balPoints
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              color:
                                                  ColorPallets.secondaryColor,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                            height: 80,
                            width: 375,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorPallets.primaryColor, width: 2),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                                "Minimum 100 reward points redeem at a time",
                                style: GoogleFonts.poppins(
                                    color: ColorPallets.primaryColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(height: 30),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SizedBox(
                        //       width: 200,
                        //       child: TextField(
                        //         controller: pointController,
                        //         decoration: InputDecoration(
                        //             border: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                     width: 5,
                        //                     color: ColorPallets.primaryColor)),
                        //             hintText: "Enter Point to Redeem"),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 5,
                        //     ),
                        //     SizedBox(
                        //       height: 60,
                        //       child: ElevatedButton(
                        //           onPressed: () async {
                        //             // successState.reddemPoint(context, pointController.text);
                        //             pointController.clear();
                        //           },
                        //           style: ElevatedButton.styleFrom(
                        //               backgroundColor:
                        //                   ColorPallets.primaryColor,
                        //               shape: RoundedRectangleBorder(
                        //                   borderRadius:
                        //                       BorderRadius.circular(10))),
                        //           child: Text(
                        //             "REDEEM POINTS",
                        //             style: TextStyle(
                        //                 fontWeight: FontWeight.w600,
                        //                 fontSize: 16,
                        //                 color: Colors.white),
                        //           )),
                        //     )
                        //   ],
                        // ),
                      ]);
                case CamichalFailedErrorState:
                  return Center(
                    child: Text('Error'),
                  );
                default:
                  return Center(
                    child: Text('State Not Found'),
                  );
              }
            }));
  }
}
