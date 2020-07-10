class TekananModel {
  String derajatPanas;
  String tekananDibaca;
  String perubahanTekananUdara;
  String perubahanTekananUdara3jamQFF;
  String perubahanTekananUdara3jamQFE;
  String perubahanTekananUdara24jam;
  String selisihQFF;

  TekananModel(
      this.derajatPanas,
      this.tekananDibaca,
      this.perubahanTekananUdara,
      this.perubahanTekananUdara3jamQFF,
      this.perubahanTekananUdara3jamQFE,
      this.perubahanTekananUdara24jam,
      this.selisihQFF);

  TekananModel.fromJson(Map<String, dynamic> json) {
    derajatPanas = json['DerajatPanas'];
    tekananDibaca = json['TekananDibaca'];
    perubahanTekananUdara = json['PerubahanTekananUdara'];
    perubahanTekananUdara3jamQFF = json['PerubahanTekananUdara3jamQFF'];
    perubahanTekananUdara3jamQFE = json['PerubahanTekananUdara3jamQFE'];
    perubahanTekananUdara24jam = json['PerubahanTekananUdara24jam'];
    selisihQFF = json['SelisihQFF'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DerajatPanas'] = this.derajatPanas;
    data['TekananDibaca'] = this.tekananDibaca;
    data['PerubahanTekananUdara'] = this.perubahanTekananUdara;
    data['PerubahanTekananUdara3jamQFF'] = this.perubahanTekananUdara3jamQFF;
    data['PerubahanTekananUdara3jamQFE'] = this.perubahanTekananUdara3jamQFE;
    data['PerubahanTekananUdara24jam'] = this.perubahanTekananUdara24jam;
    data['SelisihQFF'] = this.selisihQFF;
    return data;
  }
}
