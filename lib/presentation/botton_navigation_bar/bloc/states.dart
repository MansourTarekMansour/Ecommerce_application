abstract class BottomNavigationBarStates {}

class BottomNavigationBarInitialState extends BottomNavigationBarStates {}

class BottomNavigationBarLoadingState extends BottomNavigationBarStates {}

class BottomNavigationBarSuccessState extends BottomNavigationBarStates {}

class BottomNavigationBarErrorState extends BottomNavigationBarStates {
  final String error;
  BottomNavigationBarErrorState(this.error);
}
class ChangeBottomState extends BottomNavigationBarStates{}