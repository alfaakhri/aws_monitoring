class TanahModel {
  String keadaanTanah;
  String catatan;

  TanahModel(
    this.keadaanTanah,
    this.catatan,
  );

  TanahModel.fromJson(Map<String, dynamic> json) {
    keadaanTanah = json['KeadaanTanah'];
    catatan = json['Catatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['KeadaanTanah'] = this.keadaanTanah;
    data['Catatan'] = this.catatan;

    return data;
  }
}
