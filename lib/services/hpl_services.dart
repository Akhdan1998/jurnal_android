import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jurnal_android/Models/model_hpl.dart';
import '../Models/api_return_hpl.dart';

String baseUrl =
    'https://dashboard.parentoday.com/api/jurnal/kehamilan/hpl?hpht=2023-02-23';

class HplServices {
  static Future<ApiReturnHpl<Hpl>> getHpl(String token,
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
      return ApiReturnHpl(message: 'Please try Again');
    }
    print(response);
    print(response.statusCode);
    print(response.body);
    var data = jsonDecode(response.body);
//jika backand berbentuk list
//     List<Kelahiran> value =
//         (data['data'] as Iterable).map((e) => Kelahiran.fromJson(e)).toList();
//jika backand tidak berbentuk list
    Hpl value = Hpl.fromJson(data['data']);
    return ApiReturnHpl(value: value);
  }
}
