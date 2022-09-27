class ProfileModel {
  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String image;
  late final int points;
  late final double credit;
  late final String token;

  ProfileModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['image'] = image;
    _data['points'] = points;
    _data['credit'] = credit;
    _data['token'] = token;
    return _data;
  }
}