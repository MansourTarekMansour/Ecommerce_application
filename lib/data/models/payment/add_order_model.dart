class AddOrderModel {
  AddOrderModel({
    required this.paymentMethod,
    required this.cost,
    required this.vat,
    required this.discount,
    required this.points,
    required this.total,
    required this.id,
  });
  late final String paymentMethod;
  late final int cost;
  late final double vat;
  late final int discount;
  late final double points;
  late final double total;
  late final int id;

  AddOrderModel.fromJson(Map<String, dynamic> json){
    paymentMethod = json['payment_method'];
    cost = json['cost'];
    vat = json['vat'];
    discount = json['discount'];
    points = json['points'];
    total = json['total'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['payment_method'] = paymentMethod;
    _data['cost'] = cost;
    _data['vat'] = vat;
    _data['discount'] = discount;
    _data['points'] = points;
    _data['total'] = total;
    _data['id'] = id;
    return _data;
  }
}