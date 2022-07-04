import 'dart:convert';
import 'dart:developer';
import 'package:man_shop_app/core/utils/app_strings.dart';
import 'package:http/http.dart' as http;
import 'package:man_shop_app/shared/network/local/cache_helper.dart';
import 'package:man_shop_app/shared/utils/server_utils.dart';

class RegisterWebService{

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    const String url = AppStrings.url + 'register';
    final headers = {
      //"Authorization":  AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      }),
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('getHomeData  ****************: ${data.toString()}');
    if (data['status'] == true) {
      CacheHelper.saveData(
        key: 'token',
        value: data['data']['token'],
      );
      return data;
    } else {
      throw getErrorMessage(data);
    }
  }
}