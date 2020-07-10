class SuhuEkstrimModel {
  String suhuMax;
  String suhuMin;

  SuhuEkstrimModel(
    this.suhuMax,
    this.suhuMin,
  );

  SuhuEkstrimModel.fromJson(Map<String, dynamic> json) {
    suhuMax = json['SuhuMax'];
    suhuMin = json['SuhuMin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SuhuMax'] = this.suhuMax;
    data['SuhuMin'] = this.suhuMin;
    return data;
  }
}
