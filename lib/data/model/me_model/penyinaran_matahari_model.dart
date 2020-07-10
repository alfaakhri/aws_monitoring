class PenyinaranMatahariModel {
  String dataAlatPenguapan;
  String jumlahPenguapan;
  String radiasi;
  String penyinaranMatahari;

  PenyinaranMatahariModel(
    this.dataAlatPenguapan,
    this.jumlahPenguapan,
    this.radiasi,
    this.penyinaranMatahari,
  );

  PenyinaranMatahariModel.fromJson(Map<String, dynamic> json) {
    dataAlatPenguapan = json['DataAlatPenguapan'];
    jumlahPenguapan = json['JumlahPenguapan'];
    radiasi = json['Radiasi'];
    penyinaranMatahari = json['PenyinaranMatahari'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DataAlatPenguapan'] = this.dataAlatPenguapan;
    data['JumlahPenguapan'] = this.jumlahPenguapan;
    data['Radiasi'] = this.radiasi;
    data['PenyinaranMatahari'] = this.penyinaranMatahari;

    return data;
  }
}
