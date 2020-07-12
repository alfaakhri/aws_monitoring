import 'package:aws_monitoring/external/color_helpers.dart';
import 'package:aws_monitoring/external/fontsize_helpers.dart';
import 'package:aws_monitoring/external/ui_helpers.dart';
import 'package:flutter/material.dart';

//Widget ini khusus digunakan di halaman home page yang berisi content dari API
class ContainerSensor extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String data;
  final String unit;

  const ContainerSensor(
      {Key key, this.iconData, this.title, this.data, this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorHelpers.colorWhite,
        borderRadius: new BorderRadius.circular(15.0),
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Container(
            width: 220,
            child: Row(
              children: <Widget>[
                Icon(
                  iconData,
                  size: 35,
                  color: Colors.blue,
                ),
                UIHelper.horizontalSpaceSmall,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: FontsizeHelpers.sizeFontSensor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      unit,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              data,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}