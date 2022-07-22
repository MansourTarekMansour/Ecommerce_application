import 'dart:convert';
import 'dart:developer';

import 'package:man_shop_app/core/utils/app_strings.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:http/http.dart' as http;
import 'package:man_shop_app/shared/utils/server_utils.dart';

class CartWebService{

  Future<Map<String, dynamic>> getCartData() async {
    const String url = AppStrings.url + 'carts';
    final headers = {
      "Authorization":  AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('getCartData  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data;
    } else {
      throw getErrorMessage(data);
    }
  }


  Future<String> isCart(int id) async {
    const String url = AppStrings.url + 'carts';
    final headers = {
      "Authorization":  AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({
        'product_id': id,
      }),
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('isCart  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['message'];
    } else {
      throw getErrorMessage(data);
    }
  }
}