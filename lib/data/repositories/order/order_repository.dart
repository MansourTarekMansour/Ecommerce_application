import 'package:man_shop_app/data/models/order/order_details_model.dart';
import 'package:man_shop_app/data/models/order/order_model.dart';
import 'package:man_shop_app/data/web_service/order/order_web_service.dart';

class OrderRepository {

  OrderRepository(this.orderWebService);
  OrderWebService orderWebService;

  Future<OrderModel> getOrders() async {
    final data = await orderWebService.getOrders();
    return OrderModel.fromJson(data);
  }

  Future<OrderDetailsModel> getOrderDetails(int id) async {
    final data = await orderWebService.getOrderDetails(id);
    return OrderDetailsModel.fromJson(data);
  }
}
