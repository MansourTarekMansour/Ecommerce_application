class ValidatePromoCodeModel {
  ValidatePromoCodeModel({
    required this.id,
    required this.code,
    required this.value,
    this.percentage,
    required this.startDate,
    required this.endDate,
    required this.usagePerUser,
  });
  late final int id;
  late final String code;
  late final int value;
  late final Null percentage;
  late final String startDate;
  late final String endDate;
  late final int usagePerUser;

  ValidatePromoCodeModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    code = json['code'];
    value = json['value'];
    percentage = json['percentage'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    usagePerUser = json['usage_per_user'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['code'] = code;
    _data['value'] = value;
    _data['percentage'] = percentage;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['usage_per_user'] = usagePerUser;
    return _data;
  }
}