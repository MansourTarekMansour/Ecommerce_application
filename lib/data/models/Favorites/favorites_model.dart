
import 'package:man_shop_app/data/models/home/home_model.dart';

class FavoritesModel {
  FavoritesModel({
    required this.currentPage,
    required this.data,
    required this.total,
  });

  late final int currentPage;
  late final List<Data> data;
  late final int total;

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
        currentPage: json['current_page'],
        data: List.from(json['data']).map((e)=> Data.fromJson(e)).toList(),
        total: json['total'],
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['data'] = data;
    _data['total'] = total;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.product,
  });
  late final int id;
  late final Products product;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    product = Products.fromJson(json['product']);
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['id'] = id;
  //   _data['product'] = product.toJson();
  //   return _data;
  // }
}

// class Product {
//   Product({
//     required this.id,
//     required this.price,
//     required this.oldPrice,
//     required this.discount,
//     required this.image,
//     required this.name,
//     required this.description,
//   });
//   late final int id;
//   late final int price;
//   late final int oldPrice;
//   late final int discount;
//   late final String image;
//   late final String name;
//   late final String description;
//
//   Product.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['price'] = price;
//     _data['old_price'] = oldPrice;
//     _data['discount'] = discount;
//     _data['image'] = image;
//     _data['name'] = name;
//     _data['description'] = description;
//     return _data;
//   }
// }