part of 'camichal_bloc.dart';

sealed class CamichalEvent {}

final class FetchPointSummeryData extends CamichalEvent {}

final class FetchPointDetailData extends CamichalEvent {}
