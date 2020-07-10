import 'package:aws_monitoring/data/model/user_model.dart';
import 'package:aws_monitoring/data/service/shared_preference_service.dart';
import 'package:aws_monitoring/domain/routes/routes.gr.dart';
import 'package:aws_monitoring/domain/usecase/providers/user_provider.dart';
import 'package:aws_monitoring/domain/usecase/user_store.dart';
import 'package:aws_monitoring/external/constants.dart';
import 'package:aws_monitoring/external/ui_helpers.dart';
import 'package:aws_monitoring/presentation/widgets/logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final reactiveModel = Injector.getAsReactive<UserStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        leading: new Container(),
        elevation: 0.0,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                    value: choice, child: Text(choice));
              }).toList();
            },
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Consumer<UserProvider>(
        builder: (context, data, _) => Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                UIHelper.verticalSpaceMedium,
                LogoWidget(
                  padding: 0,
                ),
                SizedBox(
                  height: 100.0,
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(
                    'Nama',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  subtitle: Text(
                    (data.userModel != null) ? data.userModel.fullname : '-',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Divider(
                  indent: 70,
                  color: Colors.grey,
                  height: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.mail),
                  title: Text(
                    'Email',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  subtitle: Text(
                    (data.userModel != null) ? data.userModel.email : '-',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Divider(
                  indent: 70,
                  color: Colors.grey,
                  height: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    'Alamat',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  subtitle: Text(
                    (data.userModel != null) ? data.userModel.address : '-',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Divider(
                  indent: 70,
                  color: Colors.grey,
                  height: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void choiceAction(String choice) {
    SharedPreferenceService().clearUserData();
    Provider.of<UserProvider>(context).setUser(null);
    Navigator.pushReplacementNamed(context, Routes.loginPage);
  }
}
