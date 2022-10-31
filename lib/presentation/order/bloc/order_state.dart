part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class OrderLoadingState extends OrderState {}
class OrderSuccessState extends OrderState {}
class OrderErrorState extends OrderState {
  final String error;
  OrderErrorState(this.error);
}
