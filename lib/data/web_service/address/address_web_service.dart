import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:man_shop_app/core/utils/app_strings.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:man_shop_app/shared/utils/server_utils.dart';

// Future<http.Response> getLocationData(String text) async {
//   http.Response response;
//   response = await http.get(
//     Uri.parse("http://mvs.bslmeiyu.com/api/v1/config/place-api-autocomplete?saerch_text=$text"),
//     headers: {"Content-type": "application/json"},
//   );
//   log(jsonDecode(response.body));
//   return response;
// }

class AddressWebService {
  Future<Map<String, dynamic>> getAddressData() async {
    const String url = AppStrings.url + 'addresses';
    log('AppConst.token: ' + AppConst.token);
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
    log('getAddressData  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['data'];
    } else {
      throw getErrorMessage(data);
    }
  }

  Future<String> deleteAddress(int id) async {
    final String url = AppStrings.url + 'addresses/${id.toString()}';
    log('AppConst.token: ' + AppConst.token);
    final headers = {
      "Authorization": AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final http.Response response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('deleteAddress  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['message'];
    } else {
      throw getErrorMessage(data);
    }
  }

  Future<String> addAddress({
    required String name,
    required String city,
    required String region,
    required String details,
    required String notes,
    required double latitude,
    required double longitude,
  }) async {
    const String url = AppStrings.url + 'addresses';
    log('AppConst.token: ' + AppConst.token);
    final headers = {
      "Authorization": AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final http.Response response;
    if (notes != "null") {
      response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode({
          'name': name,
          'city': city,
          'region': region,
          'details': details,
          'notes': notes,
          'latitude': latitude,
          'longitude': longitude,
        }),
      );
    } else {
      response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode({
          'name': name,
          'city': city,
          'region': region,
          'details': details,
          'latitude': latitude,
          'longitude': longitude,
        }),
      );
    }
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('addAddress  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['message'];
    } else {
      throw getErrorMessage(data);
    }
  }
}
