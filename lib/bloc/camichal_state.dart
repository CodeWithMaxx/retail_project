part of 'camichal_bloc.dart';

sealed class CamichalState {}

final class CamichalInitial extends CamichalState {}

final class CamichalLoadingState extends CamichalState {}

final class CamichalLoadedSuccessState extends CamichalState {
  final PointTransModel pointTransModel;

  CamichalLoadedSuccessState({required this.pointTransModel});
}

final class PointdetailSuccessState extends CamichalState {
  final PointsReportmodel pointsReportmodel;

  PointdetailSuccessState({required this.pointsReportmodel});
}

final class CamichalFailedErrorState extends CamichalState {
  final String? error;
  final String? error2;

  CamichalFailedErrorState({this.error, this.error2});
}
