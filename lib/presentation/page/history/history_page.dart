import 'package:aws_monitoring/data/model/me_model/me_model.dart';
import 'package:aws_monitoring/domain/usecase/aws_store.dart';
import 'package:aws_monitoring/external/fontsize_helpers.dart';
import 'package:aws_monitoring/external/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final reactiveModel = Injector.getAsReactive<AwsStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat"),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: StateBuilder<AwsStore>(
            models: [Injector.getAsReactive<AwsStore>()],
            initState: (context, reactive) =>
                reactive.setState((store) => store.getDataAwsFromFirbase()),
            builder: (context, reactive) {
              return reactive.whenConnectionState(
                  onIdle: () => Container(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  onWaiting: () => Container(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  onData: (data) => _buildContainer(data),
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
                                  (store) => store.getDataAwsFromFirbase());
                            },
                          ),
                          UIHelper.verticalSpaceSmall,
                          Text(error.toString())
                        ],
                      ),
                    );
                  });
            },
          )),
    );
  }

  Widget _buildContainer(AwsStore data) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (context, index) {
          var listMe = data.listMeModel[index];

          return Card(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _titleContent(listMe),
                        UIHelper.verticalSpaceVerySmall,
                        Text(
                          "Sandi Pengenal: ${listMe.baseModel.sandiPengenal}",
                          style: TextStyle(fontSize: FontsizeHelpers.txtSize14),
                        ),
                        Text(
                          "Nomor Stasiun: ${listMe.baseModel.nomorStasiun}",
                          style: TextStyle(fontSize: FontsizeHelpers.txtSize14),
                        ),
                        UIHelper.verticalSpaceVerySmall,
                        Text(
                          "Hasil Penyandian: \n\n${listMe.hasilSandi}",
                          style: TextStyle(
                              fontSize: FontsizeHelpers.txtSize14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: data.listMeModel.length,
      ),
    );
  }

  Text _titleContent(MeModel listMe) {
    if (listMe.isMe48 == true) {
      return Text(
        listMe.baseModel.tanggal +
            " - " +
            listMe.baseModel.waktu +
            " ME48",
        style: TextStyle(
            fontSize: FontsizeHelpers.txtSize18, fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
          listMe.baseModel.tanggal +
              " - " +
              listMe.baseModel.waktu +
              " ME45",
          style: TextStyle(
              fontSize: FontsizeHelpers.txtSize18,
              fontWeight: FontWeight.bold));
    }
  }
}
