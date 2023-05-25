import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jurnal_android/Models/api_return_buatdataanak.dart';
import 'package:jurnal_android/Models/model_buatdataanak.dart';

String baseUrl =
    'https://dashboard.parentoday.com/api/anak';

class BuatDataServices {
  static Future<ApiReturnBuatAnak<List<BuatDataAnak>>?> getData(
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

    print("JANCUK" + response.body.toString());

    if (response.statusCode != 200) {
      return ApiReturnBuatAnak(message: 'Please try Again');
    }
    var data = jsonDecode(response.body);

//jika backand berbentuk list
    List<BuatDataAnak> value = (data['data'] as Iterable)
        .map((e) => BuatDataAnak.fromJson(e))
        .toList();
//jika backand tidak berbentuk list
    //CommunityGroup value1 = CommunityGroup.fromJson(data['data']);
    return ApiReturnBuatAnak(value: value);
  }
}
