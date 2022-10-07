import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:man_shop_app/data/models/payment/add_order_model.dart';
import 'package:man_shop_app/data/models/payment/estimate_order_model.dart';
import 'package:man_shop_app/data/models/payment/promo_code_model.dart';
import 'package:man_shop_app/data/repositories/payment/payment_repository.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentRepository) : super(PaymentInitial());
  PaymentRepository paymentRepository;
  late EstimateOrderModel estimateOrderModel;
  late AddOrderModel addOrderModel;
  late ValidatePromoCodeModel validatePromoCodeModel;
  int paymentType = 0;
  bool usePoints = false;
  bool usePromoCode = false;
  bool promoCodeValidate = false;
  int promoCodeId = 0;
  int addressIndex = -1;
  int addressId = -1;
  final TextEditingController promoCodeController = TextEditingController();

  Future<void> addOrder() async {
    emit(PaymentAddOrderLoadingState());
    try {
      addOrderModel = await paymentRepository.addOrder(
        usePoints: usePoints,
        paymentMethod: paymentType,
        addressId: addressId,
      );
      emit(PaymentAddOrderSuccessState());
    } catch (error, s) {
      log('addOrder error', error: error, stackTrace: s);
      emit(PaymentErrorState(error.toString()));
    }
  }

  void getEstimate() {
    emit(PaymentLoadingState());
    setEstimateData();
  }

  Future<void> setEstimateData() async {
    try {
      estimateOrderModel = await paymentRepository.getEstimateData(
        usePoints: usePoints,
        promoCodeId: promoCodeId,
      );
      emit(PaymentSuccessState());
    } catch (error, s) {
      log('setEstimateData error', error: error, stackTrace: s);
      emit(PaymentErrorState(error.toString()));
    }
  }

  Future<void> checkPromoCodeValidate(String promoCode) async {
    emit(PaymentPromoCodeLoadingState());
    try {
      validatePromoCodeModel =
          await paymentRepository.validatePromoCode(code: promoCode);
      promoCodeValidate = true;
      promoCodeId = validatePromoCodeModel.id;
      emit(PaymentSuccessState());
    } catch (error, s) {
      log('checkPromoCodeValidate error', error: error, stackTrace: s);
      promoCodeValidate = false;
      emit(PaymentErrorState(error.toString()));
    }
  }

  void setPaymentType(int choose) {
    paymentType = choose;
    setEstimateData();
    emit(PaymentSuccessState());
  }

  void changeDiscountPoints(bool value) {
    usePoints = value;
    emit(PaymentSuccessState());
  }

  void changePromoCode(bool value) {
    usePromoCode = value;
    promoCodeId = 0;
    emit(PaymentSuccessState());
  }

  void setAddressIndex(int index, int id) {
    addressIndex = index;
    addressId = id;
    emit(PaymentSuccessState());
  }

  bool validate() {
    if (paymentType != 0 &&
        ((usePromoCode == true && promoCodeValidate) || !usePromoCode) &&
        addressIndex != -1) {
      return true;
    }
    return false;
  }
}
