import 'dart:developer';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:man_shop_app/shared/network/local/cache_helper.dart';
import 'package:man_shop_app/shared/network/remote/dio_helper.dart';

class LoginWebService{

  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    final response = await DioHelper.postData(url: 'login', data: {
      'email': email,
      'password': password,
    });
    final data = response?.data as Map<String, dynamic>;
    log(data.toString());
    if (data['status']) {
      CacheHelper.saveData(
        key: 'token',
        value: data['data']['token'],
      );
      AppConst.token = await CacheHelper.getData(key: 'token') ?? '';
      return data ;
    } else {
      throw data['message'];
    }
  }
}