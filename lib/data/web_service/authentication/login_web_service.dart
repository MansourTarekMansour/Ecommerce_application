import 'dart:developer';
import 'package:man_shop_app/shared/network/end_points.dart';
import 'package:man_shop_app/shared/network/remote/dio_helper.dart';

class LoginWebService{

  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    final response = await DioHelper.postData(url: loginUrl, data: {
      'email': email,
      'password': password,
    });
    final data = response?.data as Map<String, dynamic>;
    log(data.toString());
    if (data['status']) {
      return data ;
    } else {
      throw data['message'];
    }
  }
}