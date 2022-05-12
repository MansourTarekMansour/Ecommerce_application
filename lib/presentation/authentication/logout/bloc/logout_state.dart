part of 'logout_cubit.dart';

@immutable
abstract class LogoutState {}

class LogoutInitialState extends LogoutState {}

class LogoutLoadingState extends LogoutState {}


class LogoutSuccessState extends LogoutState {}

class LogoutShowToastState extends LogoutState {
  final String message;
  LogoutShowToastState(this.message);
}

class LogoutErrorState extends LogoutState {
  final String error;
  LogoutErrorState(this.error);
}