import 'package:man_shop_app/data/models/home/home_model.dart';

class CartModel {
  CartModel({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });
  late final List<CartItems> cartItems;
  late final int subTotal;
  late final int total;

  CartModel.fromJson(Map<String, dynamic> json){
    cartItems = List.from(json['cart_items'] ?? []).map((e)=>CartItems.fromJson(e)).toList();
    subTotal = json['sub_total'] ?? 0;
    total = json['total'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cart_items'] = cartItems.map((e)=>e.toJson()).toList();
    _data['sub_total'] = subTotal;
    _data['total'] = total;
    return _data;
  }
}

class CartItems {
  CartItems({
    required this.id,
    required this.quantity,
    required this.product,
  });
  late final int id;
  late int quantity;
  late final Products product;

  CartItems.fromJson(Map<String, dynamic> json){
    id = json['id'];
    quantity = json['quantity'];
    product = Products.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['quantity'] = quantity;
    return _data;
  }
}
