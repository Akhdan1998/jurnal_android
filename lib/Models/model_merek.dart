class MerekImunisasi {
  int? id;
  String? imunisasi_id;
  String? nama_merek;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;

  MerekImunisasi(
      {this.id,
      this.imunisasi_id,
      this.nama_merek,
      this.created_at,
      this.updated_at,
      this.deleted_at});

  MerekImunisasi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imunisasi_id = json['imunisasi_id'];
    nama_merek = json['nama_merek'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }
}