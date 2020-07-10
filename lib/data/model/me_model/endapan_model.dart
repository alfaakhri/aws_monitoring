class EndapanModel {
  String pengenalDataHujan;
  String hujanRealtime;
  String hujan3jamLalu;
  String hujan6jamLalu;
  String hujan24jamLalu;

  EndapanModel(
    this.pengenalDataHujan,
    this.hujanRealtime,
    this.hujan3jamLalu,
    this.hujan6jamLalu,
    this.hujan24jamLalu,
  );

  EndapanModel.fromJson(Map<String, dynamic> json) {
    pengenalDataHujan = json['PengenalDataHujan'];
    hujanRealtime = json['HujanRealtime'];
    hujan3jamLalu = json['HujanSejak3jamLalu'];
    hujan6jamLalu = json['HujanSejak6jamLalu'];
    hujan24jamLalu = json['HujanSejak24jamLalu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PengenalDataHujan'] = this.pengenalDataHujan;
    data['HujanRealtime'] = this.hujanRealtime;
    data['HujanSejak3jamLalu'] = this.hujan3jamLalu;
    data['HujanSejak6jamLalu'] = this.hujan6jamLalu;
    data['HujanSejak24jamLalu'] = this.hujan24jamLalu;
    return data;
  }
}
