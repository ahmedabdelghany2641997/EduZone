import 'package:eduzone/features/profile/data/model/profile_model.dart';


abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;

  ProfileSuccess({required this.profileModel});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}

class ProfileLogoutLoading extends ProfileState {}
class ProfileLogoutSuccess extends ProfileState {}