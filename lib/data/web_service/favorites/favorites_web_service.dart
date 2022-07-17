import 'dart:convert';
import 'dart:developer';

import 'package:man_shop_app/core/utils/app_strings.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:http/http.dart' as http;
import 'package:man_shop_app/shared/utils/server_utils.dart';

class FavoritesWebService{
  Future<Map<String, dynamic>> getFavorites() async {
    const String url = AppStrings.url + 'favorites';
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
    log('getFavorites  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['data'];
    } else {
      throw getErrorMessage(data);
    }
  }
}