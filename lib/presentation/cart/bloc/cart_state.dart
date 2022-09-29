part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {}

class CartErrorState extends CartState {
  final String error;

  CartErrorState(this.error);
}
