import 'package:flutter/material.dart';

//Service untuk mendapatkan tanggal
class DatePickerService {
  DateTime selectedDate = DateTime.now();

  DatePickerService({this.selectedDate});

  Future selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      // firstDate: DateTime.now().subtract(Duration(days: 1)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(Duration(days: 1095)),
    );
    if (picked != null && picked != selectedDate) return selectedDate = picked;
  }
}
