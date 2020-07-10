import 'package:aws_monitoring/external/color_helpers.dart';
import 'package:aws_monitoring/presentation/page/history/history_page.dart';
import 'package:aws_monitoring/presentation/page/home/home_page.dart';
import 'package:aws_monitoring/presentation/page/profile/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavBottomPage extends StatefulWidget {
  @override
  _NavBottomPageState createState() => _NavBottomPageState();
}

class _NavBottomPageState extends State<NavBottomPage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30, color: ColorHelpers.colorWhite,),
            Icon(Icons.history, size: 30, color: ColorHelpers.colorWhite,),
            Icon(Icons.account_circle, size: 30, color: ColorHelpers.colorWhite,),
          ],
          color: Colors.blueAccent,
          buttonBackgroundColor: Colors.blueAccent,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: _buildContainer());
  }

  Widget _buildContainer() {
    switch (_page) {
      case 0:
        print("Page $_page");

        return HomePage();
        break;
      case 1:
        print("Page $_page");

        return HistoryPage();

        break;
      case 2:
        print("Page $_page");

        return ProfilePage();

        break;
      default:
    }
  }
}
