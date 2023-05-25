import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/api_return_hasil_berat.dart';
import '../Models/model_hasil_berat.dart';

class HasilBeratServices {
  static Future<ApiReturnHasilBerat<SemuaHasilBerat>?> getHasilBerat(
      String token, String gender, String anak_id,
      {http.Client? client}) async {
    String baseUrl = 'https://dashboard.parentoday.com/api/jurnal/pertumbuhan/result/berat?anak_id=${anak_id}&gender=${gender}';
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl;
    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': '${token}'
    });
    print('comberan' + response.body.toString());
    if (response.statusCode != 200) {
      return ApiReturnHasilBerat(message: 'Please try Again');
    }
    var data = jsonDecode(response.body);
    SemuaHasilBerat value = SemuaHasilBerat.fromJson(data['data']);
//jika backand berbentuk list
//     List<HasilTinggi> value =
//         (data['data'] as Iterable).map((e) => HasilTinggi.fromJson(e)).toList();
//jika backand tidak berbentuk list
    //CommunityGroup value1 = CommunityGroup.fromJson(data['data']);
    return ApiReturnHasilBerat(value: value);
  }
}
