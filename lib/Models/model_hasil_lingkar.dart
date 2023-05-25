class SemuaHasilLingkar {
  List<GrafikHasilLingkar>? grafik;
  int? checked_at;
  HasilLingkar? hasil;

  SemuaHasilLingkar({this.grafik, this.checked_at, this.hasil});

  SemuaHasilLingkar.fromJson(Map<String, dynamic> json) {
    grafik = (json['grafik'] as Iterable)
        .map((e) => GrafikHasilLingkar.fromJson(e))
        .toList();
    checked_at = json['checked_at'] ?? '';
    hasil = HasilLingkar.fromJson(json['hasil']);
  }
}

class GrafikHasilLingkar {
  double? lingkar;
  int? bulan;
  String? status;
  String? catatan;

  GrafikHasilLingkar({this.lingkar, this.bulan, this.status, this.catatan});

  GrafikHasilLingkar.fromJson(Map<String, dynamic> json) {
    lingkar = json['lingkar_kepala'].toDouble();
    bulan = json['bulan'] ?? 0;
    status = json['status'] ?? '';
    catatan = json['catatan'] ?? '';
  }
}

class HasilLingkar {
  double? lingkar;
  String? status;
  String? catatan;
  String? color;
  String? color_catatan;

  HasilLingkar(
      {this.lingkar,
      this.status,
      this.catatan,
      this.color,
      this.color_catatan});

  HasilLingkar.fromJson(Map<String, dynamic> json) {
    lingkar = (json['lingkar_kepala'] != null) ? (json['lingkar_kepala'].toDouble()) : 0.0;
    status = json['status'] ?? '';
    catatan = json['catatan'] ?? '';
    color = json['color'] ?? '';
    color_catatan = json['color_catatan'] ?? '';
  }
}
