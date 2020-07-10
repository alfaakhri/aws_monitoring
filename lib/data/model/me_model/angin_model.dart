class AnginModel {
  String pengenalDataAngin;
  String arahAngin;
  String kecAngin;
  String penglihatanMendatar;
  String pengDataCuaca;
  String keadaanCuacaWaktuPengamatan;
  String keadaanCuacaLalu1;
  String keadaanCuacaLalu2;

  AnginModel(
      this.pengenalDataAngin,
      this.arahAngin,
      this.kecAngin,
      this.penglihatanMendatar,
      this.pengDataCuaca,
      this.keadaanCuacaWaktuPengamatan,
      this.keadaanCuacaLalu1,
      this.keadaanCuacaLalu2);

  AnginModel.fromJson(Map<String, dynamic> json) {
    pengenalDataAngin = json['PengenalDataAngin'];
    arahAngin = json['ArahAngin'];
    kecAngin = json['KecepatanAngin'];
    penglihatanMendatar = json['PenglihatanMendatar'];
    pengDataCuaca = json['PenglihatanDataCuaca'];
    keadaanCuacaWaktuPengamatan = json['KeadaanCuacawaktuPengamatan'];
    keadaanCuacaLalu1 = json['KeadaanCuacaLalu1'];
    keadaanCuacaLalu2 = json['KeadaanCuacaLalu2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PengenalDataAngin'] = this.pengenalDataAngin;
    data['ArahAngin'] = this.arahAngin;
    data['KecepatanAngin'] = this.kecAngin;
    data['PenglihatanMendatar'] = this.penglihatanMendatar;
    data['PenglihatanDataCuaca'] = this.pengDataCuaca;
    data['KeadaanCuacawaktuPengamatan'] = this.keadaanCuacaWaktuPengamatan;
    data['KeadaanCuacaLalu1'] = this.keadaanCuacaLalu1;
    data['KeadaanCuacaLalu2'] = this.keadaanCuacaLalu2;
    return data;
  }
}
