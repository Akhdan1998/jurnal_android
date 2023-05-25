class SemuaHasilBerat {
  List<GrafikHasilBerat>? grafik;
  int? checked_at;
  HasilBerat? hasil;

  SemuaHasilBerat({this.grafik, this.checked_at, this.hasil});

  SemuaHasilBerat.fromJson(Map<String, dynamic> json) {
    grafik = (json['grafik'] as Iterable)
        .map((e) => GrafikHasilBerat.fromJson(e))
        .toList();
    checked_at = json['checked_at'] ?? 0;
    hasil = HasilBerat.fromJson(json['hasil']);
  }
}

class GrafikHasilBerat {
  double? berat;
  int? bulan;
  String? status;
  String? catatan;

  GrafikHasilBerat({this.berat, this.bulan, this.status, this.catatan});

  GrafikHasilBerat.fromJson(Map<String, dynamic> json) {
    berat = json['berat'].toDouble();
    bulan = json['bulan'] ?? 0;
    status = json['status'] ?? '';
    catatan = json['catatan'] ?? '';
  }
}

class HasilBerat {
  double? berat;
  String? status;
  String? catatan;
  String? color;
  String? color_catatan;

  HasilBerat(
      {this.berat, this.status, this.catatan, this.color, this.color_catatan});

  HasilBerat.fromJson(Map<String, dynamic> json) {
    berat = (json['berat'] != null) ? json['berat'].toDouble() : 0.0;
    status = json['status'] ?? '';
    catatan = json['catatan'] ?? '';
    color = json['color'] ?? '';
    color_catatan = json['color_catatan'] ?? '';
  }
}
