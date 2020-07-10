import 'package:aws_monitoring/data/service/shared_preference_service.dart';
import 'package:aws_monitoring/domain/routes/routes.gr.dart';
import 'package:aws_monitoring/domain/usecase/providers/user_provider.dart';
import 'package:aws_monitoring/domain/usecase/user_store.dart';
import 'package:aws_monitoring/external/color_helpers.dart';
import 'package:aws_monitoring/external/fontsize_helpers.dart';
import 'package:aws_monitoring/external/ui_helpers.dart';
import 'package:aws_monitoring/presentation/widgets/dialogs_popup.dart';
import 'package:aws_monitoring/presentation/widgets/logo_widget.dart';
import 'package:aws_monitoring/presentation/widgets/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _obscureText = true;
  bool _obscureTextConfirm = true;

  TextEditingController _email = TextEditingController();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _address = TextEditingController();

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final reactiveModel = Injector.getAsReactive<UserStore>();

  _validator(String value, String textWarning) {
    if (value.isEmpty) {
      return 'Harap mengisi $textWarning';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorHelpers.colorWhite,
      body: _showForm(context),
    );
  }

  Widget _showForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Daftar',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: FontsizeHelpers.txtSize16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                UIHelper.verticalSpaceSmall,
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.black38),
                          ),
                          child: showFullnameInput()),
                      UIHelper.verticalSpaceMedium,
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.black38),
                          ),
                          child: showEmailInput()),
                      UIHelper.verticalSpaceMedium,
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.black38),
                          ),
                          child: showAddressInput()),
                      UIHelper.verticalSpaceMedium,
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.black38),
                          ),
                          child: showPasswordInput()),
                      UIHelper.verticalSpaceMedium,
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.black38),
                          ),
                          child: showConfirmPasswordInput()),
                      UIHelper.verticalSpaceMedium,
                      showPrimaryButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField showFullnameInput() {
    return TextFormField(
      textAlign: TextAlign.left,
      decoration: inputDecorationPlusIconStyle(
          "Nama Lengkap", Icon(Icons.account_circle)),
      style: TextStyle(
        color: Colors.black,
      ),
      validator: (value) => _validator(value, 'nama lengkap'),
      controller: _fullname,
    );
  }

  TextFormField showAddressInput() {
    return TextFormField(
      textAlign: TextAlign.left,
      decoration: inputDecorationPlusIconStyle("Alamat", Icon(Icons.home)),
      style: TextStyle(
        color: Colors.black,
      ),
      validator: (value) => _validator(value, 'alamat'),
      controller: _address,
    );
  }

  TextFormField showPasswordInput() {
    return TextFormField(
      obscureText: _obscureText,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        border: InputBorder.none,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        ),
        icon: Icon(
          Icons.lock,
          size: 35.0,
        ),
        hintText: 'Kata Sandi',
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black45),
      ),
      style: TextStyle(
        color: Colors.black,
      ),
      validator: (val) {
        if (val.isEmpty) return 'Harap mengisi kata sandi';
        return null;
      },
      controller: _password,
    );
  }

  TextFormField showConfirmPasswordInput() {
    return TextFormField(
      obscureText: _obscureTextConfirm,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        border: InputBorder.none,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureTextConfirm = !_obscureTextConfirm;
            });
          },
          child: Icon(
              _obscureTextConfirm ? Icons.visibility_off : Icons.visibility),
        ),
        icon: Icon(
          Icons.lock,
          size: 35.0,
        ),
        hintText: 'Konfirmasi Kata Sandi',
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black45),
      ),
      style: TextStyle(
        color: Colors.black,
      ),
      validator: (val) {
        if (val.isEmpty) return 'Harap mengisi konfirmasi kata sandi';
        if (val != _password.text) return 'Tidak Cocok';
        return null;
      },
      controller: _confirmPassword,
    );
  }

  TextFormField showEmailInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.left,
      decoration: inputDecorationPlusIconStyle("Email", Icon(Icons.email)),
      style: TextStyle(
        color: Colors.black,
      ),
      validator: (value) => _validator(value, 'email'),
      controller: _email,
    );
  }

  Widget showPrimaryButton() {
    return Container(
      width: double.infinity,
      child: Material(
        elevation: 5.0,
        child: RaisedButton(
          color: ColorHelpers.colorGreen,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () async {
            if (formKey.currentState.validate() == true) {
              DialogsPopup.showLoadingDialog(context, _keyLoader);

              reactiveModel.setState(
                  (store) => store.registration(_fullname.text, _email.text,
                      _address.text, _password.text), onData: (context, data) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
                Provider.of<UserProvider>(context).setUser(data.userModel);
                SharedPreferenceService().saveUserData(data.userModel);
                Navigator.pushReplacementNamed(context, Routes.navBottomPage);
              }, onError: (context, error) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
                Fluttertoast.showToast(
                    msg: error.message.toString(),
                    toastLength: Toast.LENGTH_LONG);
              });
            }
          },
          child: new Text('Daftar',
              style: new TextStyle(
                fontSize: FontsizeHelpers.txtSize20,
                color: Colors.white,
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
