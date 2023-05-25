class GrafikBeratResponse {
  late final List<GrafikBerat>? mintigasd;
  late final List<GrafikBerat> minduasd;
  late final List<GrafikBerat> minsatusd;
  late final List<GrafikBerat> median;
  late final List<GrafikBerat> tigasd;
  late final List<GrafikBerat> duasd;
  late final List<GrafikBerat> satusd;

  GrafikBeratResponse(
      {this.mintigasd,
      required this.minduasd,
      required this.minsatusd,
      required this.median,
      required this.tigasd,
      required this.duasd,
      required this.satusd});

  GrafikBeratResponse.fromJson(Map<String, dynamic> json) {
    mintigasd = (json['-3 SD'] as Iterable)
        .map((e) => GrafikBerat.fromJson(e))
        .toList();
    minduasd = (json['-2 SD'] as Iterable)
        .map((e) => GrafikBerat.fromJson(e))
        .toList();
    minsatusd = (json['-1 SD'] as Iterable)
        .map((e) => GrafikBerat.fromJson(e))
        .toList();
    median = (json['Median'] as Iterable)
        .map((e) => GrafikBerat.fromJson(e))
        .toList();
    tigasd =
        (json['3 SD'] as Iterable).map((e) => GrafikBerat.fromJson(e)).toList();
    duasd =
        (json['2 SD'] as Iterable).map((e) => GrafikBerat.fromJson(e)).toList();
    satusd =
        (json['1 SD'] as Iterable).map((e) => GrafikBerat.fromJson(e)).toList();
  }
}

class GrafikBerat {
  int? id;
  double? berat;
  int? bulan;
  String? jenis;
  String? gender;
  dynamic checked_at;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;

  GrafikBerat(
      {this.id,
      this.berat,
      this.bulan,
      this.jenis,
      this.gender,
      this.checked_at,
      this.created_at,
      this.updated_at,
      this.deleted_at});

  GrafikBerat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    berat = json['berat'].toDouble();
    bulan = json['bulan'];
    jenis = json['jenis'];
    gender = json['gender'];
    checked_at = json['checked_at'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }
}
