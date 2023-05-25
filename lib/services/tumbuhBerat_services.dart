import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/api_return_tumbuhberat.dart';
import '../Models/model_tumbuhBerat.dart';

class tumbuhBeratServices {
  static Future<ApiReturntumbuhBerat<List<TumbuhBerat>>?> gettumbuhBerat(
      String token, String anak_id,
      {http.Client? client}) async {
    String baseUrl =
        'https://dashboard.parentoday.com/api/jurnal/pertumbuhan/berat?anak_id=${anak_id}';
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl;
    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': '${token}'
    });
    if (response.statusCode != 200) {
      return ApiReturntumbuhBerat(message: 'Please try Again');
    }
    var data = jsonDecode(response.body);
//jika backand berbentuk list
    List<TumbuhBerat> value =
        (data['data'] as Iterable).map((e) => TumbuhBerat.fromJson(e)).toList();
//jika backand tidak berbentuk list
    //CommunityGroup value1 = CommunityGroup.fromJson(data['data']);
    return ApiReturntumbuhBerat(value: value);
  }
}
