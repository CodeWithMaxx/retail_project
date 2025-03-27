part of 'profile_bloc.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileLoadedSuccessState extends ProfileState {
  final UserProfile userProfile;

  ProfileLoadedSuccessState({required this.userProfile});
}

final class ProfileErrorState extends ProfileState {
  final String error;

  ProfileErrorState({required this.error});
}
