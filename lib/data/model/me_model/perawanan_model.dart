class PerawananModel {
  String awanRendahJenis;
  String banyakOktaNH;
  String tinggiDasarCL1;
  String tinggiPuncakCL1;
  String arahCL1;
  String sudutElevasiCL1;
  String tinggiDasarCL2;
  String arahCL2;
  String sudutElevasiCL2;
  String awanMenengahJenis;
  String awanMenengahBanyak;
  String tinggiAwanMenengah;
  String arahAwanMenengah;
  String awanTinggiBanyak;
  String awanTinggiJenis;
  String arahAwanTinggi;
  String tingginya;
  String bagianLangit;

  PerawananModel(
    this.awanRendahJenis,
    this.banyakOktaNH,
    this.tinggiDasarCL1,
    this.tinggiPuncakCL1,
    this.arahCL1,
    this.sudutElevasiCL1,
    this.tinggiDasarCL2,
    this.arahCL2,
    this.sudutElevasiCL2,
    this.awanMenengahJenis,
    this.awanMenengahBanyak,
    this.tinggiAwanMenengah,
    this.arahAwanMenengah,
    this.awanTinggiBanyak,
    this.awanTinggiJenis,
    this.arahAwanTinggi,
    this.tingginya,
    this.bagianLangit,
  );

  PerawananModel.fromJson(Map<String, dynamic> json) {
    awanRendahJenis = json['AwanRendah(Jenis)'];
    banyakOktaNH = json['Banyaknya(Okta)NH'];
    tinggiDasarCL1 = json['TinggiDasarCL1'];
    tinggiPuncakCL1 = json['TinggiPuncakCL1'];
    arahCL1 = json['ArahCL1'];
    sudutElevasiCL1 = json['SudutElevasiCL1'];
    tinggiDasarCL2 = json['TinggiDasarCL2'];
    arahCL2 = json['ArahCL2'];
    sudutElevasiCL2 = json['SudutElevasiCL2'];
    awanMenengahJenis = json['AwanMenengahJenis'];
    awanMenengahBanyak = json['AwanMenengahBanyak'];
    tinggiAwanMenengah = json['HujanSejak24jamLalu'];
    arahAwanMenengah = json['ArahAwanMenengah'];
    awanTinggiBanyak = json['AwanTinggiBanyak'];
    awanTinggiJenis = json['AwanTinggiJenis'];
    arahAwanTinggi = json['ArahAwanTinggi'];
    tingginya = json['Tingginya'];
    bagianLangit = json['BagianLangit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AwanRendah(Jenis)'] = this.awanRendahJenis;
    data['Banyaknya(Okta)NH'] = this.banyakOktaNH;
    data['TinggiDasarCL1'] = this.tinggiDasarCL1;
    data['TinggiPuncakCL1'] = this.tinggiPuncakCL1;
    data['ArahCL1'] = this.arahCL1;
    data['SudutElevasiCL1'] = this.sudutElevasiCL1;
    data['TinggiDasarCL2'] = this.tinggiDasarCL2;
    data['ArahCL2'] = this.arahCL2;
    data['SudutElevasiCL2'] = this.sudutElevasiCL2;
    data['AwanMenengahJenis'] = this.awanMenengahJenis;
    data['AwanMenengahBanyak'] = this.awanMenengahBanyak;
    data['TinggiAwanMenengah'] = this.tinggiAwanMenengah;
    data['ArahAwanMenengah'] = this.arahAwanMenengah;
    data['AwanTinggiBanyak'] = this.awanTinggiBanyak;
    data['AwanTinggiJenis'] = this.awanTinggiJenis;
    data['ArahAwanTinggi'] = this.arahAwanTinggi;
    data['Tingginya'] = this.tingginya;
    data['BagianLangit'] = this.bagianLangit;

    return data;
  }
}
