class HomeModel {
  HomeModel({
    required this.status,
    required this.data,
  });

  final bool status;
  final Data data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json['status'] as bool,
        data: Data.fromJson(json['data']),
      );
}

class Data {
  Data({
    required this.banners,
    required this.products,
    required this.ad,
  });

  final List<Banners> banners;
  final List<Products> products;
  final String ad;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners:
            List.from(json['banners']).map((e) => Banners.fromJson(e)).toList(),
        products: List.from(json['products'])
            .map((e) => Products.fromJson(e))
            .toList(),
        ad: json['ad'],
      );
}

class Banners {
  Banners({
    required this.id,
    required this.image,
  });

  final int id;
  final String image;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json['id'],
        image: json['image'],
      );
}

class Products {
  Products({
    required this.id,
    this.itemCount = 1,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  final int id;
  int itemCount;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  List<String> images;
  bool inFavorites;
  late bool inCart;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        description: json['description'],
        images: List.castFrom<dynamic, String>(json['images'] ?? []),
        inFavorites: json['in_favorites'] ?? true,
        inCart: json['in_cart'] ?? false,
      );
}
