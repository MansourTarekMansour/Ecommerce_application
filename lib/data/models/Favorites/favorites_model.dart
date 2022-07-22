
import 'package:man_shop_app/data/models/home/home_model.dart';

class FavoritesModel {
  FavoritesModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  late final int currentPage;
  late final List<Data> data;
  late final String firstPageUrl;
  late final int from;
  late final int lastPage;
  late final String lastPageUrl;
  late final Null nextPageUrl;
  late final String path;
  late final int perPage;
  late final Null prevPageUrl;
  late final int to;
  late final int total;

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
        currentPage: json['current_page'],
        data: List.from(json['data']).map((e)=> Data.fromJson(e)).toList(),
        firstPageUrl: json['first_page_url'],
        from: json['from'],
        lastPage: json['last_page'],
        lastPageUrl: json['last_page_url'],
        nextPageUrl: json['next_page_url'],
        path: json['path'],
        perPage: json['per_page'],
        prevPageUrl: json['prev_page_url'],
        to: json['to'],
        total: json['total'],
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['data'] = data;
    _data['first_page_url'] = firstPageUrl;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['last_page_url'] = lastPageUrl;
    _data['next_page_url'] = nextPageUrl;
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['prev_page_url'] = prevPageUrl;
    _data['to'] = to;
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