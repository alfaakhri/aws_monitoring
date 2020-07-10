import 'package:aws_monitoring/data/model/user_model.dart';
import 'package:aws_monitoring/data/service/firebase_service.dart';
import 'package:aws_monitoring/data/service/shared_preference_service.dart';

class UserStore {
  FirebaseService _firebaseService = FirebaseService();
  UserModel _userModel = UserModel();
  UserModel get userModel => this._userModel;

  void setUser(var data) {
    _userModel = data;
  }

  Future login(String email, String password) async {
    try {
      await _firebaseService.loginFirebase(email, password).then((value) {
        _userModel = value;
      });
    } catch (e) {
      throw e;
    }
  }

  Future registration(
      String fullname, String email, String address, String password) async {
    try {
      _userModel = await _firebaseService.registrationFirebase(
          fullname, email, password, address);
    } catch (e) {
      throw e;
    }
  }

  Future checkLogin() async {
    try {
      _userModel = await SharedPreferenceService().getUserData();
    } catch (e) {
      throw e;
    }
  }
}
