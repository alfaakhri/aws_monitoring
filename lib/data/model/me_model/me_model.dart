import 'package:aws_monitoring/data/model/me_model/angin_model.dart';
import 'package:aws_monitoring/data/model/me_model/awan_konvektif_model.dart';
import 'package:aws_monitoring/data/model/me_model/base_model.dart';
import 'package:aws_monitoring/data/model/me_model/endapan_model.dart';
import 'package:aws_monitoring/data/model/me_model/lapisan_awan_model.dart';
import 'package:aws_monitoring/data/model/me_model/penyinaran_matahari_model.dart';
import 'package:aws_monitoring/data/model/me_model/perawanan_model.dart';
import 'package:aws_monitoring/data/model/me_model/suhu_ekstrim_model.dart';
import 'package:aws_monitoring/data/model/me_model/suhu_udara_model.dart';
import 'package:aws_monitoring/data/model/me_model/tanah_model.dart';
import 'package:aws_monitoring/data/model/me_model/tekanan_model.dart';

class MeModel {
  String iD;
  BaseModel baseModel;
  AnginModel anginModel;
  TekananModel tekananModel;
  SuhuUdaraModel suhuUdaraModel;
  SuhuEkstrimModel suhuEkstrimModel;
  EndapanModel endapanModel;
  PerawananModel perawananModel;
  LapisanAwanModel lapisanAwanModel;
  AwanKonvektifModel awanKonvektifModel;
  PenyinaranMatahariModel penyinaranMatahariModel;
  TanahModel tanahModel;
  bool isMe48;
  String hasilSandi;
  String timestamp;

  MeModel(
      {this.baseModel,
      this.anginModel,
      this.tekananModel,
      this.suhuUdaraModel,
      this.suhuEkstrimModel,
      this.endapanModel,
      this.perawananModel,
      this.lapisanAwanModel,
      this.awanKonvektifModel,
      this.penyinaranMatahariModel,
      this.tanahModel,
      this.isMe48,
      this.hasilSandi,
      this.timestamp});

  MeModel.fromJson(Map<String, dynamic> json) {
    iD = json["ID"];
    baseModel =
        json['Base'] != null ? new BaseModel.fromJson(json['Base']) : null;
    anginModel = json['Angin-Penglihatan'] != null
        ? new AnginModel.fromJson(json['Angin-Penglihatan'])
        : null;
    tekananModel = json['TekananUdara'] != null
        ? new TekananModel.fromJson(json['TekananUdara'])
        : null;
    suhuUdaraModel = json['SuhuUdara'] != null
        ? new SuhuUdaraModel.fromJson(json['SuhuUdara'])
        : null;
    suhuEkstrimModel = json['SuhuEkstrim'] != null
        ? new SuhuEkstrimModel.fromJson(json['SuhuEkstrim'])
        : null;
    endapanModel = json['Endapan'] != null
        ? new EndapanModel.fromJson(json['Endapan'])
        : null;
    perawananModel = json['Perawanan'] != null
        ? new PerawananModel.fromJson(json['Perawanan'])
        : null;
    lapisanAwanModel = json['LapisanAwan'] != null
        ? new LapisanAwanModel.fromJson(json['LapisanAwan'])
        : null;
    awanKonvektifModel = json['AwanKonvektif'] != null
        ? new AwanKonvektifModel.fromJson(json['AwanKonvektif'])
        : null;
    penyinaranMatahariModel = json['PenyinaranMatahariModel'] != null
        ? new PenyinaranMatahariModel.fromJson(json['PenyinaranMatahariModel'])
        : null;
    tanahModel = json['Tanah/Catatan'] != null
        ? new TanahModel.fromJson(json['Tanah/Catatan'])
        : null;
    isMe48 = json["isMe48"];
    hasilSandi = json['HasilSandi'];
    timestamp = json['TimeStamp'];
  }

  static List<MeModel> fromJsonList(jsonList) {
    return jsonList.map<MeModel>((obj) => MeModel.fromJson(obj)).toList();
  }
}
