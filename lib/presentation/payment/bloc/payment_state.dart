part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
class PaymentLoadingState extends PaymentState {}
class PaymentAddOrderLoadingState extends PaymentState {}
class PaymentEstimateLoadingState extends PaymentState {}
class PaymentPromoCodeLoadingState extends PaymentState {}
class PaymentSuccessState extends PaymentState {}
class PaymentAddOrderSuccessState extends PaymentState {}
class PaymentErrorState extends PaymentState {
  final String error;
  PaymentErrorState(this.error);
}
