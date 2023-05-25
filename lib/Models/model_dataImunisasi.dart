class SimpanDataImunisasi {
  String? accessToken;
  String? tokenType;
  SimpanData? dataImun;

  SimpanDataImunisasi({this.accessToken, this.tokenType, this.dataImun});

  SimpanDataImunisasi.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    dataImun = json['dataimun'] != null
        ? SimpanData.fromJson(json['dataimun'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    if (dataImun != null) {
      data['user'] = dataImun!.toJson();
    }
    return data;
  }
}

class SimpanData {
  int? id;
  String? user_id;
  String? imunisasi_id;
  String? merek;
  String? lokasi;
  String? tenaga_kesehatan;
  String? nomor_batch;
  String? checked_at;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;

  SimpanData(
      {this.id,
      this.user_id,
      this.imunisasi_id,
      this.merek,
      this.lokasi,
      this.tenaga_kesehatan,
      this.nomor_batch,
      this.checked_at,
      this.created_at,
      this.updated_at,
      this.deleted_at});

  SimpanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    imunisasi_id = json['imunisasi_id'];
    merek = json['merek'];
    lokasi = json['lokasi'];
    tenaga_kesehatan = json['tenaga_kesehatan'];
    nomor_batch = json['nomor_batch'];
    checked_at = json['checked_at'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = user_id;
    data['imunisasi_id'] = imunisasi_id;
    data['merek'] = merek;
    data['lokasi'] = lokasi;
    data['tenaga_kesehatan'] = tenaga_kesehatan;
    data['nomor_batch'] = nomor_batch;
    data['checked_at'] = checked_at;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    return data;
  }
}
