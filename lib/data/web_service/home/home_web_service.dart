import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:man_shop_app/core/utils/app_strings.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:man_shop_app/shared/utils/server_utils.dart';

class HomeWebService {
  Future<Map<String, dynamic>> getHomeData() async {
    const String url = AppStrings.url + 'home';
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
    log('getHomeData  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data;
    } else {
      throw getErrorMessage(data);
    }
  }

  Future<Map<String, dynamic>> getHomeCategories() async {
    const String url = AppStrings.url + 'categories';
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
    log('getHomeCategories  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data;
    } else {
      throw getErrorMessage(data);
    }
  }

  Future<String> isFavorite(int id) async {
    const String url = AppStrings.url + 'favorites';
    final headers = {
      "Authorization": AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({'product_id': id}),
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('getHomeData  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['message'];
    } else {
      throw getErrorMessage(data);
    }
  }

  Future<bool> inCart(int id) async {
    const String url = AppStrings.url + 'carts';
    final headers = {
      "Authorization": AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({
        'product_id': id,
      }),
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('inCart  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['message'] == 'Added Successfully' ? true : false;
    } else {
      throw getErrorMessage(data);
    }
  }
}
