class Hpl {
  String? hpl;
  String? usia;

  Hpl(this.hpl, this.usia);

  Hpl.fromJson(Map<String, dynamic> json) {
    hpl = json['hpl'];
    usia = json['usia'];
  }
}
