class SemuaHasilTinggi {
  List<GrafikHasilTinggi>? grafik;
  int? checked_at;
  HasilTinggi? hasil;

  SemuaHasilTinggi({this.grafik, this.checked_at, this.hasil});

  SemuaHasilTinggi.fromJson(Map<String, dynamic> json) {
    grafik = (json['grafik'] as Iterable)
        .map((e) => GrafikHasilTinggi.fromJson(e))
        .toList();
      checked_at = json['checked_at'] ?? 0;
    hasil = HasilTinggi.fromJson(json['hasil']);
  }
}

class GrafikHasilTinggi {
  double? tinggi;
  int? bulan;
  String? status;
  String? catatan;

  GrafikHasilTinggi({this.tinggi, this.bulan, this.status, this.catatan});

  GrafikHasilTinggi.fromJson(Map<String, dynamic> json) {
    tinggi = json['tinggi'].toDouble();
    bulan = json['bulan'] ?? 0;
    status = json['status'] ?? "";
    catatan = json['catatan'] ?? "";
  }
}

class HasilTinggi {
  double? tinggi;
  String? status;
  String? catatan;
  String? color;
  String? color_catatan;

  HasilTinggi(
      {this.tinggi, this.status, this.catatan, this.color, this.color_catatan});

  HasilTinggi.fromJson(Map<String, dynamic> json) {
    tinggi = (json['tinggi'] != null) ? json['tinggi'].toDouble() : 0.0;
    status = json['status'] ?? "";
    catatan = json['catatan'] ?? "";
    color = json['color'] ?? "";
    color_catatan = json['color_catatan'] ?? "";
  }
}
