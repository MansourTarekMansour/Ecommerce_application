class AddressModel {
  AddressModel({
    required this.data,
  });

  late final List<Data> data;
  AddressModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    this.notes,
    // required this.latitude,
    // required this.longitude,
  });
  late final int id;
  late final String name;
  late final String city;
  late final String region;
  late final String details;
  late final String? notes;
  bool menuOnPress = false;

  // late final double latitude;
  // late final double longitude;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    notes = json['notes'];
    // latitude = json['latitude'];
    // longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['city'] = city;
    _data['region'] = region;
    _data['details'] = details;
    _data['notes'] = notes;
    // _data['latitude'] = latitude;
    // _data['longitude'] = longitude;
    return _data;
  }
}