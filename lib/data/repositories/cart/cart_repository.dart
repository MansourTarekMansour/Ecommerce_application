

import 'package:man_shop_app/data/models/cart/cart_model.dart';
import 'package:man_shop_app/data/web_service/cart/cart_web_service.dart';

class CartRepository{
  CartWebService cartWebService;
  CartRepository(this.cartWebService);

  Future<CartModel> getCartData() async {
    final data = await cartWebService.getCartData();
    return CartModel.fromJson(data);
  }

  Future<String> isFavorite(int id) async {
    final data = await cartWebService.isCart(id);
    return data;
  }

  Future<String> itemAmount(int amount, int id) async {
    final data = await cartWebService.itemAmount(amount, id);
    return data;
  }
}