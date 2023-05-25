import 'model_todolist.dart';

class Milestones_category {
  int? id;
  int? milestones_id;
  late final String? title;
  late final int? pencapaian;
  late final int? total_pencapaian;
  late final String? icon_path;
  late final List<Milestones_todolist> todolist;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;

  Milestones_category(
      {this.id,
      this.milestones_id,
      this.title,
      this.pencapaian,
      this.total_pencapaian,
      this.icon_path,
      required this.todolist,
      this.created_at,
      this.updated_at,
      this.deleted_at});

  Milestones_category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    milestones_id = json['milestones_id'];
    title = json['title'];
    pencapaian = json['pencapaian'];
    total_pencapaian = json['total_pencapaian'];
    icon_path = json['icon_path'];
    todolist = (json['milestones_todolist'] as Iterable)
        .map((e) => Milestones_todolist.fromJson(e))
        .toList();
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['milestones_id'] = milestones_id;
    data['title'] = title;
    data['pencapaian'] = pencapaian;
    data['total_pencapaian'] = total_pencapaian;
    data['icon_path'] = icon_path;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    return data;
  }
}
