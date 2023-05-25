import 'package:jurnal_android/Models/api_return_temanama.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl =
    'https://dashboard.parentoday.com/api/jurnal/name_finder/kategori';

class TemaServices {
  static Future<ApiReturnTema<List<String>>?> getTema(String token,
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
      return ApiReturnTema(message: "Please try Again");
    }
    String jsonString = json.encode(['data']);
    List<String> value = List<String>.from(jsonDecode(jsonString));
    return ApiReturnTema(value: value);
  }
}
