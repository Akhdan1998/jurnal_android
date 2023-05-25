import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/api_return_tumbuhLk.dart';
import '../Models/model_tumbuhLk.dart';

class tumbuhLkServices {
  static Future<ApiReturntumbuhLk<List<TumbuhLk>>?> gettumbuhLk(
      String token, String anak_id,
      {http.Client? client}) async {
    String baseUrl =
        'https://dashboard.parentoday.com/api/jurnal/pertumbuhan/lingkar?anak_id=${anak_id}';
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl;
    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': '${token}'
    });
    if (response.statusCode != 200) {
      return ApiReturntumbuhLk(message: 'Please try Again');
    }
    var data = jsonDecode(response.body);
//jika backand berbentuk list
    List<TumbuhLk> value =
        (data['data'] as Iterable).map((e) => TumbuhLk.fromJson(e)).toList();
//jika backand tidak berbentuk list
    //CommunityGroup value1 = CommunityGroup.fromJson(data['data']);
    return ApiReturntumbuhLk(value: value);
  }
}
