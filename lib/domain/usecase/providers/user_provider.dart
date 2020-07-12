import 'package:aws_monitoring/data/model/user_model.dart';
import 'package:flutter/material.dart';


//Class ini hanya berisi method untuk menampung data userModel.
//Fungsinya agar data user bisa digunakan secara reusable di berbagai widget.
//Contohnya digunakan di widget profil_page
class UserProvider extends ChangeNotifier {
  UserModel _userModel = UserModel();
  UserModel get userModel => this._userModel;

  void setUser(var data) {
    _userModel = data;
    notifyListeners();
  }

}