import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:man_shop_app/data/models/order/order_details_model.dart';
import 'package:man_shop_app/data/models/order/order_model.dart';
import 'package:man_shop_app/data/repositories/order/order_repository.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepository) : super(OrderInitial());

  OrderRepository orderRepository;
  OrderModel? orderModel;
  OrderDetailsModel? orderDetailsModel;
  final refreshController = RefreshController();

  Future<void> getOrders() async {
    emit(OrderLoadingState());
    try {
      orderModel = await orderRepository.getOrders();
      emit(OrderSuccessState());
    } catch (e, s) {
      log('getOrders error', error: e, stackTrace: s);
      emit(OrderErrorState(e.toString()));
    }
  }

  Future<void> getOrderDetails(int id) async {
    emit(OrderLoadingState());
    try {
      orderDetailsModel = await orderRepository.getOrderDetails(id);
      emit(OrderSuccessState());
    } catch (e, s) {
      log('getOrderDetails error', error: e, stackTrace: s);
      emit(OrderErrorState(e.toString()));
    }
  }



}
