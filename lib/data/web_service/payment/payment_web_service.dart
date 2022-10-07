import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:man_shop_app/core/utils/app_strings.dart';
import 'package:man_shop_app/data/models/payment/promo_code_model.dart';
import 'package:man_shop_app/shared/components/constants.dart';
import 'package:man_shop_app/shared/utils/server_utils.dart';

class PaymentWebService {
  Future<Map<String, dynamic>> addOrder(
      {required int addressId, required int paymentMethod, required bool usePoints,}) async {
    const String url = AppStrings.url + 'order';
    final headers = {
      "Authorization": AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({
        'use_points': usePoints,
        'address_id': addressId,
        'payment_method': paymentMethod,
      }),
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('addOrder  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['data'];
    } else {
      throw getErrorMessage(data);
    }
  }

  Future<Map<String, dynamic>> getEstimateData(
      {required bool usePoints, required int promoCodeId}) async {
    const String url = AppStrings.url + 'estimate-order';
    final headers = {
      "Authorization": AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({
        'use_points': usePoints,
        'promo_code_id': promoCodeId,
      }),
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('getEstimateData  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['data'];
    } else {
      throw getErrorMessage(data);
    }
  }

  Future<Map<String, dynamic>> validatePromoCode({required String code}) async {
    const String url = AppStrings.url + 'promo-codes/validate';
    final headers = {
      "Authorization": AppConst.token,
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({'code': code}),
    );
    final data = json.decode(response.body) as Map<String, dynamic>;
    log('validatePromoCode  ****************: ${data.toString()}');
    if (data['status'] == true) {
      return data['data'];
    } else {
      throw getErrorMessage(data);
    }
  }
}
