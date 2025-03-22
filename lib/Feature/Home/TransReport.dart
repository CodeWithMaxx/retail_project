import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_project/Core/Theme/color_pallets.dart';
import 'package:retail_project/Feature/Auth/Provider/pointDetail_provider.dart';
import 'package:retail_project/bloc/camichal_bloc.dart';

class TransReport extends StatefulWidget {
  const TransReport({super.key});

  @override
  State<TransReport> createState() => _TransReportState();
}

class _TransReportState extends State<TransReport> {
  late Future<TransReport> futurePointsReport;
  late PointDetailProvider _pointDetailProvider;
  late CamichalBloc _camichalBloc;

  @override
  void initState() {
    super.initState();
    _camichalBloc = CamichalBloc();
    _camichalBloc.add(FetchPointDetailData());
    // _pointDetailProvider = PointDetailProvider();
    // _pointDetailProvider.TransReport(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _camichalBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case CamichalLoadingState:
            return Center(child: CircularProgressIndicator());
          case PointdetailSuccessState:
            final successState = state as PointdetailSuccessState;
            return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Transation Report",
                  ),
                  backgroundColor: ColorPallets.secondaryColor,
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: MaterialStatePropertyAll<Color>(
                        ColorPallets.primaryColor),
                    columns: const [
                      DataColumn(
                          label: Text(
                        "Transaction Date",
                        style: TextStyle(color: ColorPallets.secondaryColor),
                      )),
                      DataColumn(
                          label: Text("Particulars",
                              style: TextStyle(
                                  color: ColorPallets.secondaryColor))),
                      DataColumn(
                          label: Text("Points",
                              style: TextStyle(
                                  color: ColorPallets.secondaryColor))),
                      DataColumn(
                          label: Text("Point Balance",
                              style: TextStyle(
                                  color: ColorPallets.secondaryColor))),
                    ],
                    rows: successState.pointsReportmodel.data!
                        .map(
                          (data) => DataRow(
                            cells: [
                              DataCell(Text(data.transDate ?? "",
                                  style: TextStyle(
                                      color: ColorPallets.primaryColor))),
                              DataCell(Text(data.particulars ?? "",
                                  style: TextStyle(
                                      color: ColorPallets.primaryColor))),
                              DataCell(Text(data.points ?? "",
                                  style: TextStyle(
                                      color: ColorPallets.primaryColor))),
                              DataCell(Text(data.pointsBalance.toString(),
                                  style: TextStyle(
                                      color: ColorPallets.primaryColor))),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ));
          case CamichalFailedErrorState:
            final error = state as CamichalFailedErrorState;
            return Center(child: Text(error.error2.toString()));
          default:
            return Center(child: Text("State not found"));
        }
      },
    );
  }
}
