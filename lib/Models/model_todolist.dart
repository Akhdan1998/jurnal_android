class Milestones_todolist {
  int? id;
  int? kategori_id;
  late final String? title;
  late final String? subtitle;
  late final String? meterial;
  late final String? instruksi;
  bool? is_active;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;

  Milestones_todolist(
      {this.id,
      this.kategori_id,
      this.title,
      this.subtitle,
      this.meterial,
      this.instruksi,
      this.is_active,
      this.created_at,
      this.updated_at,
      this.deleted_at});

  Milestones_todolist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kategori_id = json['kategori_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    meterial = json['meterial'];
    instruksi = json['instruksi'];
    is_active = json['is_active'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }
}
