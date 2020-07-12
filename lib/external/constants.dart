import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//Constanst berisi data variable yang value nya tidak bisa diubah dan bisa digunakan berkali-kali atau disebut reusable
class Constants {
  var uuid = Uuid();

  static const String CollectionDataAws = "DataInputAws";
  static const String Logout = 'Keluar';
  static const API_URL =
      'https://api.thingspeak.com/channels/983571/feeds.json?results=1';

  static const List<String> choices = <String>[Logout];

  var dateFormat = DateFormat("dd MMM yyyy");
  var dateFormat2 = DateFormat("ddMMMyy");

  var timeFormat = DateFormat.Hm();

  //-----------------Data Content Dropdown------------------
  final List<String> listSandiPengenal = ['AAXX', 'BBXX'];
  final List<String> listPengenalDataAngin = [
    '3-(wind speed estimated)',
    '4-(wind speed from anemometer)'
  ];
  final List<String> listPengenalDataCuaca = [
    '1-manned station, weather group included',
    '2-manned station, omitted, no significant weather',
    '3-manned station, omitted, no significant weather',
    '4-automated station, weather group included (code 4677 and 4561),',
    '5-automated station, omitted, weather group',
    '6-automated station, omitted, no weather observation',
    '7-automated station, weather group included(code 4680 and 4531)'
  ];
  final List<String> listKeadaanCuacaWaktuPengamat = [
    '00-Clear skies',
    '01-Clouds dissolving',
    '02-state of sky unchanged',
    '03-Clouds developing',
    '04-Visibility reduced by smoke',
    '05-Haze',
    '06-Widespread dust in suspension not raised by wind',
    '07-Dust or sand raised by wind',
    '08-Well developed dust or sand whirls',
    '09-Dust or sand strom within sight but not at station',
    '10-Mist',
    '11-Patches of shallow fog',
    '12-Continuous shallow fog',
    '13-Lighting visible, no thunder heard',
    '14-Precipitation within sight but not hitting ground',
    '15-Distant precipitation but not failing at station',
    '16-Nearby precipitation but failing at station',
    '17-Thunderstrom but no precipitation failing at station',
    '18-Squalls within sight but no precipitation failing at station',
    '19-Funned clouds within sight',
    '20-Drizzle',
    '21-Rain',
    '22-Snow',
    '23-Rain and snow',
    '24-Freezing rain',
    '25-Rain showers',
    '26-Snow showers',
    '27-Hail showers',
    '28-Fog',
    '29-Thunderstorms',
    '30-Slight to moderate duststorm, decreasing in intensity',
    '31-Slight to moderate duststrom, no change',
    '32-Slight to moderate duststrom, increasing in intensity',
    '33-Severe duststorm, decreasing in intensity',
    '34-Severe duststorm, no change',
    '35-Severe duststorm, increasing in intensity',
    '36-Slight to moderate drifting snow, below eye level',
    '37-Heavy drifting snow, below eye level',
    '38-SLight to moderate drifting snow, above eye level',
    '39-Heavy drifting snow, above eye level',
    '40-Fot at a distance',
    '41-Patches of fog',
    '42-Fog, sky visible, thinning',
    '43-Fog, sky not visible, thinning',
    '44-Fog, sky visibile, no change',
    '45-Fotm sky not visible, no change',
    '46-Fot, sky visible, becoming thicker',
    '47-Fog, sky not visible, becoming thicker',
    '48-Fog, depositing rime, sky visible',
    '49-Fog, depositing rime, sky not visible',
    '50-Intermittent light drizzle',
    '51-Continuous light drizzle',
    '52-Intermittent moderate drizzle',
    '53-Continuous moderate drizzle',
    '54-Intermittent heave drizzle',
    '55-Continuous heavy drizzle',
    '56-Light freezing drizzle',
    '57-Moderate to heavy frezzing drizzle',
    '58-Light drizzle and rain',
    '59-Moderate to heavy drizzle and rain',
    '60-Intermittent light rain',
    '61-Continuous light rain',
    '62-Intermittent moderate rain',
    '63-Continuous moderate rain',
    '64-Intermittent heavy rain',
    '65-Continuous heavy rain',
    '66-Light freezing rain',
    '67-Moderate to heavy freezing rain',
    '68-Light rain and snow',
    '69-Moderate to heavy rain and snow',
    '70-Intermittent light snow',
    '71-Continuous light snow',
    '72-Intermittent moderate snow',
    '73-Continuous moderate snow',
    '74-Intermittent heavy snow',
    '75-Continuous moderate snow',
    '76-Diamond dust',
    '77-Snow grains',
    '78-Snow crystals',
    '79-Ice pellets',
    '80-Light rain showers',
    '81-Moderate to heavy rain showers',
    '82-Violent rain showers',
    '83-Light rain and snow showers',
    '84-Moderate to heavy rain and snow showers',
    '85-Light snow showers',
    '86-Moderate to heavy snow showers',
    '87-Light snow/ice pellet showers',
    '88-Moderate to heavy snow/ice pellet showers',
    '89-Light hail showers',
    '90-Moderate to heavy hail showers',
    '91-Thunderstorm in past hour, currently only light rain',
    '92-Thunderstorm in past hour, currently only moderate to heavy',
    '93-Thunderstorm in past hour, currently only light snow or rain',
    '94-Thunderstorm in past hour, currently only moderate to heavy',
    '95-Light to moderate thunderstorm',
    '96-Light to moderate thunderstorm with hail',
    '97-Heavy thunderstorm',
    '98-Thunderstorm combined with duststorm or sandstorm at time',
    '99-Thunderstorm, heavy, with hail at time of observation'
  ];
  final List<String> listKeadaanCuacaLalu1 = [
    '0-Cloud covering less than half of sky',
    '1-Cloud covering more than half of sky during part of period and more..',
    '2-Cloud covering more than half of sky',
    '3-Sandstorm, duststorm or blowing snow',
    '4-fog, or thick haze.',
    '5-Drizzle',
    '6-Rain',
    '7-Snow or mixed rain and snow',
    '8-Showers',
    '9-Thunderstorms'
  ];
  final List<String> listKeadaanCuacaLalu2 = [
    '0-Cloud covering less than half of sky',
    '1-Cloud covering more than half of sky during part of period and more..',
    '2-Cloud covering more than half of sky',
    '3-Sandstorm, duststorm or blowing snow',
    '4-fog, or thick haze.',
    '5-Drizzle',
    '6-Rain',
    '7-Snow or mixed rain and snow',
    '8-Showers',
    '9-Thunderstorms'
  ];
  final List<String> listPengenalDataHujan = [
    '0-Hujan dilaporkan pada seksi 1 dan seksi 3',
    '1-Hujan dilaporkan hanya seksi 1 saja',
    '2-Hujan dilaporkan pada seksi 3 saja',
    '3-Tidak terjadi hujan pada jam penakaran',
    '4-Tidak melakukan pengamatan curah hujan'
  ];
  final List<String> listAwanRendahJenis = [
    '0-Tidak ada awan C1',
    '1-Cumus humilis atau fracto cumulus atau kedua-duanya',
    '2-Cumulus mediocris atau congestus, disertai atau tidak disertai fracto',
    '3-Cumulunimbus tanpa landasan, disertain atau tidak disertai cumulus',
    '4-Stratocumulus yang terjadi dari bentangan cumulus',
    '5-Stratocumulus yang tidak terjadi dari bentangan cumulus',
    '6-Stratus',
    '7-Fraktostratus atau fraktocumulus yang menyertai cuaca buruk, biasa',
    '8-Cumulus dan stratocumulus yang tidak terjadi dari bentangan cumulus',
    '9-Cumulunimbus, biasanya berlandasan disertai atau tidak disertai cumulus.',
    '/-C1 tidak kelihatan disebabkan oleh kabut, badai debu, badai pasir'
  ];
  final List<String> listBanyakOktaNh = [
    '0',
    '1-okta or less, but not zero',
    '2-oktas',
    '3-oktas',
    '4-oktas',
    '5-oktas',
    '6-oktas',
    '7-oktas or more, but not eight',
    '8-oktas',
    '9-sky obscured by fog',
    '/-cloud cover is indiscernible for reasons other'
  ];
  final List<String> listTinggiDasarCL1 = [
    '4-300 s/d 600m',
    '5-600 s/d 1000m',
    '6- >2500m'
  ];
  final List<String> listArahCL1 = [
    '0-Stationary or no clouds',
    '1-NE',
    '2-E',
    '3-SE',
    '4-S',
    '5-SW',
    '6-W',
    '7-NW',
    '8-N',
    '9-All Directions or invisible'
  ];
  final List<String> listSudutElevasiCL1 = [
    '0-Top of cloud not visible',
    '1-45 derajat',
    '2-About 30 derajat',
    '3-About 20 derajat',
    '4-About 15 derajat',
    '5-About 12 derajat',
    '6-About 9 derajat',
    '7-About 7 derajat',
    '8-About 6 derajat',
    '9-Less than 5 derajat'
  ];
  final List<String> listTinggiDasarCL2 = [
    '4-300 s/d 600m',
    '5-600 s/d 1000m',
    '6- >2500m'
  ];
  final List<String> listArahCL2 = [
    '0-Stationary or no clouds',
    '1-NE',
    '2-E',
    '3-SE',
    '4-S',
    '5-SW',
    '6-W',
    '7-NW',
    '8-N',
    '9-All Directions or invisible'
  ];
  final List<String> listSudutElevasiCL2 = [
    '0-Top of cloud not visible',
    '1-45 derajat',
    '2-About 30 derajat',
    '3-About 20 derajat',
    '4-About 15 derajat',
    '5-About 12 derajat',
    '6-About 9 derajat',
    '7-About 7 derajat',
    '8-About 6 derajat',
    '9-Less than 5 derajat'
  ];
  final List<String> listAwanMenengahJenis = [
    '0-No CM cloud',
    '1-Altostratus translucidus',
    '2-Altostratus opacus',
    '3-Altocumulus translucidus at a single level',
    '4-Patches(often lenticular)',
    '5-Altocumulus translucidius in bands',
    '6-Altocumulus cumulogenitus',
    '7-Altocumulus translucidius or opacus in two or more layers',
    '8-Altocumulus castellanus',
    '9-Altocumulus of a chaotic sky',
    '/-CM clouds invisible owing to darkness'
  ];
  final List<String> listAwanMenengahBanyak = [
    '0',
    '1-okta or less, but not zero',
    '2-oktas',
    '3-oktas',
    '4-oktas',
    '5-oktas',
    '6-oktas',
    '7-oktas or more, but not eight',
    '8-oktas',
    '9-sky obscured by fog',
    '/-cloud cover is indiscernible for reasons other'
  ];
  final List<String> listArahAwanMenengah = [
    '0-Stationary or no clouds',
    '1-NE',
    '2-E',
    '3-SE',
    '4-S',
    '5-SW',
    '6-W',
    '7-NW',
    '8-N',
    '9-All Directions or invisible'
  ];
  final List<String> listAwanTinggiBanyak = [
    '0',
    '1-okta or less, but not zero',
    '2-oktas',
    '3-oktas',
    '4-oktas',
    '5-oktas',
    '6-oktas',
    '7-oktas or more, but not eight',
    '8-oktas',
    '9-sky obscured by fog',
    '/-cloud cover is indiscernible for reasons other'
  ];
  final List<String> listAwanTinggiJenis = [
    '0-No CH clouds',
    '1-Cirrus fibratis',
    '2-Cirrus spissatus, in patches or entangled sheaves',
    '3-Cirrus spissatus cumulonumbogenitus',
    '4-Cirrus uncinus or fibratus',
    '5-Cirrus (often in bands) and Cirrostratus',
    '6-Cirrus (often in bands) and Cirrostratus',
    '7-Cirrostratus covering the whole sky',
    '8-Cirrostratus not progressively',
    '9-Cirrocumulus alone',
    '/-CH clouds not visible owing to darkness'
  ];
  final List<String> listArahAwanTinggi = [
    '0-Stationary or no clouds',
    '1-NE',
    '2-E',
    '3-SE',
    '4-S',
    '5-SW',
    '6-W',
    '7-NW',
    '8-N',
    '9-All Directions or invisible'
  ];
  final List<String> listLangitTertutupAwan = [
    '0',
    '1-okta or less, but not zero',
    '2-oktas',
    '3-oktas',
    '4-oktas',
    '5-oktas',
    '6-oktas',
    '7-oktas or more, but not eight',
    '8-oktas',
    '9-sky obscured by fog',
    '/-cloud cover is indiscernible for reasons other'
  ];
  final List<String> listJenisC1 = [
    '-',
    '0-Cirrus (Ci)',
    '1-Cirrocumulus (Cc)',
    '2-Cirrostratus (Cs)',
    '3-Altocumulus (Ac)',
    '4-Altostratus (As)',
    '5-Nimbostratus (Ns)',
    '6-Stratocumulus (Sc)',
    '7-Stratus (St)',
    '8-Cumulus (Cu)',
    '9-Cumulonimbus (Cb)',
    '/-Cloud not visible'
  ];
  final List<String> listBanyakNS1 = [
    '0',
    '1-okta or less, but not zero',
    '2-oktas',
    '3-oktas',
    '4-oktas',
    '5-oktas',
    '6-oktas',
    '7-oktas or more, but not eight',
    '8-oktas',
    '9-sky obscured by fog',
    '/-cloud cover is indiscernible for reasons other'
  ];
  final List<String> listJenisC2 = [
    '-',
    '0-Cirrus (Ci)',
    '1-Cirrocumulus (Cc)',
    '2-Cirrostratus (Cs)',
    '3-Altocumulus (Ac)',
    '4-Altostratus (As)',
    '5-Nimbostratus (Ns)',
    '6-Stratocumulus (Sc)',
    '7-Stratus (St)',
    '8-Cumulus (Cu)',
    '9-Cumulonimbus (Cb)',
    '/-Cloud not visible'
  ];
  final List<String> listBanyakNS2 = [
    '0',
    '1-okta or less, but not zero',
    '2-oktas',
    '3-oktas',
    '4-oktas',
    '5-oktas',
    '6-oktas',
    '7-oktas or more, but not eight',
    '8-oktas',
    '9-sky obscured by fog',
    '/-cloud cover is indiscernible for reasons other'
  ];
  final List<String> listJenisC3 = [
    '-',
    '0-Cirrus (Ci)',
    '1-Cirrocumulus (Cc)',
    '2-Cirrostratus (Cs)',
    '3-Altocumulus (Ac)',
    '4-Altostratus (As)',
    '5-Nimbostratus (Ns)',
    '6-Stratocumulus (Sc)',
    '7-Stratus (St)',
    '8-Cumulus (Cu)',
    '9-Cumulonimbus (Cb)',
    '/-Cloud not visible'
  ];
  final List<String> listBanyakNS3 = [
    '0',
    '1-okta or less, but not zero',
    '2-oktas',
    '3-oktas',
    '4-oktas',
    '5-oktas',
    '6-oktas',
    '7-oktas or more, but not eight',
    '8-oktas',
    '9-sky obscured by fog',
    '/-cloud cover is indiscernible for reasons other'
  ];
  final List<String> listPengenalDataPenguapan = [
    '0-Panci terbuka tanpa adanya penutup',
    '1-Panci tertutup. Biasanya ditutup dengan kawat'
  ];
  final List<String> listKeadaanTanah = [
    '0-Kering',
    '1-Lembab',
    '2-Basah',
    '3-Tergenang'
  ];

  final List<String> listJenisAwanKonvektif = [
    '8-Cumulus dan stratocumulus yang tidak terjadi dari bentangan cumulus',
    '9-Cumulunimbus, biasanya berlandasan disertai atau tidak disertai cumulus.',
  ];

  final List<String> listArahAwanKonvektif = [
    '0-Stationary or no clouds',
    '1-NE',
    '2-E',
    '3-SE',
    '4-S',
    '5-SW',
    '6-W',
    '7-NW',
    '8-N',
    '9-All Directions or invisible'
  ];

  final List<String> listSudutAwanKonvektif = [
    '0-Top of cloud not visible',
    '1-45 derajat',
    '2-About 30 derajat',
    '3-About 20 derajat',
    '4-About 15 derajat',
    '5-About 12 derajat',
    '6-About 9 derajat',
    '7-About 7 derajat',
    '8-About 6 derajat',
    '9-Less than 5 derajat'
  ];
}
