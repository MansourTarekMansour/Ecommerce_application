abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class LoginErrorState extends HomeStates {
  final String error;
  LoginErrorState(this.error);
}