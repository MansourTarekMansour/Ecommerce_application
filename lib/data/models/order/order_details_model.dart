class OrderDetailsModel {
  OrderDetailsModel({
    required this.id,
    required this.cost,
    required this.discount,
    required this.points,
    required this.vat,
    required this.total,
    required this.pointsCommission,
    required this.promoCode,
    required this.paymentMethod,
    required this.date,
    required this.status,
    required this.address,
    required this.products,
  });
  late final int id;
  late final int cost;
  late final int discount;
  late final int points;
  late final double vat;
  late final int total;
  late final int pointsCommission;
  late final String promoCode;
  late final String paymentMethod;
  late final String date;
  late final String status;
  late final Address address;
  late final List<Products> products;

  OrderDetailsModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    cost = json['cost'];
    discount = json['discount'];
    points = json['points'];
    vat = json['vat'];
    total = json['total'];
    pointsCommission = json['points_commission'];
    promoCode = json['promo_code'];
    paymentMethod = json['payment_method'];
    date = json['date'];
    status = json['status'];
    address = Address.fromJson(json['address']);
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['cost'] = cost;
    _data['discount'] = discount;
    _data['points'] = points;
    _data['vat'] = vat;
    _data['total'] = total;
    _data['points_commission'] = pointsCommission;
    _data['promo_code'] = promoCode;
    _data['payment_method'] = paymentMethod;
    _data['date'] = date;
    _data['status'] = status;
    _data['address'] = address.toJson();
    _data['products'] = products.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Address {
  Address({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    this.notes,
    required this.latitude,
    required this.longitude,
  });
  late final int id;
  late final String name;
  late final String city;
  late final String region;
  late final String details;
  late final Null notes;
  late final int latitude;
  late final int longitude;

  Address.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    notes = json['notes'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['city'] = city;
    _data['region'] = region;
    _data['details'] = details;
    _data['notes'] = notes;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    return _data;
  }
}

class Products {
  Products({
    required this.id,
    required this.quantity,
    required this.price,
    required this.name,
    required this.image,
  });
  late final int id;
  late final int quantity;
  late final int price;
  late final String name;
  late final String image;

  Products.fromJson(Map<String, dynamic> json){
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['quantity'] = quantity;
    _data['price'] = price;
    _data['name'] = name;
    _data['image'] = image;
    return _data;
  }
}