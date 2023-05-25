class AnakProgress {
  int? id;
  int? usia;
  String? judul;
  String? berat;
  String? panjang;
  String? jantung;
  String? deskripsi;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;

  AnakProgress(
      {this.id,
      this.usia,
      this.judul,
      this.berat,
      this.panjang,
      this.jantung,
      this.deskripsi,
      this.created_at,
      this.updated_at,
      this.deleted_at});

  AnakProgress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usia = json['usia'];
    judul = json['judul'];
    berat = json['berat'];
    panjang = json['panjang'];
    jantung = json['jantung'];
    deskripsi = json['deskripsi'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['usia'] = usia;
    data['judul'] = judul;
    data['berat'] = berat;
    data['panjang'] = panjang;
    data['jantung'] = jantung;
    data['deskripsi'] = deskripsi;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    return data;
  }
}
