class Huruf {
  int? id;
  String? huruf_awalan;
  String? kategori;
  String? nama;
  String? deskripsi;
  String? gender;
  int? created_at;
  int? updated_at;
  int? deleted_at;

  Huruf(
      {this.id,
      this.huruf_awalan,
      this.kategori,
      this.nama,
      this.deskripsi,
      this.gender,
      this.created_at,
      this.updated_at,
      this.deleted_at});

  Huruf.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    huruf_awalan = json['huruf_awalan'];
    kategori = json['kategori'];
    nama = json['nama'];
    deskripsi = json['deskripsi'];
    gender = json['gender'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }
}
