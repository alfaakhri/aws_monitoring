import 'package:aws_monitoring/data/model/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel _userModel = UserModel();
  UserModel get userModel => this._userModel;

  void setUser(var data) {
    _userModel = data;
    notifyListeners();
  }

}