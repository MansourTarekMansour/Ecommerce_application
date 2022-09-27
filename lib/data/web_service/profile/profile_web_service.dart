import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:man_shop_app/core/utils/app_strings.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:man_shop_app/shared/utils/server_utils.dart';

class ProfileWebService {
  Future<Map<String, dynamic>> getProfileData() async {
    const String url = AppStrings.url + 'profile';
    final headers = {
      "Authorization": AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('getProfileData  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['data'];
    } else {
      throw getErrorMessage(data);
    }
  }

  Future<Map<String, dynamic>> updateUserData({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String image,
  }) async {
    const String url = AppStrings.url + 'update-profile';
    final headers = {
      "Authorization": AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final http.Response response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        'image': image,
      }),
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('updateUserData  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['data'];
    } else {
      throw getErrorMessage(data);
    }
  }
}
