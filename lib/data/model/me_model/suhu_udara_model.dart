class SuhuUdaraModel {
  String bolaKering;
  String bolaBasah;
  String titikEmbun;
  String lembabNisbi;

  SuhuUdaraModel(
      this.bolaKering,
      this.bolaBasah,
      this.titikEmbun,
      this.lembabNisbi);

   SuhuUdaraModel.fromJson(Map<String, dynamic> json) {
    bolaKering = json['BolaKering'];
    bolaBasah = json['BolaBasah'];
    titikEmbun = json['TitikEmbun'];
    lembabNisbi = json['LembabNisbi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BolaKering'] = this.bolaKering;
    data['BolaBasah'] = this.bolaBasah;
    data['TitikEmbun'] = this.titikEmbun;
    data['LembabNisbi'] = this.lembabNisbi;
    return data;
  }
}
