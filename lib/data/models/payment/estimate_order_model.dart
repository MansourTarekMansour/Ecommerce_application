class EstimateOrderModel {
  EstimateOrderModel({
    required this.subTotal,
    required this.discount,
    required this.points,
    required this.total,
  });
  late final int subTotal;
  late final int discount;
  late final dynamic points;
  late final dynamic total;

  EstimateOrderModel.fromJson(Map<String, dynamic> json){
    subTotal = json['sub_total'];
    discount = json['discount'];
    points = json['points'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sub_total'] = subTotal;
    _data['discount'] = discount;
    _data['points'] = points;
    _data['total'] = total;
    return _data;
  }
}