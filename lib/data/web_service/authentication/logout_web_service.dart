import 'dart:developer';
import 'package:man_shop_app/shared/network/end_points.dart';
import 'package:man_shop_app/shared/network/local/cache_helper.dart';
import 'package:man_shop_app/shared/network/remote/dio_helper.dart';

class LogoutWebService {
  Future<Map<String, dynamic>> logout() async {
    log(CacheHelper.getData(key: 'token'));
    final response = await DioHelper.postData(
      url: 'logout',
      token: CacheHelper.getData(key: 'token'),
    );
    final data = response?.data as Map<String, dynamic>;
    log(data.toString());
    if (data['status']) {
      return data;
    } else {
      throw data['message'];
    }
  }
}
