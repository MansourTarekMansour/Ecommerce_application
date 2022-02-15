abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState(this.error);
}
class ChangeBottomState extends HomeStates{}