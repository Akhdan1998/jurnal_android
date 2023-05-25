import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/api_return_tinggi.dart';
import '../Models/model_tinggi.dart';

class TinggiServices {
  static Future<ApiReturnTinggi<List<Tinggi>>?> getTinggi(String token, String anak_id,
      {http.Client? client}) async {
    String baseUrl =
        'https://dashboard.parentoday.com/api/jurnal/pertumbuhan?anak_id=${anak_id}';
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl;
    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': '${token}'
    });
    if (response.statusCode != 200) {
      return ApiReturnTinggi(message: 'Please try Again');
    }
    var data = jsonDecode(response.body);
//jika backand berbentuk list
    List<Tinggi> value =
        (data['data'] as Iterable).map((e) => Tinggi.fromJson(e)).toList();
//jika backand tidak berbentuk list
    //CommunityGroup value1 = CommunityGroup.fromJson(data['data']);
    return ApiReturnTinggi(value: value);
  }
}
