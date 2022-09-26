import 'package:man_shop_app/data/models/home/home_model.dart';

class SearchModel {
  SearchModel({
    required this.currentPage,
    required this.data,
    required this.total,
  });
  late final int currentPage;
  late final List<Products> data;
  late final int total;

  SearchModel.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    data = List.from(json['data']).map((e)=>Products.fromJson(e)).toList();
    total = json['total'];
  }
}