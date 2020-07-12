import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:aws_monitoring/data/model/data_monitoring_model.dart';
import 'package:aws_monitoring/data/model/me_model/me_model.dart';
import 'package:aws_monitoring/data/repository/repository.dart';
import 'package:aws_monitoring/data/service/datepicker_service.dart';
import 'package:aws_monitoring/data/service/firebase_service.dart';
import 'package:aws_monitoring/external/constants.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

//AWS store berisi method penunjang utama dari aplikasi ini.
//Seperti mengambil data monitor melalui apithingspeak, pembuatan sandi, mengirimkan sandi ke firebase dan generate file.txt
class AwsStore {
  Repository _repository = Repository();
  FirebaseService _firebaseService = FirebaseService();

  DataMonitoringModel _dataMonitoringModel = DataMonitoringModel();
  DataMonitoringModel get dataMonitoringModel => this._dataMonitoringModel;
  List<MeModel> _listMeModel = List<MeModel>();
  List<MeModel> get listMeModel => this._listMeModel;

  String _hasilSandi48;
  String get hasilSandi48 => this._hasilSandi48;

  String _hasilSandi45;
  String get hasilSandi45 => this._hasilSandi45;

  void getDataMonitoringModel() async {
    try {
      _dataMonitoringModel = await _repository.getDataMonitoring();
    } catch (e) {
      throw e;
    }
  }

  void getDataAwsFromFirbase() async {
    try {
      _listMeModel =
          await _firebaseService.getDataAws(Constants.CollectionDataAws);
    } catch (e) {
      throw e;
    }
  }

  //fungsi getter & setter data tanggal lahir
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  void setDate(dynamic date) {
    _selectedDate = date;
  }

  void getDate(BuildContext context) async {
    var date = await DatePickerService().selectDate(context);
    setDate(date);
  }

  //Inisialisasi penampung sandi berdasarkan urutan nomor dokumen penyandian
  String _sandi2,
      _sandi4,
      _sandi5,
      _sandi6,
      _sandi7,
      _sandi8,
      _sandi9,
      _sandi10,
      _sandi11,
      _sandi12,
      _sandi13,
      _sandi14,
      _sandi15,
      _sandi16,
      _sandi17,
      _sandi18,
      _sandi19,
      _sandi20,
      _sandi21,
      _sandi22,
      _sandi23,
      _sandi24,
      _sandi25;

  void createSandi(
      String sandiPengenal,
      String nomorStasiun,
      String tanggal,
      String waktu,
      String pengenalDataAngin,
      String arahAngin,
      String kecAngin,
      String penglihatanMendatar,
      String pengenalDataCuaca,
      String keadaanCuacaWaktuPengamatan,
      String keadaanCuacaLalu1,
      String keadaanCuacaLalu2,
      String derajatPanas,
      String tekananDibaca,
      String perubahanTekananUdara3jam,
      String perubahanTekananUdara3jamQFF,
      String perubahanTekananUdara3jamQFE,
      String perubahanTekananUdara24jam,
      String selisihQFF,
      String bolaKering,
      String bolaBasah,
      String titikEmbun,
      String lembabNisbi,
      String suhuMax,
      String suhuMin,
      String pengenalDataHujan,
      String hujanRealtime,
      String hujan3jamLalu,
      String hujan6jamLalu,
      String hujan24jamLalu,
      String awanRendahJenis,
      String banyakOktaNH,
      String tinggiDasarCL1,
      String tinggiPuncakCL1,
      String arahCL1,
      String sudutElevasiCL1,
      String tinggiDasarCL2,
      String arahCL2,
      String sudutElevasiCL2,
      String awanMenengahJenis,
      String awanMenengahBanyak,
      String tingginyaAwanMenengah,
      String arahAwanMenengah,
      String awanTinggiBanyak,
      String awanTinggiJenis,
      String arahAwanTinggi,
      String tingginya,
      String bagianLangit,
      String jenisC1,
      String tinggiHshs1,
      String banyakOktaNS1,
      String jenisC2,
      String tinggiHshs2,
      String banyakOktaNS2,
      String jenisC3,
      String tinggiHshs3,
      String banyakOktaNS3,
      String jenisAwanKonvektif,
      String arahAwanKonvektif,
      String sudutAwanKonvektif,
      String dataAlatPenguapan,
      String jumlahPenguapan,
      String radiasi,
      String penyinaranMatahari,
      String keadaanTanah,
      String catatan) async {
    var newStasiun = nomorStasiun.replaceRange(0, 0, "");
    print("newStasiun : $newStasiun");

    var newTanggal45 = Constants().dateFormat2.format(selectedDate);
    newTanggal45 = newTanggal45.toUpperCase();
    print("newTanggal45 : $newTanggal45");

    var newTime45 = waktu.split(":")[0]; //Misal 20:35 menjadi 20
    print("newTime: $newTime45");

    var newTanggal48 = Constants().dateFormat.format(selectedDate).split(
        ' ')[0]; //Format dan melakukan split. Misal 20 Juni 2020 menjadi 20
    var newTime48 = waktu.split(":")[0]; //

    //CEK LAGI DESIMAL ATAU BUKAN
    //Pengecekan arah angin
    var newArahAngin;
    //Kondisi panjang arah angin > 100 atau < 100 dilihat dari panjang string
    if (arahAngin.contains(".") == true) {
      if (arahAngin.length == 2) {
        newArahAngin =
            (newArahAngin).roundToDouble(); //Pembulatan. Misal 6.4 menjadi 6.0
        newArahAngin = newArahAngin.toString().replaceAll(".",
            ""); //Menghilankan desimal dan di konversi double kedalam String
        print("Arah Angin:" + newArahAngin);
      } else if (arahAngin.length == 3) {
        newArahAngin = (newArahAngin).roundToDouble();
        newArahAngin = newArahAngin.toString().replaceAll(".", "");

        print("Arah Angin:" + newArahAngin);
      }
    } else {
      if (arahAngin.length == 2) {
        newArahAngin = double.parse(StringUtils.addCharAtPosition(
            arahAngin,
            ".",
            1)); //Penambahan desimal dan konversi String kedalam double. Misal 64 menjadi 6.4
        newArahAngin =
            (newArahAngin).roundToDouble(); //Pembulatan. Misal 6.4 menjadi 6.0
        newArahAngin = newArahAngin.toString().replaceAll(".",
            ""); //Menghilankan desimal dan di konversi double kedalam String
        print("Arah Angin:" + newArahAngin);
      } else if (arahAngin.length == 3) {
        newArahAngin =
            double.parse(StringUtils.addCharAtPosition(arahAngin, ".", 2));
        newArahAngin = (newArahAngin).roundToDouble();
        newArahAngin = newArahAngin.toString().replaceAll(".", "");

        print("Arah Angin:" + newArahAngin);
      }
    }

    //Pengecekan kecepatan angin
    int newKecAngin;
    if (kecAngin.contains(".")) {
      newKecAngin = int.parse(kecAngin.split('.')[0]);
      newKecAngin = newKecAngin + 1;
      if (newKecAngin.toString().length == 1) {
        newKecAngin = int.parse(
            StringUtils.addCharAtPosition(newKecAngin.toString(), "0", 0));
      }
      print("Kecepatan Angin: " + newKecAngin.toString());
    } else {
      newKecAngin = int.parse(kecAngin);
      if (newKecAngin.toString().length == 1) {
        newKecAngin = int.parse(
            StringUtils.addCharAtPosition(newKecAngin.toString(), "0", 0));
      }
      print("Kecepatan Angin: " + newKecAngin.toString());
    }

    //Pengecekan BolaKering
    var newBolaKering;
    if (bolaKering.contains(".")) {
      newBolaKering =
          bolaKering.replaceAll(".", ""); //Menghilangkan desimal String
      print("Bola Kering: $newBolaKering");
    } else {
      newBolaKering = bolaKering;
      print("Bola Kering: $newBolaKering");
    }

    //Pengecekan BolaBasah
    var newBolaBasah = bolaBasah;
    if (newBolaBasah.contains(".")) {
      newBolaBasah = newBolaBasah.replaceAll(".", "");
    }

    //Pengecekan titik embun
    var newTitikEmbun;
    if (titikEmbun.contains(".")) {
      newTitikEmbun =
          titikEmbun.replaceAll(".", ""); //Menghilangkan desimal dalam String
      print("Titik embun: $newTitikEmbun");
    } else {
      newTitikEmbun = titikEmbun;
      print("Titik embun: $newTitikEmbun");
    }

    //Tinggi hshs 1
    var newTinggiHshs1;
    newTinggiHshs1 =
        int.parse(tinggiHshs1) / 30; //Konversi string kedalam integer

    //Tinggi hshs 2
    var newTinggiHshs2;
    newTinggiHshs2 = int.parse(tinggiHshs2) / 30;

    //Tinggi hshs 3
    var newTinggiHshs3;
    newTinggiHshs3 = int.parse(tinggiHshs3) / 30;

    //Tekanan udara 3 jam QFE
    String newQFE;
    if (perubahanTekananUdara3jamQFE.contains('.')) {
      newQFE = perubahanTekananUdara3jamQFE.replaceAll(".", "");
      if (newQFE.length == 5) {
        //Panjang string 5 digit
        newQFE = newQFE.substring(
            1); //Mengambil string mulai dari index ke 1. Misal 10245 maka menjadi 0245
        print("QFE: $newQFE");
      } else if (newQFE.length == 4) {
        newQFE = newQFE;
        print("QFE: $newQFE");
      }
    } else {
      newQFE = perubahanTekananUdara3jamQFE;
      if (newQFE.length == 5) {
        newQFE = newQFE.substring(1);
        print("QFE: $newQFE");
      } else if (newQFE.length == 4) {
        newQFE = newQFE;
      }
    }

    //Tekanan udara 3 jam QFF
    String newQFF;
    if (perubahanTekananUdara3jamQFF.contains(".")) {
      //Terdapat Desimal ?
      newQFF = perubahanTekananUdara3jamQFF.replaceAll(".", '');
      if (newQFF.length == 5) {
        newQFF = newQFF.substring(1);
        print("QFF: " + newQFF);
      } else if (newQFF.length == 4) {
        newQFF = newQFF;
        print("QFF: " + newQFF);
      }
    } else {
      newQFF = perubahanTekananUdara3jamQFF;
      if (newQFF.length == 5) {
        newQFF = newQFF.substring(1);
        print("QFF: $newQFF");
      } else if (newQFF.length == 4) {
        newQFF = newQFF;
        print("QFF: $newQFF");
      }
    }

    //Jumlah penguapan selama 24 jam
    var newJumlahPenguapan24jam;
    if (jumlahPenguapan.contains(".") == true) {
      //Terdapat desimal ?
      newJumlahPenguapan24jam = jumlahPenguapan.replaceAll(".", "");
      if (newJumlahPenguapan24jam.length == 2) {
        newJumlahPenguapan24jam =
            StringUtils.addCharAtPosition(newJumlahPenguapan24jam, "0", 0);
        print("Jumlah penguapan: $newJumlahPenguapan24jam");
      } else if (newJumlahPenguapan24jam.length == 3) {
        newJumlahPenguapan24jam = newJumlahPenguapan24jam;
        print("Jumlah penguapan: $newJumlahPenguapan24jam");
      }
    } else {
      newJumlahPenguapan24jam = jumlahPenguapan;
      if (newJumlahPenguapan24jam.length == 2) {
        newJumlahPenguapan24jam =
            StringUtils.addCharAtPosition(newJumlahPenguapan24jam, "0", 0);
        print("Jumlah penguapan: $newJumlahPenguapan24jam");
      } else if (newJumlahPenguapan24jam.length == 3) {
        newJumlahPenguapan24jam = newJumlahPenguapan24jam;
        print("Jumlah penguapan: $newJumlahPenguapan24jam");
      }
    }

    //Perubahan Tekanam Udara 3 jam
    var newPerubahanTekananUdara3jam;
    newPerubahanTekananUdara3jam = perubahanTekananUdara3jam;
    //Terdapat desimal ?
    if (newPerubahanTekananUdara3jam.contains(".") == true) {
      newPerubahanTekananUdara3jam = double.parse(newPerubahanTekananUdara3jam);
      newPerubahanTekananUdara3jam =
          (newPerubahanTekananUdara3jam).roundToDouble();
      newPerubahanTekananUdara3jam =
          newPerubahanTekananUdara3jam.toString().replaceAll(".", "");
      if (newPerubahanTekananUdara3jam.length == 2) {
        newPerubahanTekananUdara3jam =
            StringUtils.addCharAtPosition(newPerubahanTekananUdara3jam, "0", 0);
        print("PerubahanTekananUdara3jam: $newPerubahanTekananUdara3jam");
      } else {
        newPerubahanTekananUdara3jam = newPerubahanTekananUdara3jam;
        print("PerubahanTekananUdara3jam: $newPerubahanTekananUdara3jam");
      }
    } else {
      if (newPerubahanTekananUdara3jam.length == 2) {
        newPerubahanTekananUdara3jam = double.parse(
            StringUtils.addCharAtPosition(
                newPerubahanTekananUdara3jam, ".", 1));
        newPerubahanTekananUdara3jam =
            (newPerubahanTekananUdara3jam).roundToDouble();
        newPerubahanTekananUdara3jam =
            newPerubahanTekananUdara3jam.toString().replaceAll(".", "");
        newPerubahanTekananUdara3jam =
            StringUtils.addCharAtPosition(newPerubahanTekananUdara3jam, "0", 0);
        print("PerubahanTekananUdara3jam: $newPerubahanTekananUdara3jam");
      } else {
        newPerubahanTekananUdara3jam = double.parse(
            StringUtils.addCharAtPosition(
                newPerubahanTekananUdara3jam, ".", 2));
        newPerubahanTekananUdara3jam =
            (newPerubahanTekananUdara3jam).roundToDouble();
        newPerubahanTekananUdara3jam =
            newPerubahanTekananUdara3jam.toString().replaceAll(".", "");
        print("PerubahanTekananUdara3jam: $newPerubahanTekananUdara3jam");
      }
    }

    //Hujan 6 jam yang lalu
    String newHujan6jamlalu;
    if (hujan6jamLalu.contains(".")) {
      newHujan6jamlalu = hujan6jamLalu.replaceAll(".", "");
      if (newHujan6jamlalu.length == 2) {
        newHujan6jamlalu =
            StringUtils.addCharAtPosition(newHujan6jamlalu, "0", 0);
        print("newHujan6jamlalu: $newHujan6jamlalu");
      } else {
        newHujan6jamlalu = newHujan6jamlalu;
        print("newHujan6jamlalu: $newHujan6jamlalu");
      }
    } else {
      newHujan6jamlalu = hujan6jamLalu;
      if (newHujan6jamlalu.length == 2) {
        newHujan6jamlalu =
            StringUtils.addCharAtPosition(newHujan6jamlalu, "0", 0);
        print("newHujan6jamlalu: $newHujan6jamlalu");
      } else {
        newHujan6jamlalu = newHujan6jamlalu;
        print("newHujan6jamlalu: $newHujan6jamlalu");
      }
    }

    //Hujan 3 jam yang lalu
    String newHujan3jamlalu;
    if (hujan3jamLalu.contains(".")) {
      newHujan3jamlalu = hujan3jamLalu.replaceAll(".", "");
      if (newHujan3jamlalu.length == 2) {
        newHujan3jamlalu =
            StringUtils.addCharAtPosition(newHujan3jamlalu, "0", 0);
        print("newHujan3jamlalu: $newHujan3jamlalu");
      } else {
        newHujan3jamlalu = newHujan3jamlalu;
        print("newHujan3jamlalu: $newHujan3jamlalu");
      }
    } else {
      newHujan3jamlalu = hujan3jamLalu;
      if (newHujan3jamlalu.length == 2) {
        newHujan3jamlalu =
            StringUtils.addCharAtPosition(newHujan3jamlalu, "0", 0);
        print("newHujan3jamlalu: $newHujan3jamlalu");
      } else {
        newHujan3jamlalu = newHujan3jamlalu;
        print("newHujan3jamlalu: $newHujan3jamlalu");
      }
    }

    //Selisih QFF
    String newSelisihQFF;
    if (selisihQFF.contains(".")) {
      newSelisihQFF = selisihQFF.replaceAll(".", "");
      if (newSelisihQFF.length == 2) {
        newSelisihQFF = StringUtils.addCharAtPosition(newSelisihQFF, "0", 0);
      } else if (newSelisihQFF.length == 3) {
        newSelisihQFF = newSelisihQFF;
      }
    } else {
      newSelisihQFF = selisihQFF;
      if (newSelisihQFF.length == 2) {
        newSelisihQFF = StringUtils.addCharAtPosition(newSelisihQFF, "0", 0);
      } else if (newSelisihQFF.length == 3) {
        newSelisihQFF = newSelisihQFF;
      }
    }

    //Radiasi
    String newRadiasi;
    newRadiasi = radiasi;
    if (newRadiasi.contains(".")) {
      newRadiasi = newRadiasi.split(".")[0];
      if (newRadiasi.length == 2) {
        newRadiasi = StringUtils.addCharAtPosition(newRadiasi, "00", 0);
      } else if (newRadiasi.length == 3) {
        newRadiasi = StringUtils.addCharAtPosition(newRadiasi, "0", 0);
      } else if (newRadiasi == "0") {
        newRadiasi = "0000";
      }
    } else {
      if (newRadiasi.length == 2) {
        newRadiasi = StringUtils.addCharAtPosition(newRadiasi, "00", 0);
      } else if (newRadiasi.length == 3) {
        newRadiasi = StringUtils.addCharAtPosition(newRadiasi, "0", 0);
      } else if (newRadiasi == "0") {
        newRadiasi = "0000";
      }
    }

    //Penyinaran matahari
    String newPenyinaranMatahari;
    newPenyinaranMatahari = penyinaranMatahari.replaceAll(".", "");
    if (newPenyinaranMatahari.length == 2) {
      newPenyinaranMatahari =
          StringUtils.addCharAtPosition(newPenyinaranMatahari, "0", 0);
      print("Penyinaran matahari: $newPenyinaranMatahari");
    } else if (newPenyinaranMatahari.length == 3) {
      newPenyinaranMatahari = newPenyinaranMatahari;
      print("Penyinaran matahari: $newPenyinaranMatahari");
    }

    _sandi2 = newTanggal48 + newTime48 + pengenalDataAngin.split("-")[0];
    _sandi4 = pengenalDataHujan.split("-")[0] +
        pengenalDataCuaca.split("-")[0] +
        tinggiDasarCL1.split("-")[0] +
        penglihatanMendatar;
    _sandi5 =
        bagianLangit.split('-')[0] + newArahAngin + newKecAngin.toString();
    _sandi6 = "10" + newBolaKering;
    _sandi7 = "20" + newTitikEmbun;
    _sandi8 = "3" + newQFE;
    _sandi9 = "4" + newQFF;
    _sandi10 = "52" + newPerubahanTekananUdara3jam;
    _sandi11 = "6" + newHujan6jamlalu + "1";
    _sandi12 = "7" +
        keadaanCuacaWaktuPengamatan.split("-")[0] +
        keadaanCuacaLalu1.split("-")[0] +
        keadaanCuacaLalu2.split("-")[0];
    _sandi13 = "8" +
        banyakOktaNH.split("-")[0] +
        awanRendahJenis.split("-")[0] +
        awanMenengahJenis.split("-")[0] +
        awanTinggiJenis.split("-")[0];
    _sandi14 = "333 10" + suhuMax.replaceAll(".", "");
    _sandi15 = "20" + suhuMin.replaceAll(".", "");
    _sandi16 = "5" + newJumlahPenguapan24jam + dataAlatPenguapan.split("-")[0];
    _sandi17 = "55" + newPenyinaranMatahari;
    _sandi18 = "55508 5" + newRadiasi;
    _sandi19 = "56" +
        arahCL1.split("-")[0] +
        arahAwanMenengah.split("-")[0] +
        arahAwanTinggi.split("-")[0];
    _sandi20 = "57" +
        jenisAwanKonvektif.split("-")[0] +
        arahAwanKonvektif.split("-")[0] +
        sudutAwanKonvektif.split("-")[0];
    _sandi21 = "58" + newSelisihQFF;
    _sandi22 = "6" + newHujan3jamlalu + "7";
    _sandi23 = _sandi20 = "8" +
        banyakOktaNS1.split("-")[0] +
        jenisC1.split("-")[0] +
        newTinggiHshs1.toString().split(".")[0];
    _sandi24 = "8" +
        banyakOktaNS2.split("-")[0] +
        jenisC2.split("-")[0] +
        newTinggiHshs2.toString().split(".")[0];
    _sandi25 = "8" +
        banyakOktaNS3.split("-")[0] +
        jenisC3.split("-")[0] +
        newTinggiHshs3.toString().split(".")[0];

    print(
        "1. $sandiPengenal 2. $_sandi2 3. $nomorStasiun 4. $_sandi4 5. $_sandi5 6. $_sandi6 7. $_sandi7 8. $_sandi8 9. $_sandi9 10. $_sandi10 11. $_sandi11 12. $_sandi12 13. $_sandi13 14. $_sandi14 15. $_sandi15 16. $_sandi16 17. $_sandi17 18. $_sandi18 19. $_sandi19 20. $_sandi20 21. $_sandi21 22. $_sandi22 23. $_sandi23 24. $_sandi24 25. $_sandi25");
    _hasilSandi48 = sandiPengenal +
        " " +
        _sandi2 +
        " " +
        nomorStasiun +
        " " +
        _sandi4 +
        " " +
        _sandi5 +
        " " +
        _sandi6 +
        " " +
        _sandi7 +
        " " +
        _sandi8 +
        " " +
        _sandi9 +
        " " +
        _sandi10 +
        " " +
        _sandi11 +
        " " +
        _sandi12 +
        " " +
        _sandi13 +
        " " +
        _sandi14 +
        " " +
        _sandi15 +
        " " +
        _sandi16 +
        " " +
        _sandi17 +
        " " +
        _sandi18 +
        " " +
        _sandi19 +
        " " +
        _sandi20 +
        " " +
        _sandi21 +
        " " +
        _sandi22 +
        " " +
        _sandi23 +
        " " +
        _sandi24 +
        " " +
        _sandi25;

    print(
        "1. $newStasiun 2. $newTanggal45 3. $newTime45 4. $newTitikEmbun 5. ${bagianLangit.split('-')[0]} 6. $newArahAngin 7. $newKecAngin 8. $penglihatanMendatar 9. ${keadaanCuacaWaktuPengamatan.split("-")[0]} 10. ${keadaanCuacaLalu1.split("-")[0]} 11. ${keadaanCuacaLalu2.split("-")[0]} 12. $newQFF 13. $newBolaKering 14. ${banyakOktaNH.split("-")[0]} 15. ${awanRendahJenis.split("-")[0]} 16. ${tinggiDasarCL1.split("-")[0]} 17. ${awanMenengahJenis.split("-")[0]} 18. ${awanTinggiJenis.split("-")[0]} 19. ${banyakOktaNS1.split("-")[0]} 20. ${jenisC1.split("-")[0]} 21. ${newTinggiHshs1.toString().split(".")[0]} 22. ${banyakOktaNS2.split("-")[0]} 23. ${jenisC2.split("-")[0]} 24. ${newTinggiHshs2.toString().split(".")[0]} 25. 0 26. ${jenisC3.split("-")[0]} 27. ${newTinggiHshs3.toString().split(".")[0]} 28. ${jenisAwanKonvektif.split("-")[0]} 29. ${arahAwanKonvektif.split("-")[0]} 30. ${sudutAwanKonvektif.split("-")[0]} 31. ${lembabNisbi.split(".")[0]} 32. $newQFE 33. $newBolaBasah 34. $newHujan6jamlalu 35. 1 36. ${suhuMax.replaceAll(".", "")} 37. ${suhuMin.replaceAll(".", "")} 38. $newJumlahPenguapan24jam 39. $newRadiasi 40. $newPenyinaranMatahari 41. ${arahCL1.split("-")[0]} 42. ${arahAwanMenengah.split("-")[0]} 43. ${arahAwanTinggi.split("-")[0]} 44. $newSelisihQFF 45. ${pengenalDataAngin.split("-")[0]} 46. ${pengenalDataCuaca.split("-")[0]} 47. ${pengenalDataHujan.split("-")[0]} 48. ${dataAlatPenguapan.split("-")[0]}");
    _hasilSandi45 = newStasiun +
        newTanggal45 +
        "\n" +
        newTime45 +
        newTitikEmbun +
        bagianLangit.split('-')[0] +
        newArahAngin +
        newKecAngin.toString() +
        penglihatanMendatar +
        keadaanCuacaWaktuPengamatan.split("-")[0] +
        keadaanCuacaLalu1.split("-")[0] +
        keadaanCuacaLalu2.split("-")[0] +
        newQFF +
        newBolaKering +
        banyakOktaNH.split("-")[0] +
        awanRendahJenis.split("-")[0] +
        tinggiDasarCL1.split("-")[0] +
        awanMenengahJenis.split("-")[0] +
        awanTinggiJenis.split("-")[0] +
        banyakOktaNS1.split("-")[0] +
        jenisC1.split("-")[0] +
        newTinggiHshs1.toString().split(".")[0] +
        banyakOktaNS2.split("-")[0] +
        jenisC2.split("-")[0] +
        newTinggiHshs2.toString().split(".")[0] +
        "0" +
        jenisC3.split("-")[0] +
        newTinggiHshs3.toString().split(".")[0] +
        jenisAwanKonvektif.split("-")[0] +
        arahAwanKonvektif.split("-")[0] +
        sudutAwanKonvektif.split("-")[0] +
        lembabNisbi.split(".")[0] +
        newQFE +
        newBolaBasah +
        newHujan6jamlalu +
        "1" +
        suhuMax.replaceAll(".", "") +
        suhuMin.replaceAll(".", "") +
        newJumlahPenguapan24jam +
        newRadiasi +
        newPenyinaranMatahari +
        arahCL1.split("-")[0] +
        arahAwanMenengah.split("-")[0] +
        arahAwanTinggi.split("-")[0] +
        newSelisihQFF +
        pengenalDataAngin.split("-")[0] +
        pengenalDataCuaca.split("-")[0] +
        pengenalDataHujan.split("-")[0] +
        dataAlatPenguapan.split("-")[0];
    print("Hasil sandi 45 : $_hasilSandi45");
  }

  void sendDataToFirebase(var data) async {
    print("sendData : $data");
    var newData = {'Data': data};
    try {
      await _firebaseService.addingDataAws(
          newData, Constants.CollectionDataAws);
      saveDataToLocal(newData);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  void saveDataToLocal(var data) async {
    var rand = new Random();
    DateTime now = DateTime.now();

    String formattedDate = Constants().dateFormat.format(now);

    try {
      final Directory directory = await getExternalStorageDirectory();
      final File file = File('${directory.path}/File AWS/$formattedDate/$formattedDate-${rand.nextInt(1000)}.txt');
      await file.writeAsString(jsonEncode(data));
      readData();
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> readData() async {
    try {
      final Directory directory = await getExternalStorageDirectory();
      final File file = File('${directory.path}/data.txt');

      // Read the file.
      var contents = await file.readAsString();

      print(contents);
    } catch (e) {
      // If encountering an error, return 0.
      return 0;
    }
  }
}
