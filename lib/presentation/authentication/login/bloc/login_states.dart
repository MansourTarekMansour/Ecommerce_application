
abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginRefreshState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String message;
  LoginSuccessState(this.message);
}
class LoginShowToastState extends LoginStates {
  final String message;
  LoginShowToastState(this.message);
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}
class LoginChangePasswordVisibilityState extends LoginStates {}