abstract class HomeStates{}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState(this.error);
}

class ChangeBannerIndexState extends HomeStates {}

class TimerInitial extends HomeStates {}

class TimerChanged extends HomeStates {}

class TimerFinished extends HomeStates {}