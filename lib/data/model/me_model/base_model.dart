class BaseModel {
  String sandiPengenal;
  String tanggal;
  String waktu;
  String nomorStasiun;

  BaseModel(this.sandiPengenal, this.tanggal, this.waktu, this.nomorStasiun);

  BaseModel.fromJson(Map<String, dynamic> json) {
    sandiPengenal = json['SandiPengenal'];
    tanggal = json['Tanggal'];
    waktu = json['Waktu'];
    nomorStasiun = json['NomorStasiun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SandiPengenal'] = this.sandiPengenal;
    data['Tanggal'] = this.tanggal;
    data['Waktu'] = this.waktu;
    data['NomorStasiun'] = this.nomorStasiun;

    return data;
  }
}
