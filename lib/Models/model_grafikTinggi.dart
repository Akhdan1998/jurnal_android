class GrafikTinggiResponse {
  late final List<GrafikTinggi>? mintigasd;
  late final List<GrafikTinggi> minduasd;
  late final List<GrafikTinggi> minsatusd;
  late final List<GrafikTinggi> median;
  late final List<GrafikTinggi> tigasd;
  late final List<GrafikTinggi> duasd;
  late final List<GrafikTinggi> satusd;

  GrafikTinggiResponse(
      {this.mintigasd,
      required this.minduasd,
      required this.minsatusd,
      required this.median,
      required this.tigasd,
      required this.duasd,
      required this.satusd});

  GrafikTinggiResponse.fromJson(Map<String, dynamic> json) {
    mintigasd = (json['-3 SD'] as Iterable)
        .map((e) => GrafikTinggi.fromJson(e))
        .toList();
    minduasd = (json['-2 SD'] as Iterable)
        .map((e) => GrafikTinggi.fromJson(e))
        .toList();
    minsatusd = (json['-1 SD'] as Iterable)
        .map((e) => GrafikTinggi.fromJson(e))
        .toList();
    median = (json['Median'] as Iterable)
        .map((e) => GrafikTinggi.fromJson(e))
        .toList();
    tigasd = (json['3 SD'] as Iterable)
        .map((e) => GrafikTinggi.fromJson(e))
        .toList();
    duasd = (json['2 SD'] as Iterable)
        .map((e) => GrafikTinggi.fromJson(e))
        .toList();
    satusd = (json['1 SD'] as Iterable)
        .map((e) => GrafikTinggi.fromJson(e))
        .toList();
  }
}

class GrafikTinggi {
  int? id;
  double? tinggi;
  int? bulan;
  String? jenis;
  String? gender;
  dynamic checked_at;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;

  GrafikTinggi(
      {this.id,
      this.tinggi,
      this.bulan,
      this.jenis,
      this.gender,
      this.checked_at,
      this.created_at,
      this.updated_at,
      this.deleted_at});

  GrafikTinggi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tinggi = json['tinggi'].toDouble();
    bulan = json['bulan'];
    jenis = json['jenis'];
    gender = json['gender'];
    checked_at = json['checked_at'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = id;
    data['tinggi'] = tinggi;
    data['bulan'] = bulan;
    data['jenis'] = jenis;
    data['gender'] = gender;
    data['checked_at'] = checked_at;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    return data;
  }
}
