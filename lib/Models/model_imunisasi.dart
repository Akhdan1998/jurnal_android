class ImunisasiGroup {
  int? id;
  String? title;
  String? description;
  String? image;
  String? icon;
  String? manfaat;
  String? informasi;
  String? catatan;
  String? kontra_indikasi;
  bool? is_active;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;

  ImunisasiGroup(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.icon,
      this.manfaat,
      this.informasi,
      this.catatan,
      this.kontra_indikasi,
      this.is_active,
      this.created_at,
      this.updated_at,
      this.deleted_at});

  ImunisasiGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    icon = json['icon'];
    manfaat = json['manfaat'];
    informasi = json['informasi'];
    catatan = json['catatan'];
    kontra_indikasi = json['kontra_indikasi'];
    is_active = json['is_active'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }
}
