class GrafikLKResponse {
  late final List<GrafikLK>? mintigasd;
  late final List<GrafikLK> minduasd;
  late final List<GrafikLK> minsatusd;
  late final List<GrafikLK> median;
  late final List<GrafikLK> tigasd;
  late final List<GrafikLK> duasd;
  late final List<GrafikLK> satusd;

  GrafikLKResponse(
      {this.mintigasd,
        required this.minduasd,
        required this.minsatusd,
        required this.median,
        required this.tigasd,
        required this.duasd,
        required this.satusd});

  GrafikLKResponse.fromJson(Map<String, dynamic> json) {
    mintigasd = (json['-3 SD'] as Iterable)
        .map((e) => GrafikLK.fromJson(e))
        .toList();
    minduasd = (json['-2 SD'] as Iterable)
        .map((e) => GrafikLK.fromJson(e))
        .toList();
    minsatusd = (json['-1 SD'] as Iterable)
        .map((e) => GrafikLK.fromJson(e))
        .toList();
    median = (json['Median'] as Iterable)
        .map((e) => GrafikLK.fromJson(e))
        .toList();
    tigasd = (json['3 SD'] as Iterable)
        .map((e) => GrafikLK.fromJson(e))
        .toList();
    duasd = (json['2 SD'] as Iterable)
        .map((e) => GrafikLK.fromJson(e))
        .toList();
    satusd = (json['1 SD'] as Iterable)
        .map((e) => GrafikLK.fromJson(e))
        .toList();
  }
}

class GrafikLK {
  int? id;
  double? lk;
  int? bulan;
  String? jenis;
  String? gender;
  dynamic checked_at;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;

  GrafikLK(
      {this.id,
        this.lk,
        this.bulan,
        this.jenis,
        this.gender,
        this.checked_at,
        this.created_at,
        this.updated_at,
        this.deleted_at});

  GrafikLK.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lk = json['lingkar'].toDouble();
    bulan = json['bulan'];
    jenis = json['jenis'];
    gender = json['gender'];
    checked_at = json['checked_at'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }
}
