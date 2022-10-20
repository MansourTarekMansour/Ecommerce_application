part of 'address_cubit.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoadingState extends AddressState {}

class AddressSuccessState extends AddressState {}

class AddressAddSuccessState extends AddressState {}

class AddressErrorState extends AddressState {
  final String error;

  AddressErrorState(this.error);
}
