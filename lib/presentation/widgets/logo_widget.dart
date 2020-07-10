import 'package:aws_monitoring/external/fontsize_helpers.dart';
import 'package:aws_monitoring/external/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  final double padding;

  const LogoWidget({Key key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: 'logo',
            child: Container(
              child: Image.asset(
                'assets/logo_bmkg.png',
                height: 40,
                width: 40,
              ),
            ),
          ),
          UIHelper.horizontalSpaceVerySmall,
          Text(
            "AWS Monitoring",
            style: GoogleFonts.poppins(
              textStyle:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
              fontSize: FontsizeHelpers.txtSize15,
            ),
          )
        ],
      ),
    );
  }
}
