import 'package:aws_monitoring/external/color_helpers.dart';
import 'package:aws_monitoring/external/fontsize_helpers.dart';
import 'package:aws_monitoring/external/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelpers.colorWhite,
      body: Hero(
        tag: "logo",
        child: Container(
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/logo_bmkg.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                UIHelper.verticalSpaceSmall,
                Text(
                  "AWS Monitoring",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.blue.shade900),
                    fontSize: FontsizeHelpers.txtSize20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
} 