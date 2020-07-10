import 'dart:convert';

import 'package:aws_monitoring/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Service untuk menyimpan, mengambil dan menghapus data penyimpanan dari local database
class SharedPreferenceService {
  final String USER_DATA_PREFERENCE = "user_data";

  void saveUserData(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = json.encode(user);
    await prefs.setString(USER_DATA_PREFERENCE, userJson);
  }

  void clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<UserModel> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefsValue = prefs.getString(USER_DATA_PREFERENCE);
    UserModel userModel = UserModel.fromJson(json.decode(prefsValue));
    return userModel;
  }
}