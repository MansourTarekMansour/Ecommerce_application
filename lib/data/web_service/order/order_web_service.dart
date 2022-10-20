import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:man_shop_app/core/utils/app_strings.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:man_shop_app/shared/utils/server_utils.dart';

class OrderWebService {
  Future<Map<String, dynamic>> getOrders() async {
    const String url = AppStrings.url + 'orders';
    final headers = {
      "Authorization": AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('getOrders  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['data'];
    } else {
      throw getErrorMessage(data);
    }
  }

  Future<Map<String, dynamic>> getOrderDetails(int id) async {
    final String url = AppStrings.url + 'orders/${id.toString()}' ;
    final headers = {
      "Authorization": AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('getOrderDetails  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['data'];
    } else {
      throw getErrorMessage(data);
    }
  }
}
