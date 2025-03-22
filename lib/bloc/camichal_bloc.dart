import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:retail_project/Core/Db/database.dart';
import 'package:retail_project/Core/Db/db_key.dart';
import 'package:retail_project/Core/Widget/toast.dart';
import 'package:retail_project/Core/constant/apiconst.dart';
import 'package:retail_project/Feature/Auth/Model/pointTrans_model.dart';
import 'package:http/http.dart' as http;
import 'package:retail_project/Feature/Auth/Model/point_detailmodel.dart';
part 'camichal_event.dart';
part 'camichal_state.dart';

class CamichalBloc extends Bloc<CamichalEvent, CamichalState> {
  CamichalBloc() : super(CamichalInitial()) {
    on<FetchPointSummeryData>(fetchPointSummeryData);
    on<FetchPointDetailData>(fetchPointDetailData);
  }

  FutureOr<void> fetchPointSummeryData(
      FetchPointSummeryData event, Emitter<CamichalState> emit) async {
    emit(CamichalLoadingState());
    final SecureStorageService _secureStorageService = SecureStorageService();
    String? personID =
        await _secureStorageService.getPersonID(key: DBKeys.personIDKey);
    // final SecureStorageService _secureStorageService1 = SecureStorageService();
    String? factoryID =
        await _secureStorageService.getFactoryID(key: DBKeys.factoryIDKey);

    try {
      final response = await http.post(
        Uri.parse(ApiURLs.personPointReportApiUrl),
        // Add headers if required (e.g., {"Content-Type": "application/json"})
        body: {
          "person_id": personID.toString(),
          "factory_id": factoryID.toString(),
        },
      );
      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        PointTransModel pointTransModel = PointTransModel.fromJson(decoded);
        emit(CamichalLoadedSuccessState(pointTransModel: pointTransModel));
        log(pointTransModel.data!.balPoints.toString());
        toastMsg(msgTxt: pointTransModel.message.toString());

        print('Message => ${pointTransModel.message}');
        //log(PointTransModel.message.toString());
      } else {
        // Handle error response (e.g., display specific error message)
        print("Error: ${response.statusCode}");

        toastMsg(msgTxt: "Error occurred");
      }
    } catch (e) {
      emit(CamichalFailedErrorState(error: e.toString()));
      print(e.toString());
      toastMsg(msgTxt: "An error occurred. Please try again later.");
    }
  }

  FutureOr<void> fetchPointDetailData(
      FetchPointDetailData event, Emitter<CamichalState> emit) async {
    emit(CamichalLoadingState());
    final SecureStorageService _secureStorageService = SecureStorageService();
    String? personID =
        await _secureStorageService.getPersonID(key: DBKeys.personIDKey);

    // final List<PointsReportmodel> pointReportList = [];

    try {
      final response = await http.post(
        Uri.parse(ApiURLs.personPointDetailApiUrl),
        // Add headers if required (e.g., {"Content-Type": "application/json"})
        body: {
          "person_id": personID.toString(),
        },
      );

      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        PointsReportmodel pointsReportmodel =
            PointsReportmodel.fromJson(decoded);
        emit(PointdetailSuccessState(pointsReportmodel: pointsReportmodel));
        print(
            'Point Data => ${pointsReportmodel.data!.first.particulars.toString()}');

        //  print(pointsReportmodel.mess);
        //log(PointsReport.message.toString());
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (_) => LoginPage()),
        // );
        toastMsg(msgTxt: pointsReportmodel.message.toString());
      } else {
        // Handle error response (e.g., display specific error message)
        print("Error: ${response.statusCode}");
        toastMsg(msgTxt: "Error occurred");
      }
    } catch (e) {
      emit(CamichalFailedErrorState(error2: e.toString()));
      print(e.toString());
      toastMsg(msgTxt: "An error occurred. Please try again later.");
    }
  }
}
