import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

Future<http.Response> getLocationData(String text) async {
  http.Response response;
  response = await http.get(
    Uri.parse("http://mvs.bslmeiyu.com/api/v1/config/place-api-autocomplete?saerch_text=$text"),
    headers: {"Content-type": "application/json"},
  );
  log(jsonDecode(response.body));
  return response;
}
