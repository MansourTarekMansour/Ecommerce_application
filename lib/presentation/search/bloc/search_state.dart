part of 'search_cubit.dart';

@immutable
abstract class SearchStates{}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {}

class SearchErrorState extends SearchStates {
  final String error;
  SearchErrorState(this.error);
}


