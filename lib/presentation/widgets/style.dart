import 'package:aws_monitoring/external/color_helpers.dart';
import 'package:aws_monitoring/external/fontsize_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Decorasi di halaman login dan registrasi
InputDecoration inputDecorationPlusIconStyle(String text, Icon icon) {
  return InputDecoration(
      hintText: "$text",
      labelStyle: TextStyle(color: ColorHelpers.colorGrey),
      hintStyle: TextStyle(color: Colors.black45),
      prefixIcon: Icon(
        icon.icon,
        size: 35.0,
      ),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)));
}

//Decorasi di halaman ME, yang bisa menutup dan membuka form input
Flexible buildFlexibleExpansion(String subTitle, Icon icon, Color color) {
  return Flexible(
      child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
    ),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 9,
          child: Container(
              child: Text('$subTitle',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.pTSans(
                      fontSize: FontsizeHelpers.txtSize20,
                      textStyle: TextStyle(color: Colors.white)))),
        ),
        Expanded(
          flex: 1,
          child: Icon(
            icon.icon,
            color: Colors.white,
          ),
        ),
      ],
    ),
  ));
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
