import '../Models/api_return_milestone.dart';
import '../Models/model_milestone.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = 'https://dashboard.parentoday.com/api/jurnal/milestones';

class MilestoneServices {
  static Future<ApiReturnMilestone<List<Milestones>>?> getMilestone(
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
      return ApiReturnMilestone(message: "Please try Again");
    }
    var data = jsonDecode(response.body);
    List<Milestones> value =
        (data['data'] as Iterable).map((e) => Milestones.fromJson(e)).toList();
    return ApiReturnMilestone(value: value);
  }
}
