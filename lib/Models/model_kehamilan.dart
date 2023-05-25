import 'model_progresAnak.dart';

class Kelahiran {
  int? id;
  String? user_id;
  int? anak_id;
  String? nama_anak;
  String? hpht;
  int? hpl;
  double? progress;
  int? usia;
  int? trimester;
  late AnakProgress anakProgress;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;

  Kelahiran({this.id, this.user_id, this.anak_id, this.nama_anak, this.hpht, this.hpl, this.progress, this.usia, this.trimester, required this.anakProgress, this.created_at, this.updated_at, this.deleted_at});

  Kelahiran.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    anak_id = json['anak_id'];
    nama_anak = json['nama_anak'];
    hpht = json['hpht'];
    hpl = json['hpl'] ?? 0;
    progress = json['progress'].toDouble();
    usia = json['usia'];
    trimester = json['trimester'];
    anakProgress = AnakProgress.fromJson(json['anak_progress']);
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }

  // Map<String, dynamic> toJson() {
  //   Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['user_id'] = user_id;
  //   data['anak_id'] = anak_id;
  //   data['nama_anak'] = nama_anak;
  //   data['hpht'] = hpht;
  //   data['hpl'] = hpl;
  //   data['usia'] = usia;
  //   data['trimester'] = trimester;
  //   data['anakProgress'] = anakProgress;
  //   data['created_at'] = created_at;
  //   data['updated_at'] = updated_at;
  //   data['deleted_at'] = deleted_at;
  //   return data;
  // }
}
