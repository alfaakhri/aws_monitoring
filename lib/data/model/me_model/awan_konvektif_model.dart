class AwanKonvektifModel {
  String jenisAwanKonvektif;
  String arahAwanKonvektif;
  String sudutAwanKonvektif;

  AwanKonvektifModel(
    this.jenisAwanKonvektif,
    this.arahAwanKonvektif,
    this.sudutAwanKonvektif
  );

  AwanKonvektifModel.fromJson(Map<String, dynamic> json) {
    jenisAwanKonvektif = json['JenisAwanKonvektif'];
    arahAwanKonvektif = json['ArahAwanKonvektif'];
    sudutAwanKonvektif = json['SudutAwanKonvektif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JenisAwanKonvektif'] = this.jenisAwanKonvektif;
    data['ArahAwanKonvektif'] = this.arahAwanKonvektif;
    data['SudutAwanKonvektif'] = this.sudutAwanKonvektif;
    return data;
  }
}
