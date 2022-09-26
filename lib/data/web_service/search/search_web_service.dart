import 'dart:convert';
import 'dart:developer';
import 'package:man_shop_app/core/utils/app_strings.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:http/http.dart' as http;
import 'package:man_shop_app/shared/utils/server_utils.dart';

class SearchWebService{
  Future<Map<String, dynamic>> getSearchData(String searchText) async {
    const String url = AppStrings.url + 'products/search';
    final headers = {
      "Authorization": AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({'text': searchText}),
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('getSearchData  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['data'];
    } else {
      throw getErrorMessage(data);
    }
  }
}