import 'dart:convert';

import 'package:aws_monitoring/data/model/me_model/me_model.dart';
import 'package:aws_monitoring/data/model/user_model.dart';
import 'package:aws_monitoring/external/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final databaseReference = Firestore.instance;

  Future<dynamic> addingDataAws(dynamic data, String name) async {
    try {
      DocumentReference ref =
          await databaseReference.collection(name).add(data);
      print(ref.documentID);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> getDataAws(String name) async {
    try {
      List<MeModel> list = List<MeModel>();
      await Firestore.instance.collection(name).getDocuments().then((value) {
        print(value.documents.length);
        value.documents.forEach((f) {
          list.add(MeModel.fromJson(json.decode(f.data["Data"])));
          print(list.length);
        });
      });
      return list;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> loginFirebase(String email, String password) async {
    UserModel userModel = UserModel();
    try {
      AuthResult user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await Firestore.instance
          .collection('users')
          .where("email", isEqualTo: user.user.email)
          .getDocuments()
          .then((event) {
        if (event.documents.isNotEmpty) {
          userModel = UserModel.fromJson(
              event.documents.single.data); //if it is a single document
        }
        return userModel;
      });
      return userModel;
    } catch (error) {
      switch (error.code) {
        case "ERROR_USER_NOT_FOUND":
          {
            throw Exception("Akun tidak ditemukan");
          }
          break;
        case "ERROR_WRONG_PASSWORD":
          {
            throw Exception("Password Salah");
          }
          break;
        default:
          {
            throw Exception("Error. Silahkan coba lagi.");
          }
      }
    }
  }

  Future registrationFirebase(
      String fullname, String email, String password, String address) async {
    try {
      AuthResult user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Firestore.instance.collection('users').document().setData(({
            'uid': user.user.uid,
            'fullname': fullname,
            'email': email,
            'address': address
          }));
      UserModel userModel = UserModel(
          uid: user.user.uid,
          email: email,
          fullname: fullname,
          address: address);
      return userModel;
    } catch (error) {
      switch (error.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
          {
            throw Exception("Email telah digunakan");
          }
          break;
        case "ERROR_WEAK_PASSWORD":
          {
            throw Exception("Password harus panjang 6 karakter atau lebih");
          }
          break;
        default:
          {
            throw Exception("Error. Silahkan coba lagi.");
          }
      }
    }
  }
}
