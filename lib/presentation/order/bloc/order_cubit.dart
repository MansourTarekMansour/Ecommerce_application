import 'package:bloc/bloc.dart';
import 'package:man_shop_app/data/models/order/order_details_model.dart';
import 'package:man_shop_app/data/models/order/order_model.dart';
import 'package:man_shop_app/data/repositories/order/order_repository.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepository) : super(OrderInitial());

  OrderRepository orderRepository;
  OrderModel? orderModel;
  OrderDetailsModel? orderDetailsModel;
}
