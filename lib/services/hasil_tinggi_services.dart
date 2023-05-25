import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/api_return_hasil_tinggi.dart';
import '../Models/model_hasil_tinggi.dart';

class HasilTinggiServices {
  static Future<ApiReturnHasilTinggi<SemuaHasilTinggi>?> getHasilTinggi(
      String token, String gender, String anak_id,
      {http.Client? client}) async {
    String baseUrl =
        'https://dashboard.parentoday.com/api/jurnal/pertumbuhan/result/tinggi?anak_id=${anak_id}&gender=${gender}';
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl;
    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': '${token}'
    });
    print('kutruk' + response.body.toString());
    if (response.statusCode != 200) {
      return ApiReturnHasilTinggi(message: 'Please try Again');
    }
    var data = jsonDecode(response.body);
    SemuaHasilTinggi value = SemuaHasilTinggi.fromJson(data['data']);
//jika backand berbentuk list
//     List<HasilTinggi> value =
//         (data['data'] as Iterable).map((e) => HasilTinggi.fromJson(e)).toList();
//jika backand tidak berbentuk list
    //CommunityGroup value1 = CommunityGroup.fromJson(data['data']);
    return ApiReturnHasilTinggi(value: value);
  }
}
