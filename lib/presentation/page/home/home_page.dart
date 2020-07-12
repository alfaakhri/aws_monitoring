import 'package:aws_monitoring/domain/routes/routes.gr.dart';
import 'package:aws_monitoring/domain/usecase/aws_store.dart';
import 'package:aws_monitoring/external/color_helpers.dart';
import 'package:aws_monitoring/external/constants.dart';
import 'package:aws_monitoring/external/ui_helpers.dart';
import 'package:aws_monitoring/presentation/widgets/container_sensor.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final reactiveModel = Injector.getAsReactive<AwsStore>();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      //SmartRefresher adalah salah satu library untuk membantu mengambil data sensor tanpa mengulang membuka halaman.
      //Sehingga cukup dengan menarik layar atas ke bawah.
      body: SmartRefresher(
        controller: _refreshController,
        enablePullUp: false,
        child: buildCtn(),
        footer: ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
          completeDuration: Duration(milliseconds: 500),
        ),
        header: WaterDropMaterialHeader(color: Colors.black),
        onRefresh: () async {
          //monitor fetch data from network
          await Future.delayed(Duration(milliseconds: 1000));
          reactiveModel.setState((store) => store.getDataMonitoringModel());

          if (mounted) setState(() {});
          _refreshController.refreshCompleted();

          /*
          if(failed){
           _refreshController.refreshFailed();
          }
        */
        },
        onLoading: () async {
          //monitor fetch data from network
          await Future.delayed(Duration(milliseconds: 1000));
          if (mounted) setState(() {});
          _refreshController.loadFailed();
        },
      ),
    );
  }

  Widget buildCtn() {
    return StateBuilder(
      models: [Injector.getAsReactive<AwsStore>()],
      initState: (context, reactive) async {
        await reactive.setState((store) => store.getDataMonitoringModel());
      },
      builder: (context, reactive) {
        return reactive.whenConnectionState(
            onIdle: () => Center(
                  child: CircularProgressIndicator(),
                ),
            onWaiting: () => Center(
                  child: CircularProgressIndicator(),
                ),
            onData: (data) => _buildDetailHomeScreen(data),
            onError: (error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        Icons.refresh,
                        size: 40,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        reactiveModel.setState(
                            (store) => store.getDataMonitoringModel());
                      },
                    ),
                    UIHelper.verticalSpaceSmall,
                    Text(error.toString())
                  ],
                ),
              );
            });
      },
      child: Container(
        child: Text("Home Page"),
      ),
    );
  }

  Container _buildDetailHomeScreen(AwsStore data) {
    return Container(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(top: 75, right: 20, left: 20, bottom: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        data.dataMonitoringModel.channel.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: ColorHelpers.colorWhite),
                      ),
                    ),
                    UIHelper.verticalSpaceSmall,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Waktu Terbaru: ",
                                style: TextStyle(
                                  color: ColorHelpers.colorWhite,
                                  fontWeight: FontWeight.w700,
                                )),
                            Text(
                              "${Constants().dateFormat.format(DateTime.parse(data.dataMonitoringModel.feeds.single.createdAt.split("T")[0]))} ${data.dataMonitoringModel.feeds.single.createdAt.split("T")[1]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: ColorHelpers.colorWhite),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpaceVerySmall,
                        Container(
                          child: Text(
                            "Entry ID: ${data.dataMonitoringModel.feeds.single.entryId}",
                            style: TextStyle(color: ColorHelpers.colorWhite),
                          ),
                        ),
                        UIHelper.verticalSpaceMedium,
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                leading: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.mePage,
                                        arguments: MePageArguments(
                                            awsStore: data,
                                            isMe45: false));
                                  },
                                  child: CircleAvatar(
                                      minRadius: 25,
                                      maxRadius: 25,
                                      backgroundColor: Colors.white24,
                                      child: new Icon(Icons.note_add,
                                          color: Colors.white, size: 30)),
                                ),
                                title: Text(
                                  "ME 48",
                                  style:
                                      TextStyle(color: ColorHelpers.colorWhite),
                                ),
                              ),
                            ),
                            UIHelper.horizontalSpaceVerySmall,
                            Expanded(
                              child: ListTile(
                                leading: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.mePage,
                                        arguments: MePageArguments(
                                            awsStore: data,
                                            isMe45: true));
                                  },
                                  child: CircleAvatar(
                                      minRadius: 25,
                                      maxRadius: 25,
                                      backgroundColor: Colors.white24,
                                      child: new Icon(Icons.note_add,
                                          color: Colors.white, size: 30)),
                                ),
                                title: Text(
                                  "ME 45",
                                  style:
                                      TextStyle(color: ColorHelpers.colorWhite),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    UIHelper.verticalSpaceSmall,
                  ],
                ),
              ),
              UIHelper.verticalSpaceSmall,
              columnDataUnit(data),
            ],
          ),
        ],
      )),
    );
  }

  Widget columnDataUnit(AwsStore data) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          ContainerSensor(
            iconData: Icons.av_timer,
            title: 'Tekanan',
            data: "${data.dataMonitoringModel.feeds.single.field1}",
            unit: 'mBar',
          ),
          UIHelper.verticalSpaceSmall,
          ContainerSensor(
            iconData: Icons.ac_unit,
            title: 'Temperatur',
            data: "${data.dataMonitoringModel.feeds.single.field2}",
            unit: 'ºC',
          ),
          UIHelper.verticalSpaceSmall,
          ContainerSensor(
            iconData: Icons.cloud,
            title: 'Kelembaban Nisbi',
            data: "${data.dataMonitoringModel.feeds.single.field3}",
            unit: '%',
          ),
          UIHelper.verticalSpaceSmall,
          ContainerSensor(
            iconData: Icons.flash_auto,
            title: 'Kecepatan Angin',
            data: "${data.dataMonitoringModel.feeds.single.field4}",
            unit: 'm/s',
          ),
          UIHelper.verticalSpaceSmall,
          ContainerSensor(
            iconData: Icons.arrow_upward,
            title: 'Arah Angin',
            data: "${data.dataMonitoringModel.feeds.single.field5}",
            unit: 'Derajat',
          ),
          UIHelper.verticalSpaceSmall,
          ContainerSensor(
            iconData: Icons.wb_sunny,
            title: 'Radiasi matahari',
            data: "${data.dataMonitoringModel.feeds.single.field6}",
            unit: 'W/m^2',
          ),
          UIHelper.verticalSpaceSmall,
          ContainerSensor(
            iconData: Icons.cloud,
            title: 'Hujan',
            data: "${data.dataMonitoringModel.feeds.single.field7}",
            unit: 'mm',
          ),
        ],
      ),
    );
  }
}
