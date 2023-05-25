import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/api_return_grafikTinggi.dart';
import '../Models/model_grafikTinggi.dart';

class GrafikTinggiServices {
  static Future<ApiReturnGrafikTinggi<GrafikTinggiResponse>?> getGrafikTinggi(
      String token, String gender,
      {http.Client? client}) async {
    String baseUrl =
        'https://dashboard.parentoday.com/api/jurnal/pertumbuhan/grafik/tinggi?gender=${gender}';
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl;
    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': '${token}'
    });
    print(response.body.toString());
    if (response.statusCode != 200) {
      return ApiReturnGrafikTinggi(message: 'Please try Again');
    }
    var data = jsonDecode(response.body);
//jika backand berbentuk list
    GrafikTinggiResponse value = GrafikTinggiResponse.fromJson(data['data']);
//jika backand tidak berbentuk list
    //CommunityGroup value1 = CommunityGroup.fromJson(data['data']);
    return ApiReturnGrafikTinggi(value: value);
  }
}
