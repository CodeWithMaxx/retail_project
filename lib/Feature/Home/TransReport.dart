import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail_project/Core/Theme/color_pallets.dart';
import 'package:retail_project/Feature/Auth/Provider/pointDetail_provider.dart';

class TransReport extends StatefulWidget {
  const TransReport({super.key});

  @override
  State<TransReport> createState() => _TransReportState();
}

class _TransReportState extends State<TransReport> {
  late Future<TransReport> futureTransReport;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PointDetailProvider>(builder: (_, ref, __) {
      return Scaffold(
        appBar: AppBar(title: const Text("Transation Report")),
        body: Center(
            child: ListView.builder(
                itemCount: ref.PointSummaryModel.data!.length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      ListTile(
                          title: Text(
                        ref.PointSummaryModel.data![index].transDate.toString(),
                        style: const TextStyle(
                            color: ColorPallets.secondaryColor, fontSize: 15),
                      )),
                      ListTile(
                          title: Text(
                        ref.PointSummaryModel.data![index].pointsAdded
                            .toString(),
                        style: const TextStyle(
                            color: ColorPallets.secondaryColor, fontSize: 15),
                      )),
                      ListTile(
                          title: Text(
                        ref.PointSummaryModel.data![index].pointsRedeemed
                            .toString(),
                        style: TextStyle(
                            color: ColorPallets.secondaryColor, fontSize: 15),
                      )),
                      ListTile(
                          title: Text(
                        ref.PointSummaryModel.data![index].pointsBalance
                            .toString(),
                        style: TextStyle(
                            color: ColorPallets.secondaryColor, fontSize: 15),
                      ))
                    ],
                  );
                })),
      );
    });
  }
}
