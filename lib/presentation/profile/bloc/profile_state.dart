part of 'profile_cubit.dart';

@immutable
abstract class ProfileState{}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {}

class ProfileUpdateSuccessState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String error;
  ProfileErrorState(this.error);
}
