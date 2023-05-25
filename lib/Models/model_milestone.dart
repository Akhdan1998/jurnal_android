import 'model_milestones_category.dart';

class Milestones {
  int? id;
  late final String? usia;
  late final int? pencapaian;
  late final int? total_pencapaian;
  late final List<Milestones_category> category;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;

  Milestones(
      {this.id,
      this.usia,
      this.pencapaian,
      this.total_pencapaian,
      required this.category,
      this.created_at,
      this.updated_at,
      this.deleted_at});

  Milestones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usia = json['usia'];
    pencapaian = json['pencapaian'];
    total_pencapaian = json['total_pencapaian'];
    category = (json['milestones_categories'] as Iterable)
        .map((e) => Milestones_category.fromJson(e))
        .toList();
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }
}
