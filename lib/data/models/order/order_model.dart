class OrderModel {
  OrderModel({
    required this.data,

  });
  late final List<Data> data;


  OrderModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.total,
    required this.date,
    required this.status,
  });
  late final int id;
  late final int? total;
  late final String date;
  late final String status;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    total = json['total'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['total'] = total;
    _data['date'] = date;
    _data['status'] = status;
    return _data;
  }
}