// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:aws_monitoring/presentation/master_page/root_page.dart';
import 'package:aws_monitoring/presentation/widgets/splash_page.dart';
import 'package:aws_monitoring/presentation/master_page/login_page.dart';
import 'package:aws_monitoring/presentation/master_page/registration_page.dart';
import 'package:aws_monitoring/presentation/master_page/nav_bottom_page.dart';
import 'package:aws_monitoring/presentation/page/home/me_page.dart';
import 'package:aws_monitoring/domain/usecase/aws_store.dart';

//Class ini adalah hasil generator 
class Routes {
  static const rootPage = '/';
  static const splashPage = '/splash-page';
  static const loginPage = '/login-page';
  static const registrationPage = '/registration-page';
  static const navBottomPage = '/nav-bottom-page';
  static const mePage = '/me-page';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Routes>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.rootPage:
        return MaterialPageRoute(
          builder: (_) => RootPage(),
          settings: settings,
        );
      case Routes.splashPage:
        return MaterialPageRoute(
          builder: (_) => SplashPage(),
          settings: settings,
        );
      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
          settings: settings,
        );
      case Routes.registrationPage:
        return MaterialPageRoute(
          builder: (_) => RegistrationPage(),
          settings: settings,
        );
      case Routes.navBottomPage:
        return MaterialPageRoute(
          builder: (_) => NavBottomPage(),
          settings: settings,
        );
      case Routes.mePage:
        if (hasInvalidArgs<MePageArguments>(args)) {
          return misTypedArgsRoute<MePageArguments>(args);
        }
        final typedArgs = args as MePageArguments ?? MePageArguments();
        return MaterialPageRoute(
          builder: (_) => MePage(
              key: typedArgs.key,
              awsStore: typedArgs.awsStore,
              isMe45: typedArgs.isMe45),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//MePage arguments holder class
class MePageArguments {
  final Key key;
  final AwsStore awsStore;
  final bool isMe45;
  MePageArguments({this.key, this.awsStore, this.isMe45});
}
