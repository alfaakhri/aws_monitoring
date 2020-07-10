import 'dart:convert';

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
import 'package:aws_monitoring/domain/usecase/aws_store.dart';
import 'package:aws_monitoring/external/color_helpers.dart';
import 'package:aws_monitoring/external/constants.dart';
import 'package:aws_monitoring/external/fontsize_helpers.dart';
import 'package:aws_monitoring/external/ui_helpers.dart';
import 'package:aws_monitoring/presentation/widgets/dialogs_popup.dart';
import 'package:aws_monitoring/presentation/widgets/style.dart';
import 'package:flutter/material.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class MePage extends StatefulWidget {
  final AwsStore awsStore;
  final bool isMe45;

  const MePage({Key key, this.awsStore, this.isMe45}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  //Controller untuk menampung nilai dari setiap textfield atau dropdown
  String sandiPengenal;
  String tanggal;
  DateTime waktu = DateTime.now();
  TextEditingController nomorStasiun = TextEditingController();
  //------------Angin - Penglihatahn - Keadaan Cuaca------------
  String pengenalDataAngin;
  TextEditingController penglihatanMendatar = TextEditingController();
  String pengenalDataCuaca;
  String keadaanCuacaWaktuPengamatan;
  String keadaanCuacaYangLalu1;
  String keadaanCuacaYangLalu2;
  //------------Tekanan Udara------------
  TextEditingController perubahanTekananUdara3jam = TextEditingController();
  TextEditingController perubahanTekananUdara3jamQFF = TextEditingController();
  TextEditingController perubahanTekananUdara3jamQFE = TextEditingController();
  TextEditingController perubahanTekananUdara24jam = TextEditingController();
  TextEditingController selisihQFF = TextEditingController();
  //------------Suhu Udara------------
  TextEditingController bolaKering = TextEditingController();
  TextEditingController bolaBasah = TextEditingController();
  TextEditingController titikEmbun = TextEditingController();
  //------------Suhu Ekstrim------------
  TextEditingController suhuMax = TextEditingController();
  TextEditingController suhuMin = TextEditingController();
  //------------Endapan------------
  String pengenalDataHujan;
  TextEditingController hujanSejak3jam = TextEditingController();
  TextEditingController hujanSejak6jam = TextEditingController();
  TextEditingController hujanSejak24jam = TextEditingController();
  //------------Perawanan------------
  String awanRendah;
  String banyakOkta;
  String tinggiDasarCL1;
  TextEditingController tinggiPuncakCL1 = TextEditingController();
  String arahCL1;
  String sudutElevasiCL1;
  String tinggiDasarCL2;
  String arahCL2;
  String sudutElevasiCL2;
  String awanMenengahJenis;
  String awanMenengahBanyak;
  TextEditingController tinggiAwanMenengah = TextEditingController();
  String arahAwanMenengah;
  String awanTinggiBanyak;
  String awanTinggiJenis;
  String arahAwanTinggi;
  TextEditingController tingginya = TextEditingController();
  String bagianLangitTertutupAwan;
  //------------Lapisan Awan------------
  String jenisC1;
  TextEditingController tinggiHshs1 = TextEditingController();
  String banyakNS1;
  String jenisC2;
  TextEditingController tinggiHshs2 = TextEditingController();
  String banyakNS2;
  String jenisC3;
  TextEditingController tinggiHshs3 = TextEditingController();
  String banyakNS3;
  //------------Penyinaran Matahari------------
  String pengenalDataPenguapan;
  TextEditingController jumlahPenguapan24jam = TextEditingController();
  TextEditingController penyinaranMatahari = TextEditingController();
  //------------Awan Konvektif------------
  String jenisAwanKonvektif;
  String arahAwanKonvektif;
  String sudutAwanKonvektif;

  //------------Tanah / Catatan------------
  String keadaanTanah;
  TextEditingController catatan = TextEditingController();

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  TextEditingController _hasilSandi48 = TextEditingController();
  TextEditingController _hasilSandi45 = TextEditingController();

  var _dataMe45, _dataMe48;

  //Instansiasi monitoring store
  final reactiveModel = Injector.getAsReactive<AwsStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (widget.isMe45 == true) ? Text("ME 45") : Text("ME 48"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              UIHelper.verticalSpaceSmall,
              _detailBase(widget.awsStore),
              UIHelper.verticalSpaceSmall,
              _detailContentWind(),
              UIHelper.verticalSpaceSmall,
              _detailContentAirPressure(),
              UIHelper.verticalSpaceSmall,
              _detailContentAirTemperature(),
              UIHelper.verticalSpaceSmall,
              _detailContentExtremeTemperature(),
              UIHelper.verticalSpaceSmall,
              _detailContentSediment(),
              UIHelper.verticalSpaceSmall,
              _detailContentWinds(),
              UIHelper.verticalSpaceSmall,
              _detailContentCloudLayer(),
              UIHelper.verticalSpaceSmall,
              _detailContentConvectiveCloud(),
              UIHelper.verticalSpaceSmall,
              _detailContentSunlight(widget.awsStore),
              UIHelper.verticalSpaceSmall,
              _detailContentGround(),
              UIHelper.verticalSpaceSmall,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            reactiveModel.setState(
                                (store) => store.createSandi(
                                    sandiPengenal,
                                    nomorStasiun.text,
                                    tanggal,
                                    Constants().timeFormat.format(waktu),
                                    pengenalDataAngin,
                                    widget.awsStore.dataMonitoringModel.feeds
                                        .single.field5,
                                    widget.awsStore.dataMonitoringModel.feeds
                                        .single.field4,
                                    penglihatanMendatar.text,
                                    pengenalDataCuaca,
                                    keadaanCuacaWaktuPengamatan,
                                    keadaanCuacaYangLalu1,
                                    keadaanCuacaYangLalu2,
                                    widget.awsStore.dataMonitoringModel.feeds
                                        .single.field2,
                                    widget.awsStore.dataMonitoringModel.feeds
                                        .single.field1,
                                    perubahanTekananUdara3jam.text,
                                    perubahanTekananUdara3jamQFF.text,
                                    perubahanTekananUdara3jamQFE.text,
                                    perubahanTekananUdara24jam.text,
                                    selisihQFF.text,
                                    bolaKering.text,
                                    bolaBasah.text,
                                    titikEmbun.text,
                                    widget.awsStore.dataMonitoringModel.feeds
                                        .single.field3,
                                    suhuMax.text,
                                    suhuMin.text,
                                    pengenalDataHujan,
                                    widget.awsStore.dataMonitoringModel.feeds
                                        .single.field7,
                                    hujanSejak3jam.text,
                                    hujanSejak6jam.text,
                                    hujanSejak24jam.text,
                                    awanRendah,
                                    banyakOkta,
                                    tinggiDasarCL1,
                                    tinggiPuncakCL1.text,
                                    arahCL1,
                                    sudutElevasiCL1,
                                    tinggiDasarCL2,
                                    arahCL2,
                                    sudutElevasiCL2,
                                    awanMenengahJenis,
                                    awanMenengahBanyak,
                                    tinggiAwanMenengah.text,
                                    arahAwanMenengah,
                                    awanTinggiBanyak,
                                    awanTinggiJenis,
                                    arahAwanTinggi,
                                    tingginya.text,
                                    bagianLangitTertutupAwan,
                                    jenisC1,
                                    tinggiHshs1.text,
                                    banyakNS1,
                                    jenisC2,
                                    tinggiHshs2.text,
                                    banyakNS2,
                                    jenisC3,
                                    tinggiHshs3.text,
                                    banyakNS3,
                                    jenisAwanKonvektif,
                                    arahAwanKonvektif,
                                    sudutAwanKonvektif,
                                    pengenalDataPenguapan,
                                    jumlahPenguapan24jam.text,
                                    widget.awsStore.dataMonitoringModel.feeds
                                        .single.field6,
                                    penyinaranMatahari.text,
                                    keadaanTanah,
                                    catatan.text), onData: (context, data) {
                              setState(() {
                                _hasilSandi48.text = data.hasilSandi48;
                                _hasilSandi45.text = data.hasilSandi45;
                              });
                            });
                          },
                          color: ColorHelpers.colorRed,
                          child: Text('Sandi',
                              style: GoogleFonts.pTSans(
                                  fontSize: FontsizeHelpers.txtSize20,
                                  textStyle: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpaceVerySmall,
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            BaseModel _baseModel = BaseModel(
                                sandiPengenal,
                                Constants()
                                    .dateFormat
                                    .format(widget.awsStore.selectedDate),
                                Constants().timeFormat.format(waktu),
                                nomorStasiun.text);
                            AnginModel _anginModel = AnginModel(
                                pengenalDataAngin,
                                widget.awsStore.dataMonitoringModel.feeds.single
                                    .field5,
                                widget.awsStore.dataMonitoringModel.feeds.single
                                    .field4,
                                penglihatanMendatar.text,
                                pengenalDataCuaca,
                                keadaanCuacaWaktuPengamatan,
                                keadaanCuacaYangLalu1,
                                keadaanCuacaYangLalu2);
                            TekananModel _tekananModel = TekananModel(
                                widget.awsStore.dataMonitoringModel.feeds.single
                                    .field2,
                                widget.awsStore.dataMonitoringModel.feeds.single
                                    .field1,
                                perubahanTekananUdara3jam.text,
                                perubahanTekananUdara3jamQFF.text,
                                perubahanTekananUdara3jamQFE.text,
                                perubahanTekananUdara24jam.text,
                                selisihQFF.text);
                            SuhuUdaraModel _suhuUdara = SuhuUdaraModel(
                                bolaKering.text,
                                bolaBasah.text,
                                titikEmbun.text,
                                widget.awsStore.dataMonitoringModel.feeds.single
                                    .field3);
                            SuhuEkstrimModel _suhuEkstrim =
                                SuhuEkstrimModel(suhuMax.text, suhuMin.text);
                            EndapanModel _endapan = EndapanModel(
                                pengenalDataHujan,
                                widget.awsStore.dataMonitoringModel.feeds.single
                                    .field7,
                                hujanSejak3jam.text,
                                hujanSejak6jam.text,
                                hujanSejak24jam.text);
                            PerawananModel _perawananModel = PerawananModel(
                                awanRendah,
                                banyakOkta,
                                tinggiDasarCL1,
                                tinggiPuncakCL1.text,
                                arahCL1,
                                sudutElevasiCL1,
                                tinggiDasarCL2,
                                arahCL2,
                                sudutElevasiCL2,
                                awanMenengahJenis,
                                awanMenengahBanyak,
                                tinggiAwanMenengah.text,
                                arahAwanMenengah,
                                awanTinggiBanyak,
                                awanTinggiJenis,
                                arahAwanTinggi,
                                tingginya.text,
                                bagianLangitTertutupAwan);
                            LapisanAwanModel _lapisanAwanModel =
                                LapisanAwanModel(
                                    jenisC1,
                                    tinggiHshs1.text,
                                    banyakNS1,
                                    jenisC2,
                                    tinggiHshs2.text,
                                    banyakNS2,
                                    jenisC3,
                                    tinggiHshs3.text,
                                    banyakNS3);
                            AwanKonvektifModel _awanKonvektifModel =
                                AwanKonvektifModel(jenisAwanKonvektif,
                                    arahAwanKonvektif, sudutAwanKonvektif);
                            PenyinaranMatahariModel _penyinaranMatahariModel =
                                PenyinaranMatahariModel(
                                    pengenalDataPenguapan,
                                    jumlahPenguapan24jam.text,
                                    widget.awsStore.dataMonitoringModel.feeds
                                        .single.field6,
                                    penyinaranMatahari.text);
                            TanahModel _tanahModel =
                                TanahModel(keadaanTanah, catatan.text);
                            if (widget.isMe45 == true) {
                              _dataMe45 = {
                                "ID": Constants().uuid.v1(),
                                "Base": _baseModel,
                                "Angin-Penglihatan": _anginModel,
                                "TekananUdara": _tekananModel,
                                "SuhuUdara": _suhuUdara,
                                "SuhuEkstrim": _suhuEkstrim,
                                "Endapan": _endapan,
                                "Perawanan": _perawananModel,
                                "LapisanAwan": _lapisanAwanModel,
                                "AwanKonvektif": _awanKonvektifModel,
                                "PenyinaranMatahariModel":
                                    _penyinaranMatahariModel,
                                "Tanah/Catatan": _tanahModel,
                                "isMe48": false,
                                "HasilSandi": _hasilSandi45.text,
                                "Timestamp": DateTime.now().toString(),
                              };
                            } else {
                              _dataMe48 = {
                                "ID": Constants().uuid.v1(),
                                "Base": _baseModel,
                                "Angin-Penglihatan": _anginModel,
                                "TekananUdara": _tekananModel,
                                "SuhuUdara": _suhuUdara,
                                "SuhuEkstrim": _suhuEkstrim,
                                "Endapan": _endapan,
                                "Perawanan": _perawananModel,
                                "LapisanAwan": _lapisanAwanModel,
                                "AwanKonvektif": _awanKonvektifModel,
                                "PenyinaranMatahariModel":
                                    _penyinaranMatahariModel,
                                "Tanah/Catatan": _tanahModel,
                                "isMe48": true,
                                "HasilSandi": _hasilSandi48.text,
                                "Timestamp": DateTime.now().toString(),
                              };
                            }

                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                        "Apakah kamu yakin data yang diinput sudah benar ?"),
                                    content: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        RaisedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          color: Color(0xFFC80700),
                                          child: Container(
                                              child: Text(
                                            "Batal",
                                            style: GoogleFonts.pTSans(
                                                textStyle: TextStyle(
                                                    color: Colors.white)),
                                          )),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        RaisedButton(
                                          onPressed: () async {
                                            DialogsPopup.showLoadingDialog(
                                                context, _keyLoader);
                                            try {
                                              if (widget.isMe45 == true) {
                                                reactiveModel.setState(
                                                    (store) => store
                                                        .sendDataToFirebase(
                                                            jsonEncode(
                                                                _dataMe45)),
                                                    onData:
                                                        (context, reactive) {
                                                  Fluttertoast.showToast(
                                                      msg: "Berhasil");
                                                  Navigator.of(
                                                          _keyLoader
                                                              .currentContext,
                                                          rootNavigator: true)
                                                      .pop();
                                                  Navigator.pop(context);
                                                }, onError: (context, error) {
                                                  print(error);
                                                  Fluttertoast.showToast(
                                                      msg: "Gagal");
                                                  Navigator.of(
                                                          _keyLoader
                                                              .currentContext,
                                                          rootNavigator: true)
                                                      .pop();
                                                });
                                              } else {
                                                reactiveModel.setState(
                                                    (store) => store
                                                        .sendDataToFirebase(
                                                            jsonEncode(
                                                                _dataMe48)),
                                                    onData:
                                                        (context, reactive) {
                                                  Fluttertoast.showToast(
                                                      msg: "Berhasil");
                                                  Navigator.of(
                                                          _keyLoader
                                                              .currentContext,
                                                          rootNavigator: true)
                                                      .pop();
                                                  Navigator.pop(context);
                                                }, onError: (context, error) {
                                                  print(error);
                                                  Fluttertoast.showToast(
                                                      msg: "Gagal");
                                                  Navigator.of(
                                                          _keyLoader
                                                              .currentContext,
                                                          rootNavigator: true)
                                                      .pop();
                                                  Navigator.pop(context);
                                                });
                                              }
                                            } catch (e) {
                                              print(e);
                                            }
                                          },
                                          color: Color(0xFF77CF44),
                                          child: Container(
                                              child: Text(
                                            "Ya",
                                            style: GoogleFonts.pTSans(
                                                textStyle: TextStyle(
                                                    color: Colors.white)),
                                          )),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          color: ColorHelpers.colorGreen,
                          child: Text('Kirim',
                              style: GoogleFonts.pTSans(
                                  fontSize: FontsizeHelpers.txtSize20,
                                  textStyle: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpaceSmall,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Hasil Sandi",
                        style: GoogleFonts.pTSans(),
                      ),
                    ),
                    UIHelper.verticalSpaceVerySmall,
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: TextFormField(
                          maxLines: 5,
                          enabled: false,
                          controller: (widget.isMe45 == true)
                              ? _hasilSandi45
                              : _hasilSandi48,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorHelpers.colorWhite,
                            isDense: true,
                            labelStyle: GoogleFonts.pTSans(
                                textStyle: TextStyle(color: Colors.black)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          )),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }

  Container _detailBase(AwsStore data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ConfigurableExpansionTile(
        headerExpanded: buildFlexibleExpansion(
            'Base', Icon(Icons.keyboard_arrow_up), Colors.blueAccent),
        header: buildFlexibleExpansion(
            'Base', Icon(Icons.keyboard_arrow_down), Colors.blueAccent),
        children: [
          UIHelper.verticalSpaceMedium,
          DropDownContent(
            label: "Sandi Pengenal",
            data: Constants()
                .listSandiPengenal
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: sandiPengenal != null ? sandiPengenal : null,
            onChanged: (String value) {
              setState(() {
                sandiPengenal = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Tanggal",
              style: GoogleFonts.pTSans(),
            ),
          ),
          UIHelper.verticalSpaceVerySmall,
          Row(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.0),
                    border: new Border.all(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  child: Text(Constants().dateFormat.format(data.selectedDate),
                      style: TextStyle(fontSize: FontsizeHelpers.txtSize16)),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () => reactiveModel
                        .setState((store) => store.getDate(context),
                            onData: (context, reactive) {
                      setState(() {
                        tanggal = Constants()
                            .dateFormat
                            .format(reactive.selectedDate);
                      });
                    }),
                    child: Icon(
                      Icons.calendar_today,
                      size: 35.0,
                    ),
                  )),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Waktu",
              style: GoogleFonts.pTSans(),
            ),
          ),
          UIHelper.verticalSpaceVerySmall,
          Row(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.0),
                    border: new Border.all(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  child: Text(Constants().timeFormat.format(waktu),
                      style: TextStyle(fontSize: FontsizeHelpers.txtSize16)),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      DatePicker.showTimePicker(context, showTitleActions: true,
                          onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        setState(() {
                          waktu = date;
                          print('confirm $date');
                        });
                      });
                    },
                    child: Icon(
                      Icons.access_time,
                      size: 35.0,
                    ),
                  )),
            ],
          ),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Nomor Stasiun", controller: nomorStasiun),
        ],
      ),
    );
  }

  Container _detailContentWind() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ConfigurableExpansionTile(
        headerExpanded: buildFlexibleExpansion(
            'Angin - Penglihatan - Keadaan Cuaca',
            Icon(Icons.keyboard_arrow_up),
            Colors.blueAccent),
        header: buildFlexibleExpansion('Angin - Penglihatan - Keadaan Cuaca',
            Icon(Icons.keyboard_arrow_down), Colors.blueAccent),
        children: [
          UIHelper.verticalSpaceMedium,
          DropDownContent(
            label: "Pengenal data Angin (iw)",
            data: Constants()
                .listPengenalDataAngin
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: pengenalDataAngin != null ? pengenalDataAngin : null,
            onChanged: (String value) {
              setState(() {
                pengenalDataAngin = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Arah Angin (derajat)",
              contentValue:
                  widget.awsStore.dataMonitoringModel.feeds.single.field5),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Kecepatan Angin (Knot)",
              contentValue:
                  widget.awsStore.dataMonitoringModel.feeds.single.field4),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Penglihatan Mendatar (vv) km",
              controller: penglihatanMendatar),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Pengenal Data Cuaca (ix)",
            data: Constants()
                .listPengenalDataCuaca
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: pengenalDataCuaca != null ? pengenalDataCuaca : null,
            onChanged: (String value) {
              setState(() {
                pengenalDataCuaca = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Keadaan Cuaca waktu pengamatan (ww)",
            data: Constants()
                .listKeadaanCuacaWaktuPengamat
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: keadaanCuacaWaktuPengamatan != null
                ? keadaanCuacaWaktuPengamatan
                : null,
            onChanged: (String value) {
              setState(() {
                keadaanCuacaWaktuPengamatan = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Keadaan cuaca yang lalu 1 (W1)",
            data: Constants()
                .listKeadaanCuacaLalu1
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: keadaanCuacaYangLalu1 != null ? keadaanCuacaYangLalu1 : null,
            onChanged: (String value) {
              setState(() {
                keadaanCuacaYangLalu1 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Keadaan cuaca yang lalu 2 (W2)",
            data: Constants()
                .listKeadaanCuacaLalu2
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: keadaanCuacaYangLalu2 != null ? keadaanCuacaYangLalu2 : null,
            onChanged: (String value) {
              setState(() {
                keadaanCuacaYangLalu2 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Container _detailContentAirPressure() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ConfigurableExpansionTile(
        headerExpanded: buildFlexibleExpansion(
            'Tekanan Udara', Icon(Icons.keyboard_arrow_up), Colors.blueAccent),
        header: buildFlexibleExpansion('Tekanan Udara',
            Icon(Icons.keyboard_arrow_down), Colors.blueAccent),
        children: [
          UIHelper.verticalSpaceMedium,
          _contentTextField("Derajat Panas (Celcius)",
              contentValue:
                  widget.awsStore.dataMonitoringModel.feeds.single.field2),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Tekanan dibaca (mb)",
              contentValue:
                  widget.awsStore.dataMonitoringModel.feeds.single.field1),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Perubahan Tekanan Udara (3 jam)",
              controller: perubahanTekananUdara3jam),
          UIHelper.verticalSpaceSmall,
          _contentTextField("QFF", controller: perubahanTekananUdara3jamQFF),
          UIHelper.verticalSpaceSmall,
          _contentTextField("QFE", controller: perubahanTekananUdara3jamQFE),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Perubahan Tekanan Udara (24 jam mb)",
              controller: perubahanTekananUdara24jam),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Selisih QFF dengan satu hari sebelumnya (24 jam)",
              controller: selisihQFF),
        ],
      ),
    );
  }

  Container _detailContentAirTemperature() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ConfigurableExpansionTile(
        headerExpanded: buildFlexibleExpansion(
            'Suhu Udara', Icon(Icons.keyboard_arrow_up), Colors.blueAccent),
        header: buildFlexibleExpansion(
            'Suhu Udara', Icon(Icons.keyboard_arrow_down), Colors.blueAccent),
        children: [
          UIHelper.verticalSpaceMedium,
          _contentTextField("Bola Kering (ºC)", controller: bolaKering),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Bola Basah (ºC)", controller: bolaBasah),
          UIHelper.verticalSpaceSmall,
          // StateBuilder<AwsStore>(
          //   builder: (context, reactive) {
          //     if (bolaKering.text != null && bolaBasah.text != null) {
          //       var value = double.parse(bolaBasah.text) - ((double.parse(bolaKering.text) - double.parse(bolaBasah.text)) / 2) ;
          //       setState(() {
          //         titikEmbun.text = value.toString();
          //       });
          //     } else {
          //     }
          //     return _contentTextField("Titik Embun (ºC)", controller: titikEmbun);
          //   },
          // ),
          _contentTextField("Titik Embun (ºC)", controller: titikEmbun),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Lembab Nisbi (%)",
              contentValue:
                  widget.awsStore.dataMonitoringModel.feeds.single.field3),
        ],
      ),
    );
  }

  Container _detailContentExtremeTemperature() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ConfigurableExpansionTile(
        headerExpanded: buildFlexibleExpansion(
            'Suhu Ekstrim', Icon(Icons.keyboard_arrow_up), Colors.blueAccent),
        header: buildFlexibleExpansion(
            'Suhu Ekstrim', Icon(Icons.keyboard_arrow_down), Colors.blueAccent),
        children: [
          UIHelper.verticalSpaceMedium,
          _contentTextField("Suhu Max (ºC)", controller: suhuMax),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Suhu Min (ºC)", controller: suhuMin),
        ],
      ),
    );
  }

  Container _detailContentSediment() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ConfigurableExpansionTile(
        headerExpanded: buildFlexibleExpansion(
            'Endapan', Icon(Icons.keyboard_arrow_up), Colors.blueAccent),
        header: buildFlexibleExpansion(
            'Endapan', Icon(Icons.keyboard_arrow_down), Colors.blueAccent),
        children: [
          UIHelper.verticalSpaceMedium,
          DropDownContent(
            label: "Pengenal data Hujan (iR) ",
            data: Constants()
                .listPengenalDataHujan
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: pengenalDataHujan != null ? pengenalDataHujan : null,
            onChanged: (String value) {
              setState(() {
                pengenalDataHujan = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Hujan realtime (mm)",
              contentValue:
                  widget.awsStore.dataMonitoringModel.feeds.single.field7),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Hujan sejak 3 jam yang lalu (RRR)",
              controller: hujanSejak3jam),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Hujan sejak 6 jam yang lalu (RRR)",
              controller: hujanSejak6jam),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Hujan sejak 24 jam yang lalu (RRRR)",
              controller: hujanSejak24jam),
        ],
      ),
    );
  }

  Container _detailContentWinds() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ConfigurableExpansionTile(
        headerExpanded: buildFlexibleExpansion(
            'Perawanan', Icon(Icons.keyboard_arrow_up), Colors.blueAccent),
        header: buildFlexibleExpansion(
            'Perawanan', Icon(Icons.keyboard_arrow_down), Colors.blueAccent),
        children: [
          UIHelper.verticalSpaceMedium,
          DropDownContent(
            label: "Awan rendah (jenis) CL",
            data: Constants()
                .listAwanRendahJenis
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: awanRendah != null ? awanRendah : null,
            onChanged: (String value) {
              setState(() {
                awanRendah = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Banyaknya (okta) Nh ",
            data: Constants()
                .listBanyakOktaNh
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: banyakOkta != null ? banyakOkta : null,
            onChanged: (String value) {
              setState(() {
                banyakOkta = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Tinggi Dasar Cl1(m)",
            data: Constants()
                .listArahCL1
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: tinggiDasarCL1 != null ? tinggiDasarCL1 : null,
            onChanged: (String value) {
              setState(() {
                tinggiDasarCL1 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Tinggi Puncak CL1 (m)",
              controller: tinggiPuncakCL1),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Arah CL1 (derajat)",
            data: Constants()
                .listArahCL1
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: arahCL1 != null ? arahCL1 : null,
            onChanged: (String value) {
              setState(() {
                arahCL1 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Sudut Elevasi CL1 (derajat)",
            data: Constants()
                .listSudutElevasiCL1
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: sudutElevasiCL1 != null ? sudutElevasiCL1 : null,
            onChanged: (String value) {
              setState(() {
                sudutElevasiCL1 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Tinggi Dasar CL2 (m) h",
            data: Constants()
                .listTinggiDasarCL2
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: tinggiDasarCL2 != null ? tinggiDasarCL2 : null,
            onChanged: (String value) {
              setState(() {
                tinggiDasarCL2 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Arah CL2 (derajat)",
            data: Constants()
                .listArahCL2
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: arahCL2 != null ? arahCL2 : null,
            onChanged: (String value) {
              setState(() {
                arahCL2 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Sudut Elevasi CL2 (derajat)",
            data: Constants()
                .listSudutElevasiCL2
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: sudutElevasiCL2 != null ? sudutElevasiCL2 : null,
            onChanged: (String value) {
              setState(() {
                sudutElevasiCL2 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Awan Menengah (jenis) CM",
            data: Constants()
                .listAwanMenengahJenis
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: awanMenengahJenis != null ? awanMenengahJenis : null,
            onChanged: (String value) {
              setState(() {
                awanMenengahJenis = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Awan Menengah (banyaknya)",
            data: Constants()
                .listAwanMenengahBanyak
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: awanMenengahBanyak != null ? awanMenengahBanyak : null,
            onChanged: (String value) {
              setState(() {
                awanMenengahBanyak = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Tingginya Awan Menengah (m)",
              controller: tinggiAwanMenengah),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Arah Awan Menengah (derajat)",
            data: Constants()
                .listArahAwanMenengah
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: arahAwanMenengah != null ? arahAwanMenengah : null,
            onChanged: (String value) {
              setState(() {
                arahAwanMenengah = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Awan Tinggi (banyaknya)",
            data: Constants()
                .listAwanTinggiBanyak
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: awanTinggiBanyak != null ? awanTinggiBanyak : null,
            onChanged: (String value) {
              setState(() {
                awanTinggiBanyak = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Awan Tinggi (jenis) CH",
            data: Constants()
                .listAwanTinggiJenis
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: awanTinggiJenis != null ? awanTinggiJenis : null,
            onChanged: (String value) {
              setState(() {
                awanTinggiJenis = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Arah awan tinggi (derajat)",
            data: Constants()
                .listArahAwanTinggi
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: arahAwanTinggi != null ? arahAwanTinggi : null,
            onChanged: (String value) {
              setState(() {
                arahAwanTinggi = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Tingginya (m)", controller: tingginya),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Bagian langit yang tertutup awan (okta) N",
            data: Constants()
                .listLangitTertutupAwan
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: bagianLangitTertutupAwan != null
                ? bagianLangitTertutupAwan
                : null,
            onChanged: (String value) {
              setState(() {
                bagianLangitTertutupAwan = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
        ],
      ),
    );
  }

  Container _detailContentCloudLayer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ConfigurableExpansionTile(
        headerExpanded: buildFlexibleExpansion(
            'Lapisan Awan', Icon(Icons.keyboard_arrow_up), Colors.blueAccent),
        header: buildFlexibleExpansion(
            'Lapisan Awan', Icon(Icons.keyboard_arrow_down), Colors.blueAccent),
        children: [
          UIHelper.verticalSpaceMedium,
          DropDownContent(
            label: "Jenis C1",
            data: Constants()
                .listJenisC1
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: jenisC1 != null ? jenisC1 : null,
            onChanged: (String value) {
              setState(() {
                jenisC1 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Tingginya hshs1", controller: tinggiHshs1),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Banyaknya (okta) NS1",
            data: Constants()
                .listBanyakNS1
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: banyakNS1 != null ? banyakNS1 : null,
            onChanged: (String value) {
              setState(() {
                banyakNS1 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Jenis C2",
            data: Constants()
                .listJenisC2
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: jenisC2 != null ? jenisC2 : null,
            onChanged: (String value) {
              setState(() {
                jenisC2 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Tingginya hshs2", controller: tinggiHshs2),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Banyaknya (okta) NS2",
            data: Constants()
                .listBanyakNS2
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: banyakNS2 != null ? banyakNS2 : null,
            onChanged: (String value) {
              setState(() {
                banyakNS2 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Jenis C3",
            data: Constants()
                .listJenisC3
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: jenisC3 != null ? jenisC3 : null,
            onChanged: (String value) {
              setState(() {
                jenisC3 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Tingginya hshs3", controller: tinggiHshs3),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Banyaknya (okta) NS3",
            data: Constants()
                .listBanyakNS3
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: banyakNS3 != null ? banyakNS3 : null,
            onChanged: (String value) {
              setState(() {
                banyakNS3 = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
        ],
      ),
    );
  }

  Container _detailContentSunlight(AwsStore data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ConfigurableExpansionTile(
        headerExpanded: buildFlexibleExpansion('Penyinaran Matahari',
            Icon(Icons.keyboard_arrow_up), Colors.blueAccent),
        header: buildFlexibleExpansion('Penyinaran Matahari',
            Icon(Icons.keyboard_arrow_down), Colors.blueAccent),
        children: [
          UIHelper.verticalSpaceMedium,
          DropDownContent(
            label: "Pengenal data alat penguapan (iE)",
            data: Constants()
                .listPengenalDataPenguapan
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: pengenalDataPenguapan != null ? pengenalDataPenguapan : null,
            onChanged: (String value) {
              setState(() {
                pengenalDataPenguapan = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Jumlah penguapan selama 24 jam yang lalu (mm)",
              controller: jumlahPenguapan24jam),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Radiasi (joule/cm²)",
              contentValue: data.dataMonitoringModel.feeds.single.field6),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Penyinaran Matahari (jam)",
              controller: penyinaranMatahari),
          UIHelper.verticalSpaceSmall,
        ],
      ),
    );
  }

  Container _detailContentConvectiveCloud() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ConfigurableExpansionTile(
        headerExpanded: buildFlexibleExpansion(
            'Awan Konvektif', Icon(Icons.keyboard_arrow_up), Colors.blueAccent),
        header: buildFlexibleExpansion('Awan Konvektif',
            Icon(Icons.keyboard_arrow_down), Colors.blueAccent),
        children: [
          UIHelper.verticalSpaceMedium,
          DropDownContent(
            label: "Jenis Awan Konvektif (C)",
            data: Constants()
                .listJenisAwanKonvektif
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: jenisAwanKonvektif != null ? jenisAwanKonvektif : null,
            onChanged: (String value) {
              setState(() {
                jenisAwanKonvektif = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Arah Awan Konvektif (Da)",
            data: Constants()
                .listArahAwanKonvektif
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: arahAwanKonvektif != null ? arahAwanKonvektif : null,
            onChanged: (String value) {
              setState(() {
                arahAwanKonvektif = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          DropDownContent(
            label: "Sudut Awan Konvektif (ec)",
            data: Constants()
                .listSudutAwanKonvektif
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: sudutAwanKonvektif != null ? sudutAwanKonvektif : null,
            onChanged: (String value) {
              setState(() {
                sudutAwanKonvektif = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
        ],
      ),
    );
  }

  Container _detailContentGround() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ConfigurableExpansionTile(
        headerExpanded: buildFlexibleExpansion('Tanah / Catatan',
            Icon(Icons.keyboard_arrow_up), Colors.blueAccent),
        header: buildFlexibleExpansion('Tanah / Catatan',
            Icon(Icons.keyboard_arrow_down), Colors.blueAccent),
        children: [
          UIHelper.verticalSpaceMedium,
          DropDownContent(
            label: "Keadaan Tanah",
            data: Constants()
                .listKeadaanTanah
                .map((f) => DropdownMenuItem(
                    child: Text(
                      f,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: f))
                .toList(),
            value: keadaanTanah != null ? keadaanTanah : null,
            onChanged: (String value) {
              setState(() {
                keadaanTanah = value;
              });
            },
          ),
          UIHelper.verticalSpaceSmall,
          _contentTextField("Catatan ", controller: catatan),
          UIHelper.verticalSpaceSmall,
        ],
      ),
    );
  }

  Widget _contentTextField(String title,
      {TextEditingController controller, String contentValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            title,
            style: GoogleFonts.pTSans(),
          ),
        ),
        UIHelper.verticalSpaceVerySmall,
        Container(
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: TextFormField(
              initialValue: contentValue,
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorHelpers.colorWhite,
                isDense: true,
                labelStyle: GoogleFonts.pTSans(
                    textStyle: TextStyle(color: Colors.black)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              )),
        ),
      ],
    );
  }
}

class DropDownContent extends StatelessWidget {
  const DropDownContent(
      {Key key, this.data, this.onChanged, this.value, this.label})
      : super(key: key);
  final dynamic value;
  final List<DropdownMenuItem> data;
  final Function onChanged;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            label,
            style: GoogleFonts.pTSans(),
          ),
        ),
        UIHelper.verticalSpaceVerySmall,
        DropdownButtonFormField<dynamic>(
          isExpanded: true,
          isDense: true,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelStyle:
                  GoogleFonts.pTSans(textStyle: TextStyle(color: Colors.black)),
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
          items: data,
          onChanged: (val) {
            onChanged(val);
          },
          value: value,
        ),
      ],
    );
  }
}
