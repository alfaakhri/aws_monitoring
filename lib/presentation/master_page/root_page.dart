import 'dart:async';

import 'package:aws_monitoring/domain/routes/routes.gr.dart';
import 'package:aws_monitoring/domain/usecase/providers/user_provider.dart';
import 'package:aws_monitoring/domain/usecase/user_store.dart';
import 'package:aws_monitoring/presentation/master_page/login_page.dart';
import 'package:aws_monitoring/presentation/master_page/nav_bottom_page.dart';
import 'package:aws_monitoring/presentation/widgets/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

//RootPage adalah widget yang diproses setelah main.dart selesai.
class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return StateBuilder<UserStore>(
      models: [Injector.getAsReactive<UserStore>()],
      initState: (context, reactive) => Timer(
          Duration(seconds: 2),
          () => reactive.setState((store) => store.checkLogin(),
                  onData: (context, data) {
                Provider.of<UserProvider>(context).setUser(data.userModel);
                Fluttertoast.showToast(
                    msg: "Selamat Datang", toastLength: Toast.LENGTH_LONG);
                Navigator.pushReplacementNamed(context, Routes.navBottomPage);
              }, onError: (context, error) {
                Fluttertoast.showToast(msg: "Silahkan login atau signup.");
              })),
      builder: (context, reactive) {
        return reactive.whenConnectionState(
            onIdle: () => SplashPage(),
            onWaiting: () => Container(),
            onData: (data) => Container(),
            onError: (error) => LoginPage());
      },
    );
  }
}
