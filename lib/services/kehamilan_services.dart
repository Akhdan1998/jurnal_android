import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/api_return_kehamilan.dart';
import '../Models/model_kehamilan.dart';

String baseUrl = 'https://dashboard.parentoday.com/api/jurnal/kehamilan';

class KehamilanServices {
  static Future<ApiReturnKehamilan<Kelahiran>> dataGet(String token,
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
      return ApiReturnKehamilan(message: 'Please try Again');
    }
    print(response);
    print(response.statusCode);
    print(response.body);

    var data = jsonDecode(response.body);
    // Kelahiran value = Kelahiran.fromJson(data['data']);
//jika backand berbentuk list
//     List<Kelahiran> value =
//         (data['data'] as Iterable).map((e) => Kelahiran.fromJson(e)).toList();
//jika backand tidak berbentuk list
    Kelahiran? value =
        (data['data'] != null) ? Kelahiran.fromJson(data['data']) : null;
    return ApiReturnKehamilan(value: value);
  }
}
