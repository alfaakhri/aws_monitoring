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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _obscureText = true;
  TextEditingController _email;
  TextEditingController _password;
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
      body: StateBuilder<UserStore>(
          models: [Injector.getAsReactive<UserStore>()],
          builder: (context, reactive) {
            return reactive.whenConnectionState(
              onIdle: () => _showForm(context),
              onWaiting: () => Container(),
              onData: (data) => _showForm(context),
              onError: (error) => _showForm(context),
            );
          },
          child: _showForm(context)),
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
                LogoWidget(
                  padding: 0,
                ),
                SizedBox(
                  height: 120.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Masuk',
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
                      showEmailInput(),
                      UIHelper.verticalSpaceMedium,
                      showPasswordInput(),
                      UIHelper.verticalSpaceMedium,
                      showPrimaryButton(),
                      SizedBox(
                        height: 120.0,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Tidak memilikin akun ? "),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.registrationPage);
                              },
                              child: Text(
                                "Daftar",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
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

  TextFormField showPasswordInput() {
    return TextFormField(
      obscureText: _obscureText,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          ),
          hintText: 'Kata Sandi',
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.black45),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
      style: TextStyle(
        color: Colors.black,
      ),
      validator: (value) => _validator(value, 'password'),
      controller: _password,
    );
  }

  TextFormField showEmailInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.left,
      decoration:
          inputDecorationPlusIconStyle("Email", Icon(Icons.account_circle)),
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
            if (formKey.currentState.validate()) {
              DialogsPopup.showLoadingDialog(context, _keyLoader);

              reactiveModel
                  .setState((store) => store.login(_email.text, _password.text),
                      onData: (context, data) {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                    .pop();
                Fluttertoast.showToast(
                    msg: "Selamat Datang", toastLength: Toast.LENGTH_LONG);
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
          child: new Text('Masuk',
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
