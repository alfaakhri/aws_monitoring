class LapisanAwanModel {
  String jenisC1;
  String tinggiHshs1;
  String banyakOktaNS1;
  String jenisC2;
  String tinggiHshs2;
  String banyakOktaNS2;
  String jenisC3;
  String tinggiHshs3;
  String banyakOktaNS3;

  LapisanAwanModel(
    this.jenisC1,
    this.tinggiHshs1,
    this.banyakOktaNS1,
    this.jenisC2,
    this.tinggiHshs2,
    this.banyakOktaNS2,
    this.jenisC3,
    this.tinggiHshs3,
    this.banyakOktaNS3,
  );

  LapisanAwanModel.fromJson(Map<String, dynamic> json) {
    jenisC1 = json['JenisC1'];
    tinggiHshs1 = json['TinggiHshs1'];
    banyakOktaNS1 = json['banyak(okta)NS1'];
    jenisC2 = json['JenisC2'];
    tinggiHshs2 = json['TinggiHshs2'];
    banyakOktaNS2 = json['banyak(okta)NS2'];
    jenisC3 = json['JenisC3'];
    tinggiHshs3 = json['TinggiHshs3'];
    banyakOktaNS3 = json['Banyak(okta)NS3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JenisC1'] = this.jenisC1;
    data['TinggiHshs1'] = this.tinggiHshs1;
    data['banyak(okta)NS1'] = this.banyakOktaNS1;
    data['JenisC2'] = this.jenisC2;
    data['TinggiHshs2'] = this.tinggiHshs2;
    data['banyak(okta)NS2'] = this.banyakOktaNS2;
    data['JenisC3'] = this.jenisC3;
    data['TinggiHshs3'] = this.tinggiHshs3;
    data['Banyak(okta)NS3'] = this.banyakOktaNS3;

    return data;
  }
}
