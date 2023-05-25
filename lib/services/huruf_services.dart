import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/api_return_huruf.dart';
import '../Models/model_huruf.dart';

class HurufServices {
  static Future<ApiReturnHuruf<List<Huruf>>?> getHuruf(
      String token, String hurufawalan, String selectedKelamin, String kategori,
      {http.Client? client}) async {
    String baseUrl =
        'https://dashboard.parentoday.com/api/jurnal/name_finder?huruf_awalan=$hurufawalan&kategori=$kategori&gender=$selectedKelamin';
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl;
    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': '${token}'
    });
    if (response.statusCode != 200) {
      print(response.toString());
      return ApiReturnHuruf(message: "Please try Again");
    }
    var data = jsonDecode(response.body);
//jika backand berbentuk list
    List<Huruf> value =
        (data['data'] as Iterable).map((e) => Huruf.fromJson(e)).toList();
    return ApiReturnHuruf(value: value);
  }
}
