import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/model_imunisasi.dart';
import '../models/api_return_velue.dart';

String baseUrl =
    'https://dashboard.parentoday.com/api/jurnal/imunisasi';

class ImunisasiServices {
  static Future<ApiReturnValue<List<ImunisasiGroup>>?> getImunisasi(
      String token,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl;

    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': '${token}'
    });
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try Again');
    }
    var data = jsonDecode(response.body);
//jika backand berbentuk list
    List<ImunisasiGroup> value = (data['data'] as Iterable)
        .map((e) => ImunisasiGroup.fromJson(e))
        .toList();
//jika backand tidak berbentuk list
    //CommunityGroup value1 = CommunityGroup.fromJson(data['data']);
    return ApiReturnValue(value: value);
  }
}
