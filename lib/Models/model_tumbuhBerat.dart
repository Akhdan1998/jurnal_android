class TumbuhBerat {
  int? id;
  String? user_id;
  String? anak_id;
  double? tinggi;
  double? berat;
  double? lingkar_kepala;
  dynamic checked_at;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;

  TumbuhBerat(
      {this.id,
      this.user_id,
      this.anak_id,
      this.tinggi,
      this.berat,
      this.lingkar_kepala,
      this.checked_at,
      this.created_at,
      this.updated_at,
      this.deleted_at});

  TumbuhBerat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    anak_id = json['anak_id'];
    tinggi = (json['tinggi'] != null) ? json['tinggi'].toDouble() : 0.0;
    berat = (json['berat'] != null) ? json['berat'].toDouble() : 0.0;
    lingkar_kepala = (json['lingkar_kepala'] != null)
        ? json['lingkar_kepala'].toDouble()
        : 0.0;
    checked_at = json['checked_at'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = user_id;
    data['anak_id'] = anak_id;
    data['tinggi'] = tinggi;
    data['berat'] = berat;
    data['lingkar_kepala'] = lingkar_kepala;
    data['checked_at'] = checked_at;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    return data;
  }
}
